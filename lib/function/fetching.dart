import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:technews/components/Searchbar.dart';
import 'package:technews/utils/Key.dart';

Future<List> fetchNews() async {
  final response = await http.get(
    Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=" +
            Key.key +
            '&q=' +
            SearchBar.searchController.text),
  );
  Map result = json.decode(response.body);
  return (result['articles']);
}
