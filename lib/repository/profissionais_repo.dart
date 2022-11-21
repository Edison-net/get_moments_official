import 'dart:convert';

import 'package:get_moments/models/profissionais_models.dart';
import 'package:http/http.dart' as http;

Future<List<ProfissionaisModels>> getProfissionais() async {
  var profissionaisApi =
      Uri.parse('https://get-moments.herokuapp.com/professionals');
  var response = await http.get(profissionaisApi, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  });

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body) as List;
    return jsonResponse
        .map((listProf) => ProfissionaisModels.fromJson(listProf))
        .toList();
  } else {
    throw Exception('Failed to load get');
  }
}
