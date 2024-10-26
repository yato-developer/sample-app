import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_app/model/repository.dart';

class GithubRepositoryService {
  final String _baseUrl = 'https://api.github.com/search/repositories';

  Future<List<Repository>> searchRepository(String searchTerm) async {
    final url = Uri.parse('$_baseUrl?q=$searchTerm+in:name&sort=stars');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> items = data['items'];

        final repositorys = items.map((e) => Repository.fromJson(e)).toList();

        return repositorys;
      } else {
        throw Exception('Failed to load repositories: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
