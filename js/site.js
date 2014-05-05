var directcode = {};

/**
 * A Simple Function to get/change the title using jQuery. 
 */
directcode.title = function (val) {
    if (!val) {
        return $("head").find("title").text();
    } else {
        $("head").find("title").text(val);
    }
};