import 'package:github_home_widget/common/const/data.dart';
import 'package:github_home_widget/common/model/commit_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<GithubCommit>> getCommits(reponame) async {
  List<GithubCommit> datas = [];

  final response = await http.get(
    Uri.parse(
        "https://api.github.com/repos/$owner/$reponame/commits?per_page=100"),
    headers: {
      if (token != null) 'Authorization': 'Bearer $token', // 인증 헤더 (Optional)
      'Accept': 'application/vnd.github.v3+json', // API 버전
    },
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    for (var i = 0; i < data.length; i++) {
      datas.add(GithubCommit.fromJson(data[i]));
    }
    print(datas);
    // print(data);
    // print(data[0].runtimeType);
    // print(response.runtimeType);
    //여기서 클래스 만들어서 반환해주면 해결될듯한 문제
  } else {
    throw Exception('Failed to load commits');
  }
  print(datas);
  return datas;
}
