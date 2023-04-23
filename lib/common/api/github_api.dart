import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:github_home_widget/common/const/data.dart';
import 'package:github_home_widget/common/model/commit_model.dart';

final String reposUrl = 'https://api.github.com/users/{username}/repos';

// 모든 저장소에서 커밋 기록 가져오기
Future<List<GithubCommit>> getAllCommits(String username) async {
  List<GithubCommit> allCommits = [];

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

  return allCommits;
}

Future<List<List<GithubCommit>>> getAllPages(
    String username, String reponame) async {
  List<List<GithubCommit>> pages = [];

  int page = 1;
  bool hasMorePages = true;

  while (hasMorePages) {
    final response = await http.get(
      Uri.parse(
          "https://api.github.com/repos/$username/$reponame/commits?per_page=100&page=$page"),
      headers: {
        if (token != null) 'Authorization': 'Bearer $token', // 인증 헤더 (Optional)
        'Accept': 'application/vnd.github.v3+json', // API 버전
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.isEmpty) {
        hasMorePages = false;
      } else {
        List<GithubCommit> commits = [];
        for (var i = 0; i < data.length; i++) {
          commits.add(GithubCommit.fromJson(data[i]));
        }
        pages.add(commits);
        page++;
      }
    } else {
      throw Exception('Failed to load commits');
    }
  }

  return pages;
}

// 저장소에서 커밋 기록 가져오기
Future<List<GithubCommit>> getCommits(String username, String reponame) async {
  List<GithubCommit> commits = [];

  final response = await http.get(
    Uri.parse(
        "https://api.github.com/repos/$username/$reponame/commits?per_page=100"),
    headers: {
      if (token != null) 'Authorization': 'Bearer $token', // 인증 헤더 (Optional)
      'Accept': 'application/vnd.github.v3+json', // API 버전
    },
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    for (var i = 0; i < data.length; i++) {
      commits.add(GithubCommit.fromJson(data[i]));
    }
  } else {
    throw Exception('Failed to load commits');
  }

  return commits;
}
