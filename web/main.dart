import 'dart:html';
import 'package:polymer/polymer.dart';

void main() {
  initPolymer().run(() {
    Polymer.onReady.then((_) {
      querySelector("dc-header").on['page-change'].listen((event) {
        querySelector("#dc-content").setAttribute("selected", event.detail);
      });
    });
  });
}
