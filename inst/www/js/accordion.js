$(document).on('click', '.govbr-accordion__section-button', function(e) {

  var str = e.target.name;
  var level = str.substring(str.length-1);

  var cur_class = $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent()[0].classList.value

  if(cur_class == "govbr-accordion__section") {
    $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent().addClass("govbr-accordion__section--expanded");
    $('[name="accordion-default-heading-' + level + '"]').children().children().children().removeClass("govbr-accordion-nav__chevron--down")[0];
  } else {
    $('[name="accordion-default-heading-' + level + '"]').parent().parent().parent().removeClass("govbr-accordion__section--expanded");
    $('[name="accordion-default-heading-' + level + '"]').children().children().children().addClass("govbr-accordion-nav__chevron--down")[0];
  }

});

$(document).on('click', '.govbr-accordion__show-all', function(e) {

  var sections = document.getElementsByClassName('govbr-accordion__section');
  var chevrons = document.getElementsByClassName('govbr-accordion-nav__chevron');


  for(var i=0; i< sections.length; i++){
    if(sections[i].classList.value == "govbr-accordion__section") {
      sections[i].classList.add("govbr-accordion__section--expanded");
      chevrons[i].classList.remove("govbr-accordion-nav__chevron--down");
    } else {
      sections[i].classList.remove("govbr-accordion__section--expanded");
      chevrons[i].classList.add("govbr-accordion-nav__chevron--down");
    }
    console.log(chevrons[i].classList.value);
  }



});

