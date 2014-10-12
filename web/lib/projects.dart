import 'package:polymer/polymer.dart';
import 'dart:html';

import 'package:dcsite/services.dart';

@CustomTag('dc-projects')
class DCProjectsElement extends PolymerElement {
  DCProjectsElement.created() : super.created();
  
  @override
  attached() {
    projectsList.get().then((projects) {
      for (var project in projects) {
        print(project.name);
      }
    });
  }
}
