import 'dart:convert';
import 'package:github_home_widget/common/const/data.dart';
import 'package:http/http.dart' as http;

final String reposUrl = 'https://api.github.com/users/jaehee21232/repos';
Future<List<dynamic>> getRepositories() async {
  final response = await http.get(
    Uri.parse(reposUrl),
    headers: {
      if (token != null) 'Authorization': 'Bearer $token', // 인증 헤더 (Optional)
      'Accept': 'application/vnd.github.v3+json', // API 버전
    },
  );
  print(jsonDecode(response.body));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Failed to load repositories');
  }
}
