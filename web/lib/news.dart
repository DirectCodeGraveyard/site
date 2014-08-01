import 'package:polymer/polymer.dart';

import 'dart:html';
import 'dart:convert';

@CustomTag('dc-news')
class DCNewsElement extends PolymerElement {
  @observable List<Article> articles = [];

  DCNewsElement.created() : super.created() {
    fetchArticles();
  }
  
  void fetchArticles() {
    HttpRequest.getString("news.json").then((data) {
      var json = JSON.decode(data);
      articles = json.map((it) => new Article.fromJSON(it));
    });
  }
}

class Article {
  String title;
  String link;

  Article(this.title, this.link);

  Article.fromJSON(Map input)
      : title = input['title'],
        link = input['link'];
}
