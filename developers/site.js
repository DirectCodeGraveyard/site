var $list = $("#list");

var developers = [
   {
      name: "Kenneth Endfinger"
   },
   {
      name: "samrg472"
   },
   {
      name: "TheMike"
   },
   {
      name: "Logan"
   }
];

developers.forEach(function (developer) {
   $list.append("<tr><td>" + developer.name + "</td></tr>");
});