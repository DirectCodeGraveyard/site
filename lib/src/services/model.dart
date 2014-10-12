part of dcsite.services;

class Project {
  final String name;
  final String description;
  final String url;

  Project(this.name, this.description, this.url);
  
  static Project fromJson(input) {
    return new Project(input['name'], input['description'], input['url']);
  }
}
