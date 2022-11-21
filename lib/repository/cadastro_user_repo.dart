import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:get_moments/models/cadastro_usuario.dart';
import 'package:http/http.dart' as http;

Future<http.Response?> cadastrar(CadastroUsuario cadastroUsuario) async {
  http.Response? response;
  try {
    response = await http.post(
      Uri.parse('https://get-moments.herokuapp.com/auth/signup'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'aplication/json'
      },
      body: jsonEncode(cadastroUsuario.toJson()),
    );
  } catch (e) {
    developer.log('Error: ${e.toString()}', name: 'cadastrar');
  }

  return response;
}

class DataClass extends ChangeNotifier {
  bool loading = false;
  bool isBack = false;

  Future<void> postData(CadastroUsuario cadastroUsuario) async {
    loading = true;
    notifyListeners();
    http.Response response = (await cadastrar(cadastroUsuario))!;
    if (response.statusCode == 200) {
      debugPrint('Cadastrado com sucesso ${response.body}');
      isBack = true;
    }
    loading = false;

    notifyListeners();
  }
}
