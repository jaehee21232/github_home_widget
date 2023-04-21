import 'package:flutter/material.dart';
import 'package:github_home_widget/screen/github_all_commit.dart';
import 'package:github_home_widget/screen/github_commit.dart';
import 'package:github_home_widget/screen/github_repos.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GithubApiScreen(),
              ));
            },
            child: Text("github_commits"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GithubReposScreen(),
              ));
            },
            child: Text("github_repos"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GithubAllCommitScreen(),
              ));
            },
            child: Text("all_commit"),
          ),
        ],
      ),
    );
  }
}
