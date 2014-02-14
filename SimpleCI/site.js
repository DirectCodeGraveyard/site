$("#learn-more").click(function() {
    bootbox.alert('<p><b class="learn-more-alert">SimpleCI is a CI built to provide a simple interface but still have all the good features! These include, IRC Support, Easy Plugins, Easy-to-use interface, Security support, and more!</b></p>');
});

var contribList = $("#contributor-list");

[
    "Kenneth Endfinger",
    "samrg472",
    "Logan Gorence"
].forEach(function (contributor) {
    contribList.append('<tr><td>' + contributor + '</td></tr>');
});