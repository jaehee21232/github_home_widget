import 'package:flutter/material.dart';
import 'package:github_home_widget/common/api/reset_datetime.dart';
import 'package:github_home_widget/screen/github_all_commit.dart';
import 'package:github_home_widget/screen/github_commit.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ;
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.black,
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
                builder: (context) => GithubAllCommitScreen(),
              ));
            },
            child: Text("all_commit"),
          ),
          HeatMap(
            datasets: {
              DateTime(2023, 1, 6): 3,
              DateTime(2023, 1, 7): 7,
              DateTime(2023, 1, 8): 10,
              DateTime(2023, 1, 9): 13,
              DateTime(2023, 1, 13): 30,
            },
            size: 10,
            colorMode: ColorMode.opacity,
            showText: false,
            scrollable: true,
            startDate: DateTime(today.year, 1, 1),
            endDate: DateTime(today.year, today.month + 1, 31),
            colorsets: {
              1: Colors.green,
            },
            onClick: (value) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(value.toString())));
            },
            borderRadius: 0,
          ),
          FutureBuilder(
            future: resetdate("jaehee21232"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HeatMap(
                  datasets: snapshot.data,
                  size: 10,
                  colorMode: ColorMode.opacity,
                  showText: false,
                  scrollable: true,
                  startDate: DateTime(today.year, 1, 1),
                  endDate: today,
                  colorsets: {
                    1: Colors.green,
                  },
                  onClick: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(value.toString())));
                  },
                  borderRadius: 0,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
