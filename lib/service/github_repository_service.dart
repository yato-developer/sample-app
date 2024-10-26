import 'dart:convert';
import 'package:http/http.dart' as http;

class GithubRepositoryService {
  final String _baseUrl = 'https://api.github.com/search/repositories';

  Future<void> searchRepository(String searchTerm) async {
    final url = Uri.parse('$_baseUrl?q=$searchTerm+in:name&sort=stars');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> repositories = data['items'];

        // Process the repository data as needed
        for (var repo in repositories) {
          print('Repository Name: ${repo['name']}');
          print('Stars: ${repo['stargazers_count']}');
          print('URL: ${repo['html_url']}');
        }
      } else {
        throw Exception('Failed to load repositories: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
