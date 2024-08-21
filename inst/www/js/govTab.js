$(document).on('click', '.govbr-tabs__list-item', function(e) {

  // Get some ids for the button that was clicked.  Need a few things to make
  // isolate to the correct table
  var str = e.target.name;
  var tab = str.substring(0, str.length-2);
  var tabID = $('[name="' + str + '"]').parent().parent()[0].id;
  var mainID = tabID.substring(0, tabID.length-3);

  // Remove selected tab from all tabs and add hidden to all tables
  $("#" + tabID).children().removeClass("govbr-tabs__list-item--selected");
  $('[name$="-' + mainID + '-table"]').addClass("govbr-tabs__panel--hidden");

  // Add back the selected tab that was clicked and unhide right table
  $('[name="' + tab + '-t"]').addClass("govbr-tabs__list-item--selected");
  $('[name="' + tab + '-' + mainID + '-table"]').removeClass("govbr-tabs__panel--hidden");

});
