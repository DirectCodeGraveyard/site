part of dcsite.services;

const String API_URL = "http://services.directcode.org";

final APIEndpoint<List<Project>> projectsList = new APIEndpoint<List<Project>>("/projects/list", listCreator(Project.fromJson));

typedef T JSONProducer<T>(input);

JSONProducer<List<dynamic>> listCreator(JSONProducer producer) {
  return (List<dynamic> input) {
    return input.map((it) {
      return producer(it);
    }).toList();
  };
}

returnInput(input) => input;

class APIEndpoint<T> {
  final String path;
  final JSONProducer<T> producer;
  
  APIEndpoint(this.path, this.producer);
  APIEndpoint.json(this.path) : producer = returnInput;
  
  Future<T> get() {
    return HttpRequest.getString("${API_URL}/api${path}").then((value) {
      return JSON.decode(value);
    });
  }
}
