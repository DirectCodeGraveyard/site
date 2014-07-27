import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('dc-header')
class DCHeaderElement extends PolymerElement {
  final List<String> tabs = ["PROJECTS", "DEVELOPERS", "SPONSORS"];

  DCHeaderElement.created() : super.created() {
    this.addEventListener("core-select", (event) {
      if(event.detail.item.textContent) {
        this.asyncFire("page-change", this.tabs.indexOf(event.detail.item.textContent));
      }
    });
  }
}
