import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Search"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: _buildSearchTextField(),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
           return _buildContainer();
          }),
    );
  }

  Widget _buildSearchTextField() {
    final searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: "検索"),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                searchController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      height: 60,
      child: Text("リポジトリ")
    );
  }
}
