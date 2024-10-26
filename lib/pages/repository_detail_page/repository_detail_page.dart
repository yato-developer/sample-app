import 'package:flutter/material.dart';

class RepositoryDetailPage extends StatelessWidget {
  const RepositoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RepositoryDetail"),
      ),
      body: Center(
        child: Text("リポジトリの詳細"),
      ),
    );
  }
}
