(function() {
  "use strict";

  var scheduled = false;

  function govbrInit() {
    scheduled = false;
    if (!window.core || !window.core.Globals) return;

    if (!window.govbrGlobals) {
      window.govbrGlobals = new window.core.Globals();
    }
    var globals = window.govbrGlobals;
    var proto = Object.getPrototypeOf(globals);

    // Cada componente é inicializado isoladamente: markup incompleto de
    // um componente não deve impedir a inicialização dos demais.
    Object.getOwnPropertyNames(proto).forEach(function(method) {
      if (method.indexOf("initInstance") === 0 && method !== "initInstanceAll") {
        try {
          proto[method].call(globals);
        } catch (e) {
          if (window.console && window.console.debug) {
            window.console.debug("govbr: " + method + " falhou:", e.message);
          }
        }
      }
    });
  }

  function scheduleInit() {
    if (scheduled) return;
    scheduled = true;
    if (window.requestAnimationFrame) {
      window.requestAnimationFrame(govbrInit);
    } else {
      setTimeout(govbrInit, 16);
    }
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", scheduleInit);
  } else {
    scheduleInit();
  }

  // Re-inicializa componentes GovBR renderizados dinamicamente pelo Shiny
  // (renderUI / uiOutput / insertUI).
  if (window.jQuery) {
    jQuery(document).on("shiny:value shiny:bound", scheduleInit);
  } else {
    document.addEventListener("shiny:value", scheduleInit);
  }

  // Expõe para uso manual se necessário
  window.govbrInitAll = scheduleInit;
})();

// Input binding para br_date_input(): o valor chega ao servidor como Date
// (type "shiny.date"), convertido do formato dd/mm/aaaa do GovBR.
var govbrDateTimeBinding = new Shiny.InputBinding();
jQuery.extend(govbrDateTimeBinding, {
  find: function(scope) {
    return jQuery(scope).find(".br-datetimepicker");
  },
  getId: function(el) {
    return el.id;
  },
  getType: function(el) {
    return "shiny.date";
  },
  getValue: function(el) {
    var raw = jQuery(el).find("input[data-input]").val();
    if (!raw) return null;
    var m = raw.match(/^(\d{2})\/(\d{2})\/(\d{4})$/);
    if (!m) return null;
    return m[3] + "-" + m[2] + "-" + m[1];
  },
  setValue: function(el, value) {
    var iso = null;
    if (value instanceof Date && !isNaN(value)) {
      iso = value.toISOString().slice(0, 10);
    } else if (typeof value === "string") {
      var m = value.match(/^(\d{4})-(\d{2})-(\d{2})/);
      if (m) iso = m[0];
    }
    if (iso) {
      var parts = iso.split("-");
      var input = jQuery(el).find("input[data-input]");
      input.val(parts[2] + "/" + parts[1] + "/" + parts[0]);
      input.trigger("change");
    }
  },
  subscribe: function(el, callback) {
    jQuery(el).on("change.govbrDateTime input.govbrDateTime", function() {
      callback(false);
    });
  },
  unsubscribe: function(el) {
    jQuery(el).off(".govbrDateTime");
  },
  receiveMessage: function(el, data) {
    if (data.hasOwnProperty("value")) {
      this.setValue(el, data.value);
    }
    if (data.hasOwnProperty("label")) {
      jQuery(el).find("label").first().text(data.label);
    }
    jQuery(el).trigger("change");
  }
});
Shiny.inputBindings.register(govbrDateTimeBinding, "shinyGovBRstyle.govbrDateTime");

