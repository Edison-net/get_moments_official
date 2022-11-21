class CadastroUsuario {
  String name;
  String email;
  String password;

  CadastroUsuario({
    required this.name,
    required this.email,
    required this.password,
  });

  factory CadastroUsuario.fromJson(Map<String, dynamic> map) {
    return CadastroUsuario(
      name: (map['name'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      password: (map['password'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
