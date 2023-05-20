import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MMC',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  String _result = '';

  void _calculateMMC() {
    int? number1 = int.tryParse(_number1Controller.text);
    int? number2 = int.tryParse(_number2Controller.text);

    if (number1 != null && number2 != null) {
      int result = calculateMMC(number1, number2);
      setState(() {
        _result = 'O Resultado do MMC de $number1 e $number2 é $result';
      });
    } else {
      setState(() {
        _result = 'Por favor, insira dois números válidos.';
      });
    }
  }

  int calculateMMC(int a, int b) {
    int max = a > b ? a : b;

    while (true) {
      if (max % a == 0 && max % b == 0) {
        return max;
      }
      max++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MMC'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _number1Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Número 1',
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _number2Controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Número 2',
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _calculateMMC,
                  child: const Text('Calcular'),
                ),
                const SizedBox(height: 20.0),
                Text(
                  _result,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
