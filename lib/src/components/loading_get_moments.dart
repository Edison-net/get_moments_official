import 'package:flutter/material.dart';

class LoadingGetMoments extends StatelessWidget {
  const LoadingGetMoments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
