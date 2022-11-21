import 'package:flutter/material.dart';
import 'package:get_moments/models/login_models.dart';
import 'package:get_moments/repository/login_repo.dart';
import 'package:get_moments/src/components/backgroudcolor.dart';
import 'package:get_moments/src/components/logo_get_moments.dart';
import 'package:get_moments/src/components/text_field_get_moments.dart';
import 'package:get_moments/src/pages/cadastrar/cadastrar.page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart' as colors;
import '../../components/button_get_moments.dart';
import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isError = false;
  var emailController = TextEditingController();
  var senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _logarPage() async {
      String email = emailController.text;
      String senha = senhaController.text;
      LoginModels loginModels = LoginModels(
        email: email,
        password: senha,
      );
      var provider = Provider.of<DataLogin>(context, listen: false);
      await provider.postLogin(loginModels);
      if (provider.isBack) {
        if (!mounted) return;

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => HomePage(
                      login: email,
                    )),
            (route) => false);
      } else {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text('Atenção'),
                  content: Text('E-mail ou Senha Inválidos'),
                ));
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
                    'Realize seu login',
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
                      hintText: 'Senha',
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      preffixIcon: const Icon(
                        Icons.lock_outlined,
                        color: colors.customBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 140,
                          child: Center(
                            child: ButtonGetMoments(
                              colorBackground: Colors.black54,
                              text: 'Cadastrar',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CadastrarPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          height: 80,
                          width: 140,
                          child: Center(
                            child: ButtonGetMoments(
                              colorBackground: Colors.black54,
                              text: 'Entrar',
                              onPressed: () async {
                                _logarPage();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueci minha senha',
                            style: GoogleFonts.roboto(
                              color: colors.customWhite,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
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
