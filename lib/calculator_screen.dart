import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  String _resultado = '0.0';

  @override
  void dispose() {
    _number1Controller.dispose();
    _number2Controller.dispose();
    super.dispose();
  }

  void _calcular(double Function(double a, double b) operation) {
    setState(() {
      try {
        final a = double.parse(_number1Controller.text);
        final b = double.parse(_number2Controller.text);
        _resultado = operation(a, b).toString();
      } catch (_) {
        _resultado = 'entrada inválida';
      }
    });
  }

  void _somar() => _calcular((a, b) => a + b);
  void _subtrair() => _calcular((a, b) => a - b);
  void _multiplicar() => _calcular((a, b) => a * b);
  void _dividir() => _calcular((a, b) => a / b);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora Simples')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _number1Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número 1',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _number2Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número 2',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _somar, child: const Text('+')),
                ElevatedButton(onPressed: _subtrair, child: const Text('-')),
                ElevatedButton(onPressed: _multiplicar, child: const Text('*')),
                ElevatedButton(onPressed: _dividir, child: const Text('/')),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado: $_resultado',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
