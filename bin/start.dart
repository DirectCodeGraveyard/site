import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:ansicolor/ansicolor.dart';

Map<dynamic, dynamic> config;
AnsiPen pen = new AnsiPen()..yellow(bold: true);

Future<String> get(String path) {
  var completer = new Completer<String>();

  String contents;
  (new HttpClient()).getUrl(Uri.parse(path))
  .then((req) => req.close())
  .then((res) {
    var contents = "";
    res.transform(UTF8.decoder).listen((String data) {
      contents += data;
    }, onDone: () {
      completer.complete(contents);
    });
  });

  return completer.future;
}

Future github() {
  var completer = new Completer();
  var reqs = <Future<String>>[];

  reqs.add(get("https://api.github.com/orgs/" + config['org'] + "/members"));
  reqs.add(get("https://api.github.com/orgs/" + config['org'] + "/repos"));

  Future.wait(reqs).then((values) {
    var members = JSON.decode(values[0]);
    var repos = JSON.decode(values[1]);

    var members_new = <Map<String, Object>>[];
    var repos_new = <Map<String, Object>>[];

    for(Map<dynamic, dynamic> member in members) {
      members_new.add({
        'name': member['login'],
        'avatar': member['avatar_url']
      });
    }

    for(Map<dynamic, dynamic> repo in repos) {
      repos_new.add({
        'name': repo['name'],
        'url': repo['html_url'],
        'language': repo['language'],
        'forks': repo['forks'],
        'open_issues': repo['open_issues'],
        'fork': repo['fork']
      });
    }

    var file = new File('build/api/members.json');
    file.createSync();
    file.writeAsStringSync(JSON.encode(members_new));

    file = new File('build/api/repos.json');
    file.createSync();
    file.writeAsStringSync(JSON.encode(repos_new));

    print("Regenerated Github API files.");
    completer.complete(null);
  });
  return completer.future;
}

void main(List<String> args) {
  var config_file = new File("config.json");
  if(!config_file.existsSync()) {
    (new File("config.json.example")).copySync("config.json");
    print("Copied example configuration to config.json.");
  }
  config = JSON.decode(config_file.readAsStringSync());

  github().then((val) {
    new Timer.periodic(new Duration(minutes: 5), github);

    HttpServer.bind(config['host'], config['port']).then((server) {
      print("Server listening on ${pen(config['host'] + ':' + config['port'].toString())}.");
      server.listen((HttpRequest req) {
        String path = req.uri.toString() == "/" ? "/index.html" : req.uri.toString();
        path = "build" + path;

        var file = new File(path);

        if(file.existsSync()) {
          req.response.write(file.readAsStringSync());
          print(pen("GET") + " $path");
        } else {
          req.response.write("404");
          print(pen.xterm(2)("404") + " $path");
        }
        req.response.close();
      });
    });
  });
}