// Input binding para br_tabs(): valor = índice (1-based) do tab ativo.
var govbrTabsBinding = new Shiny.InputBinding();
jQuery.extend(govbrTabsBinding, {
  find: function(scope) {
    return jQuery(scope).find("[data-govbr-tabs]");
  },
  getId: function(el) {
    return el.getAttribute("data-govbr-tabs") || el.id;
  },
  getValue: function(el) {
    var stored = parseInt(el.getAttribute("data-govbr-active-tab"), 10);
    if (!isNaN(stored) && stored > 0) return stored;
    var active = jQuery(el).find(".tab-item.active").first();
    return active.length ? active.index() + 1 : 1;
  },
  setValue: function(el, value) {
    var index = parseInt(value, 10);
    if (isNaN(index) || index < 1) return;
    el.setAttribute("data-govbr-active-tab", index);
    jQuery(el)
      .find(".tab-nav .tab-item button")
      .eq(index - 1)
      .trigger("click");
  },
  subscribe: function(el, callback) {
    jQuery(el).on("click.govbrTabs", ".tab-nav .tab-item button", function(event) {
      var clicked = jQuery(event.currentTarget).closest(".tab-item").index() + 1;
      el.setAttribute("data-govbr-active-tab", clicked);
      callback(false);
    });
  },
  unsubscribe: function(el) {
    jQuery(el).off(".govbrTabs");
  },
  receiveMessage: function(el, data) {
    if (data.hasOwnProperty("selected")) {
      this.setValue(el, data.selected);
    }
  }
});
Shiny.inputBindings.register(govbrTabsBinding, "shinyGovBRstyle.govbrTabs");

// Input binding para br_pagination(): valor = página atual.
var govbrPaginationBinding = new Shiny.InputBinding();
jQuery.extend(govbrPaginationBinding, {
  find: function(scope) {
    return jQuery(scope).find("[data-govbr-pagination]");
  },
  getId: function(el) {
    return el.getAttribute("data-govbr-pagination") || el.id;
  },
  getValue: function(el) {
    var active = jQuery(el).find(".page.active").first();
    if (active.length) {
      return parseInt(active.text().trim(), 10);
    }
    var current = parseInt(el.getAttribute("data-current"), 10);
    return isNaN(current) ? 1 : current;
  },
  setValue: function(el, value) {
    var page = parseInt(value, 10);
    if (isNaN(page) || page < 1) return;
    el.setAttribute("data-current", page);
    jQuery(el)
      .find(".page")
      .removeClass("active")
      .removeAttr("aria-current")
      .filter(function() {
        return jQuery(this).text().trim() === String(page);
      })
      .addClass("active")
      .attr("aria-current", "page");
  },
  subscribe: function(el, callback) {
    jQuery(el).on("click.govbrPagination", "a.page, [data-next-page], [data-previous-page]", function() {
      // O JS do GovBR atualiza data-current no próprio clique; adia a
      // leitura para depois do handler oficial.
      setTimeout(function() { callback(false); }, 60);
    });
  },
  unsubscribe: function(el) {
    jQuery(el).off(".govbrPagination");
  },
  receiveMessage: function(el, data) {
    if (data.hasOwnProperty("selected")) {
      this.setValue(el, data.selected);
    }
  }
});
Shiny.inputBindings.register(govbrPaginationBinding, "shinyGovBRstyle.govbrPagination");

// Input binding para br_step(): valor = índice (1-based) do passo clicado.
var govbrStepBinding = new Shiny.InputBinding();
jQuery.extend(govbrStepBinding, {
  find: function(scope) {
    return jQuery(scope).find("[data-govbr-step]");
  },
  getId: function(el) {
    return el.getAttribute("data-govbr-step") || el.id;
  },
  getValue: function(el) {
    var stored = parseInt(el.getAttribute("data-govbr-active-step"), 10);
    if (!isNaN(stored) && stored > 0) return stored;
    var initial = parseInt(el.getAttribute("data-initial"), 10);
    return isNaN(initial) ? 1 : initial;
  },
  setValue: function(el, value) {
    var index = parseInt(value, 10);
    if (isNaN(index) || index < 1) return;
    el.setAttribute("data-govbr-active-step", index);
    el.setAttribute("data-initial", index);
    var btns = jQuery(el).find(".step-progress-btn");
    btns.removeClass("active").attr("aria-selected", "false");
    btns.eq(index - 1).addClass("active").attr("aria-selected", "true");
  },
  subscribe: function(el, callback) {
    jQuery(el).on("click.govbrStep", ".step-progress-btn", function(event) {
      var clicked = jQuery(event.currentTarget).index() + 1;
      el.setAttribute("data-govbr-active-step", clicked);
      callback(false);
    });
  },
  unsubscribe: function(el) {
    jQuery(el).off(".govbrStep");
  },
  receiveMessage: function(el, data) {
    if (data.hasOwnProperty("selected")) {
      this.setValue(el, data.selected);
    }
  }
});
Shiny.inputBindings.register(govbrStepBinding, "shinyGovBRstyle.govbrStep");
