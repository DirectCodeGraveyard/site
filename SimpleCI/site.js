$("#learn-more").click(function() {
    bootbox.alert('<p><b class="learn-more-alert">SimpleCI is a CI built to provide a simple interface but still have all the good features! These include, IRC Support, Easy Plugins, Easy-to-use interface, Security support, and more!</b></p>');
});

var contribList = $("#contributor-list");

var contributors = [{
    name: "Kenneth Endfinger",
    link: "https://github.com/kaendfinger/"
}, {
    name: "samrg472",
    link: "https://github.com/samrg472/"
}, {
    name: "Logan Gorence",
    link: "https://github.com/logangorence/"
}];

contributors.forEach(function(contributor) {
    contribList.append('<tr><td><a href="' + contributor.link + '">' + contributor.name + '</a></td></tr>');
});

var contribData = $("#contributors").html();

$("#show-contributors").click(function() {
    bootbox.alert(contribData);
});
