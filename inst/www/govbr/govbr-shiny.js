(function() {
  "use strict";

  var scheduled = false;

  function govbrInit() {
    scheduled = false;
    if (window.core && window.core.Globals) {
      try {
        new window.core.Globals().initInstanceAll();
      } catch (e) {
        if (window.console) console.error("govbr init error:", e);
      }
    }
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
