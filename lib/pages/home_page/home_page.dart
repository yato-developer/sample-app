import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/pages/home_page/home_page_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositorys =
        ref.watch(homePageProvider.select((s) => s.repositorys));
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Search"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: _buildSearchTextField(),
        ),
      ),
      body: ListView.builder(
          itemCount: repositorys.length,
          itemBuilder: (BuildContext context, int index) {
            final repository = repositorys[index];
            return _buildContainer(name: repository.name);
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

  Widget _buildContainer({
    required String name,
  }) {
    return Container(height: 60, child: Text(name));
  }
}
