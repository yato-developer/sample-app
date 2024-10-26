import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/model/repository.dart';
import 'package:sample_app/pages/home_page/home_page_controller.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repositorys =
        ref.watch(homePageProvider.select((s) => s.repositorys));
    final isLoading = ref.watch(homePageProvider.select((s) => s.loading));
    final errorMessage =
        ref.watch(homePageProvider.select((s) => s.errorMessage));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Search"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: _buildSearchTextField(ref: ref),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : repositorys.isEmpty
                  ? const Center(child: Text("Not found"))
                  : ListView.builder(
                      itemCount: repositorys.length,
                      itemBuilder: (BuildContext context, int index) {
                        final repository = repositorys[index];
                        return _buildContainer(repository: repository);
                      },
                    ),
    );
  }

  Widget _buildSearchTextField({required WidgetRef ref}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "検索",
                ),
                controller: _searchController,
                onSubmitted: (String value) {
                  ref.read(homePageProvider.notifier).searchRepository(value);
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer({required Repository repository}) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(repository.name),
        ],
      ),
    );
  }
}
