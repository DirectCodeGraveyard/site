var directcode = {
    _data_: {
        logger: {
            silent: false,
            debug: false
        }
    }
};

/**
 * A Simple Function to get/change the title using jQuery.
 */
directcode.title = function(val) {
    if (!val) {
        return $("head").find("title").text();
    } else {
        $("head").find("title").text(val);
    }
};

directcode.debug = function(line) {
    if (directcode._data_.logger.debug) {
        console.log("[DirectCode][DEBUG] " + line);
    }
};

directcode.log = function(line) {
    if (!directcode._data_.logger.silent) {
        console.log("[DirectCode] " + line);
    }
};

$(document).ready(function() {
    directcode.log("Page Ready");
});
