(function() {
  "use strict";

  if (window.Shiny && window.Shiny.addCustomMessageHandler) {
    window.Shiny.addCustomMessageHandler(
      "govbrUpdatePageTitle",
      function(title) {
        document.title = title;
      }
    );
  }
})();
