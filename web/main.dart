import 'dart:html';
import 'package:polymer/polymer.dart';

void main() {
  initPolymer();
  querySelector("dc-header").on['page-change'].listen((event) {
    querySelector("#dc-content").setAttribute("selected", event.detail);
  });
}