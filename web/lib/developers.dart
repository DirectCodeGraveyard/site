import 'dart:html';
import 'dart:convert' show JSON;
import 'package:polymer/polymer.dart';

@CustomTag('dc-developers')
class DCDevelopersElement extends PolymerElement {
  @observable ObservableList<Developer> developers = new ObservableList<Developer>();

  DCDevelopersElement.created() : super.created();
  
  @override
  void attached() {
    super.attached();
    loadDevelopers();
  }

  void loadDevelopers() {
    HttpRequest.getString("developers.json").then((value) => JSON.decode(value)).then((devs) {
      print("Loaded Developers");
      developers.addAll(devs.map((dev) => new Developer.fromJSON(dev)));
    });
  }
}

void onDeveloperButtonClick(Event event, detail, Node target) {
  print("Button Clicked");
}

class Developer {
  final String name;
  final String biography;
  final String id;

  Developer(this.name, this.biography, this.id);

  factory Developer.fromJSON(Map map) {
    return new Developer(map['name'], map['biography'], map['id']);
  }
}
