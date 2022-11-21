enum IdStatusEspecialidadesEnum {
  especialidade1(
    title: 'Ortopedista',
  ),
  especealidade2(
    title: 'Psicólogo',
  ),
  especealidade3(
    title: 'Odontologista',
  ),
  especealidade4(
    title: 'Pediatra',
  );

  final String title;

  const IdStatusEspecialidadesEnum({
    required this.title,
  });
}

String getEspecialidadeEnumName(int index) {
  switch (index) {
    case 0:
      return "Ortopedista";
    case 1:
      return "Psicologo";
    case 2:
      return "Oncologista";
    case 3:
      return "Pediatra";
    default:
      return "";
  }
}
