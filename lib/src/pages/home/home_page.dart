import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_moments/models/profissionais_models.dart';
import 'package:get_moments/repository/profissionais_repo.dart';
import 'package:get_moments/src/components/button_get_moments.dart';
import 'package:get_moments/src/components/loading_get_moments.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/colors.dart' as colors;
import '../../components/menu_get_moments.dart';

class HomePage extends StatefulWidget {
  final String login;
  const HomePage({
    Key? key,
    required this.login,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProfissionaisModels> profissionaisList = <ProfissionaisModels>[];

  File? _image;

  Future imagem(ImageSource source) async {
    try {
      final img = await ImagePicker().pickImage(source: source);
      if (img == null) return;
      final imagemSalva = await salvarImage(img.path);

      setState(() {
        _image = imagemSalva;
      });
    } catch (e) {
      debugPrint('Erro ao carregar imagem $e');
    }
  }

  Future<File> salvarImage(String imgPath) async {
    final directory = await getApplicationDocumentsDirectory();
    final nome = basename(imgPath);
    final imgem = File('${directory.path}/$nome');

    return File(imgPath).copy(imgem.path);
  }

  Future<void> loadingProfissionais() async {
    profissionaisList = await getProfissionais();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        profissionaisList;
      });
    });
  }

  @override
  initState() {
    super.initState();
    loadingProfissionais();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProfissionais(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return pageview(context);
          } else {
            return const LoadingGetMoments();
          }
        });
  }

  Widget pageview(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 28),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Seja bem-vindo\n'
                                    '${widget.login.contains('@') ? widget.login.split('@')[0] : widget.login}',
                                    style: GoogleFonts.roboto(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: colors.customWhite,
                                    ),
                                  ),
                                  const SizedBox(width: 40),
                                  GestureDetector(
                                    onTap: () async {
                                      await showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                elevation: 2,
                                                title: const Text(
                                                    'Menu de opções'),
                                                content: const Text(
                                                    'Escolha uma das opções abaixo'),
                                                actionsAlignment:
                                                    MainAxisAlignment.center,
                                                actions: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: SizedBox(
                                                      width: 200,
                                                      height: 50,
                                                      child: ButtonGetMoments(
                                                          colorBackground: colors
                                                              .customBackground,
                                                          onPressed: () async {
                                                            await imagem(
                                                                ImageSource
                                                                    .gallery);
                                                            if (mounted) {
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                          text:
                                                              'Galeria de fotos'),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: SizedBox(
                                                      width: 200,
                                                      height: 50,
                                                      child: ButtonGetMoments(
                                                          colorBackground: colors
                                                              .customBackground,
                                                          onPressed: () async {
                                                            await imagem(
                                                                ImageSource
                                                                    .camera);
                                                            if (mounted) {
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                          text: 'Tirar foto'),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: SizedBox(
                                                      width: 200,
                                                      height: 50,
                                                      child: ButtonGetMoments(
                                                        colorBackground: colors
                                                            .customBackground,
                                                        onPressed: () async {
                                                          await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MenuGetMoments(
                                                                email: widget
                                                                    .login,
                                                                image: _image,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        text: 'Menu',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: colors.customWhite,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: _image != null
                                          ? Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                child: Image.file(
                                                  _image!,
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: profissionaisList.length,
                  itemBuilder: ((context, index) {
                    final ProfissionaisModels profissionais =
                        profissionaisList[index];
                    final idAvatar = profissionais.id;
                    return SizedBox(
                      height: 120,
                      child: Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  'https://get-moments.herokuapp.com/assets/professionals/$idAvatar.jpeg',
                                ),
                              ),
                              const SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profissionais.name,
                                      style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: colors.customWhite,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month_outlined,
                                          color: colors.customWhite,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 5),
                                        Column(
                                          children: List.generate(
                                              profissionais.serviceDays!.length,
                                              (index) {
                                            final listDays = profissionais
                                                .serviceDays![index];
                                            return Column(
                                              children: [
                                                Text(
                                                  listDays,
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: colors.customWhite,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 4,
                                                ),
                                              ],
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.watch_later,
                                          color: colors.customWhite,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          profissionais.serviceHours,
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: colors.customWhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                )),
          ],
        ),
      ),
    );
  }
}
