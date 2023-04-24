import 'dart:convert';

import 'package:github_home_widget/common/api/github_api.dart';
import 'package:github_home_widget/common/const/data.dart';
import 'package:github_home_widget/common/model/commit_model.dart';
import 'package:http/http.dart' as http;

DateTime today = DateTime.now();
Future resetdate(String username) async {
  List<GithubCommit> allCommits = [];
  Map<String, int> timelist = {};
  final response = await http.get(
    Uri.parse(reposUrl.replaceAll('{username}', username)),
    headers: {
      if (token != null) 'Authorization': 'Bearer $token', // 인증 헤더 (Optional)
      'Accept': 'application/vnd.github.v3+json', // API 버전
    },
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    for (var i = 0; i < data.length; i++) {
      List<List<GithubCommit>> pages =
          await getAllPages(username, data[i]['name']);
      for (var j = 0; j < pages.length; j++) {
        allCommits.addAll(pages[j]);
      }
    }
  } else {
    throw Exception('Failed to load repositories');
  }

  for (var i = 0; i < allCommits.length; i++) {
    GithubCommit item = allCommits[i];
    String datetime = item.commit!.author!.date!.substring(0, 10);
    //아래로 날짜를 중복값으로 datetime:중복 수 map 형태로 반환
    print(datetime.substring(0, 4));
    if (datetime.substring(0, 4) == today.year.toString()) {
      timelist.update(datetime, (value) => value + 1, ifAbsent: () => 1);
    }
  }
  print(timelist);
  return timelist.map((key, value) => MapEntry(DateTime.parse(key), value));
}
