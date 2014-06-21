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
    directcode.debug('directcode.title("' + val + '") called');
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
    directcode.debug('directcode.log("' + line + '") called');
    if (!directcode._data_.logger.silent) {
        console.log("[DirectCode] " + line);
    }
};

directcode.init = function() {
    directcode.debug("directcode.init() called");
    var path = "../js/";
    $("script").find(function (i, e) {
        var src = $(e).attr("src");
        if (typeof src !== "undefined" && src.indexOf("site.js") !== -1) {
            path = $(e).attr("src").replace("site.js", "");
        }
    });
    $.getScript(path + "analytics.js");
    $(document).ready(function() {
        directcode.log("Page Ready");
    });
};

directcode.init();
