import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:get_moments/models/login_models.dart';
import 'package:http/http.dart' as http;

Future<http.Response?> logar(LoginModels loginModels) async {
  http.Response? response;
  try {
    response = await http.post(
      Uri.parse('https://get-moments.herokuapp.com/auth/signin'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(loginModels.toJson()),
    );
  } catch (e) {
    developer.log('Error: ${e.toString()}', name: 'cadastrar');
  }

  return response;
}

class DataLogin extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;

  Future<void> postLogin(LoginModels loginModels) async {
    loading = true;
    notifyListeners();
    http.Response response = (await logar(loginModels))!;
    if (response.statusCode == 200) {
      debugPrint('Login com sucesso ${response.body}');
      isBack = true;
    }
    loading = false;

    notifyListeners();
  }
}
