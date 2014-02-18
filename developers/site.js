var $list = $("#list");

var developers = [
   {
      name: "Kenneth Endfinger"
   }
];

developers.forEach(function (developer) {
   $list.append("<tr><td>" + developer.name + "</td></tr>");
});