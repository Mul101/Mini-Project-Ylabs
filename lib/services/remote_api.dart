import 'package:mini_project/model/karya.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RemoteApi {
  final String _url = 'kreatoon-ylabs.herokuapp.com';

  Future<List<Karya>> getKarya() async {
    final url =
        Uri.https(_url, '/karya'); // Convert the url string into a https Uri
    final resp = await http.get(url);
    final List<dynamic> decodedData =
        convert.jsonDecode(resp.body); // Get the decoded response data
    return decodedData
        .map((e) => new Karya.fromJson(e))
        .toList(); // Use the iterable map() to generate new User instances from the response
  }
}
