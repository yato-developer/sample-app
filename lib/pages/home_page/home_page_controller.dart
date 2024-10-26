import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_app/model/repository.dart';
import 'package:sample_app/service/github_repository_service.dart';

part 'home_page_controller.freezed.dart';

@freezed
class HomePagePageState with _$HomePagePageState {
  const factory HomePagePageState({
    @Default([]) List<Repository> repositorys,
  }) = _HomePagePageState;
}

final homePageProvider = StateNotifierProvider.autoDispose<
    HomePagePageController, HomePagePageState>(
  (ref) => HomePagePageController(),
);

class HomePagePageController extends StateNotifier<HomePagePageState> {
  HomePagePageController() : super(const HomePagePageState());

  final service = GithubRepositoryService();

  Future<void> searchRepository(String searchTerm) async {
    final repositorys = await service.searchRepository(searchTerm);
    state = state.copyWith(repositorys: repositorys);
  }
}
