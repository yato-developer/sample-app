import 'package:flutter/material.dart';
import 'package:sample_app/model/repository.dart';

class RepositoryDetailPage extends StatelessWidget {
  final Repository repository;
  const RepositoryDetailPage({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("リポジトリ詳細"),
        ),
        body: Center(
          child: Column(
            
            children: [
              Text(repository.name),
              Container(
                height: 50,
                child: Image.network(repository.owner.avatar_url),
              ),
              Text(repository.language),
              Text(repository.stargazers_count.toString()),
              Text(repository.watchers_count.toString()),
              Text(repository.forks_count.toString()),
              Text(repository.open_issues_count.toString()),
            ],
          ),
        ));
  }
}
