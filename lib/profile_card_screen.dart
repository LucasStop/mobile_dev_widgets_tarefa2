import 'package:flutter/material.dart';

class ProfileCardScreen extends StatefulWidget {
  const ProfileCardScreen({super.key});

  @override
  State<ProfileCardScreen> createState() => _ProfileCardScreenState();
}

class _ProfileCardScreenState extends State<ProfileCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartão de Perfil Interativo'),
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(child: Text('TODO: Fase 3')),
    );
  }
}
