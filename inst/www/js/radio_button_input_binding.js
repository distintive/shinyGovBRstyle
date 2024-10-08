var exports4but = window.Shiny = window.Shiny || {};
var $escape4but = exports4but.$escape = function(val) {
  return val.replace(/([!"#$%&'()*+,.\/:;<=>?@\[\\\]^`{|}~])/g, '\\$1');
};

// radioGroupButtons input binding
var radioGroupButtonsBinding2 = new Shiny.InputBinding();
$.extend(radioGroupButtonsBinding2, {
  find: function(scope) {
    return $(scope).find('.govbr-radios');
  },
  getId: function(el) {
    return el.id;
  },
  getValue: function(el) {
    return $('input:radio[name="' + $escape4but(el.id) + '"]:checked').val();
  },
  setValue: function(el, value) {
    $('input:radio[name="' + $escape4but(el.id) + '"][value="' + $escape4but(value) + '"]').prop('checked', true);
    $('input:radio[name="' + $escape4but(el.id) + '"]').parent().removeClass('active');
    $('input:radio[name="' + $escape4but(el.id) + '"][value="' + $escape4but(value) + '"]').parent().addClass('active');
  },
  subscribe: function(el, callback) {
    $(el).on('change.radioGroupButtonsBinding2', function (event) {
        callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off('.radioGroupButtonsBinding2');
  },
  getState: function getState(el) {
      var $objs = $('input:radio[name="' + $escape4but(el.id) + '"]');

      // Store options in an array of objects, each with with value and label
      var options = new Array($objs.length);
      for (var i = 0; i < options.length; i++) {
        options[i] = { value: $objs[i].value,
        label: this._getLabel($objs[i]) };
      }

      return {
        label: $(el).parent().find('label[for="' + $escape4but(el.id) + '"]').text(),
        value: this.getValue(el),
        options: options
    };
  },
  receiveMessage: function receiveMessage(el, data) {
      var $el = $(el);

      // This will replace all the options
      if (data.hasOwnProperty('options')) {
        $el.find('govbr-radios govbr-radios--inline').empty();
        $el.find('govbr-radios govbr-radios--inline').append(data.options);
      }

      if (data.hasOwnProperty('selected'))
        this.setValue(el, data.selected);

      if (data.hasOwnProperty('label'))
        $(el).parent().find('label[for="' + $escape4but(el.id) + '"]').text(data.label);

      $(el).trigger('change');
  }
});

Shiny.inputBindings.register(radioGroupButtonsBinding2, 'shiny.radioGroupButtonsInput');
