import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_tabs.dart';
import 'package:paper_elements/paper_tab.dart';

@CustomTag('dc-header')
class DCHeaderElement extends PolymerElement {
  final List<String> tabs = ["HOME", "PROJECTS", "DEVELOPERS"];
  @observable String branding = "DirectCode";

  DCHeaderElement.created() : super.created() {
    addEventListener('core-select', (CustomEvent event) {
      var selected = ((shadowRoot.querySelector("paper-tabs") as PaperTabs).selectedItem as PaperTab);
      if (selected != null) {
        asyncFire("page-change", detail: tabs.indexOf(selected.text).toString());
      }
    });
  }
}
