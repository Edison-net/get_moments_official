import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_moments/src/components/backgroudcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart' as colors;
import '../pages/login/login_page.dart';

class MenuGetMoments extends StatelessWidget {
  final String email;
  final File? image;
  const MenuGetMoments({
    Key? key,
    required this.email,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Backgroundcolor(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 20),
                  GestureDetector(
                    child: const Icon(Icons.arrow_back_ios),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // foto de perfil
              SizedBox(
                width: 75,
                height: 75,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.customWhite,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: image != null
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.file(
                              image!,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Icon(
                              Icons.person,
                              size: 35,
                            ),
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 14),
              // nome do usuario
              Text(
                email.contains('@') ? email.split('@')[0] : email,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  title: Text(
                    "Sair do App",
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const LoginPage()),
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
