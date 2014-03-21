var projects, categories, current;

$.getJSON("list.json", function(data) {
    projects = data;
    categories = [];
    projects.forEach(function(project) {
        project.categories.forEach(function(category) {
            if (categories.indexOf(category) === -1) {
                categories.push(category);
            }
        });
    });

    categories.forEach(function(category) {
        $("#categories").append('<li><a href="#">' + category + '</a></li>');
    });

    current = "All Projects";

    writeAllProjects();

    $("#categories > li").click(function() {
        var $this = $(this);
        $("#categories > li").removeClass("active");
        $this.addClass("active");
        current = $($this.children()[0]).html();
        writeCategory(current);
    });
});

function writeProject(project) {
    $("#projects").append('<div class="col-md-4"><h1></p><a class="btn btn-primary btn-lg btn-block" href="' + project.url + '"><h4><i class="fa fa-fw fa-' + project.icon + '"></i> ' + project.name + '</h4></a></h1></div>');
}

function writeAllProjects() {
    projects.forEach(writeProject);
}

function writeCategory(category) {
    $("#projects").children().remove();
    if (category === "All Projects") {
        writeAllProjects();
    } else {
        projects.forEach(function(project) {
            if (project.categories.indexOf(category) !== -1) {
                writeProject(project);
            }
        });
    }
}