$(document).on('click', '.govbr-accordion__section-button', function(e) {
// individual section buttons

  // get 'name' value from button
  var str = e.target.name;

  // get z value from name (Map argument)
  var level = str.substr(str.length - 2);



  // get class from top div
  var cur_class = $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent()[0].classList.value

  // check if "govbr-accordion__section--expanded" has already been added to the top div class
  if(cur_class == "govbr-accordion__section") {

    // add  "govbr-accordion__section--expanded" to top div class

    $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent().addClass("govbr-accordion__section--expanded");
    // remove chevron transform class

    $('[name="accordion-default-heading-' + level + '"]').children().children().children().removeClass("govbr-accordion-nav__chevron--down")[0];
    // edit toggle text
    $('[name="accordion-default-heading-' + level + '"]').children().children().children()[1].innerHTML = "Hide"

  } else {
    // remove "govbr-accordion__section--expanded" to top div class
    $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent().removeClass("govbr-accordion__section--expanded");
    // add chevron transform class
    $('[name="accordion-default-heading-' + level + '"]').children().children().children().addClass("govbr-accordion-nav__chevron--down")[0];

     // edit toggle text
    $('[name="accordion-default-heading-' + level + '"]').children().children().children()[1].innerHTML = "Show"

     // if any section set to hidden want "Show all text" and chevron down
    document.getElementById("show-all-chevron").classList.add("govbr-accordion-nav__chevron--down")
    document.getElementsByClassName("govbr-accordion__show-all-text")[0].innerHTML = "Show all sections"
  }

});

// show all button

$(document).on('click', '.govbr-accordion__show-all', function(e) {

  // get all section elements
  var sections = document.getElementsByClassName('govbr-accordion__section');

  // get all chevron elements

  var chevrons = document.getElementsByClassName('govbr-accordion-nav__chevron');

  // get toggle text element
  var toggle_text = document.getElementsByClassName('govbr-accordion__section-toggle-text');

  // get current class value for the show all chevron
  var show_all_chevron_class = document.getElementById("show-all-chevron").classList.value;


  for (var i = 0; i < sections.length; i++) {

    // check direction of Show all chevron
    if (show_all_chevron_class != "govbr-accordion-nav__chevron") {

      // switch Show all text and chevon direction
      document.getElementsByClassName("govbr-accordion__show-all-text")[0].innerHTML = "Hide all sections";
      chevrons[0].classList.remove("govbr-accordion-nav__chevron--down");

      // only switch individual sections if they are closed
      if (sections[i].classList.value == "govbr-accordion__section") {
        sections[i].classList.add("govbr-accordion__section--expanded");

        // note: chevron elements length one greater than section length due to show all/hide all chevron
        chevrons[i + 1].classList.remove("govbr-accordion-nav__chevron--down");

        // change individual section text to "Hide"
        toggle_text[i].innerHTML = "Hide";

      }


    } else {

      // this else section does the opposite of the if section above
      document.getElementsByClassName("govbr-accordion__show-all-text")[0].innerHTML = "Show all sections";
      chevrons[0].classList.add("govbr-accordion-nav__chevron--down");

      if (sections[i].classList.value != "govbr-accordion__section") {
        sections[i].classList.remove("govbr-accordion__section--expanded");
        chevrons[i + 1].classList.add("govbr-accordion-nav__chevron--down");

        toggle_text[i].innerHTML = "Show";

      }

    }

  }



});

