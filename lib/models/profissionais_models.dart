// [{"id":1,"name":"Dra. Camila Abreu","serviceDays":["Quarta-feira"],"serviceHours":"10h às 14h","specialty":"Ortopedia","avatar":"/assets/professionals/1.jpeg"},{"id":2,"name":"Dr. João Manoel","serviceDays":["Segunda-feira a Sexta-feira"],"serviceHours":"08h às 12h","specialty":"Cliníca Geral","avatar":"/assets/professionals/2.jpeg"},{"id":3,"name":"Dra. Vanessa Silva","serviceDays":["Segunda-feira a Sexta-feira"],"serviceHours":"08h às 12h","specialty":"Dentista","avatar":"/assets/professionals/3.jpeg"}]

class ProfissionaisModels {
  int id;
  String name;
  List<String>? serviceDays;
  String serviceHours;
  String specialty;
  String avatar;

  ProfissionaisModels({
    required this.id,
    required this.name,
    required this.serviceDays,
    required this.serviceHours,
    required this.specialty,
    required this.avatar,
  });

  factory ProfissionaisModels.fromJson(Map<String, dynamic> map) {
    return ProfissionaisModels(
        id: map['id'] as int,
        name: (map['name'] ?? '') as String,
        serviceDays: List<String>.from(map['serviceDays']),
        serviceHours: (map['serviceHours'] ?? '') as String,
        specialty: (map['specialty'] ?? '') as String,
        avatar: (map['avatar'] ?? '') as String);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "serviceDays": serviceDays,
        "serviceHours": serviceHours,
        "specialty": specialty,
        "avatar": avatar
      };
}
