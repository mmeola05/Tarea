import 'package:flutter/material.dart';

/// Widget que muestra el logotipo de la aplicación.
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      height: 180,
      width: 180,
      fit: BoxFit.contain,
    );
  }
}
