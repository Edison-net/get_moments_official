import 'package:flutter/material.dart';
import 'package:get_moments/models/cadastro_usuario.dart';
import 'package:get_moments/src/components/backgroudcolor.dart';
import 'package:get_moments/src/components/logo_get_moments.dart';
import 'package:get_moments/src/components/text_field_get_moments.dart';
import 'package:get_moments/src/pages/login/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../repository/cadastro_user_repo.dart';
import '../../../utils/colors.dart' as colors;
import '../../components/button_get_moments.dart';

class CadastrarPage extends StatefulWidget {
  const CadastrarPage({Key? key}) : super(key: key);

  @override
  State<CadastrarPage> createState() => _CadastrarPageState();
}

class _CadastrarPageState extends State<CadastrarPage> {
  bool isError = false;
  var nomeController = TextEditingController();
  var emailController = TextEditingController();
  var senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _cadastrarPage() async {
      String nome = nomeController.text;
      String email = emailController.text;
      String senha = senhaController.text;
      CadastroUsuario cadastroUsuario = CadastroUsuario(
        name: nome,
        email: email,
        password: senha,
      );
      var provider = Provider.of<DataClass>(context, listen: false);
      await provider.postData(cadastroUsuario);
      if (provider.isBack) {
        if (!mounted) return;

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false);
      }
    }

    return Scaffold(
      body: Backgroundcolor(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const LogoGetMoments(),
                  const SizedBox(height: 80),
                  Text(
                    'Realize seu Cadastro',
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: colors.customWhite,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.customWhite,
                    ),
                    child: TextFieldGetMoments(
                      isError: isError,
                      controller: nomeController,
                      keyboardType: TextInputType.name,
                      hintText: 'Nome',
                      textInputAction: TextInputAction.next,
                      preffixIcon: const Icon(
                        Icons.person_outline,
                        color: colors.customBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.customWhite,
                    ),
                    child: TextFieldGetMoments(
                      isError: isError,
                      hintText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      preffixIcon: const Icon(
                        Icons.email_outlined,
                        color: colors.customBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colors.customWhite,
                    ),
                    child: TextFieldGetMoments(
                      isError: isError,
                      controller: senhaController,
                      keyboardType: TextInputType.number,
                      hintText: 'Senha',
                      obscureText: true,
                      preffixIcon: const Icon(
                        Icons.lock_outlined,
                        color: colors.customBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: Center(
                      child: ButtonGetMoments(
                        colorBackground: Colors.black54,
                        text: 'Cadastrar',
                        onPressed: () async {
                          if (nomeController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              senhaController.text.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text('Atenção'),
                                      content: const Text(
                                          'Preencha todos os campos'),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: const Text('Ok'))
                                      ],
                                    ));
                            setState(() {
                              isError = true;
                            });
                          } else {
                            await _cadastrarPage();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
