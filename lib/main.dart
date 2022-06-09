import 'package:flutter/material.dart';

import 'package:calculate_pi_with_flutter_ffi/calculate_pi.dart';
import 'package:calculate_pi_with_flutter_ffi/calculate_pi_with_ffi.dart';
import 'package:calculate_pi_with_flutter_ffi/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculate Pi',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nIterController = TextEditingController(text: '1000');
  final FFIBridge _ffiBridge = FFIBridge();

  late double resultDartTimer = 0.0;
  late double resultFFITimer = 0.0;

  double dartPi = 0.0;
  double ffiPi = 0.0;

  void _runCalculatePi() {
    setState(() {
      final int nIter = int.parse(nIterController.text);

      final dartTimer = Stopwatch()..start();
      dartPi = calculatePi(nIter);
      resultDartTimer = convertRunTime(dartTimer.elapsed);

      final ffiTimer = Stopwatch()..start();
      ffiPi = _ffiBridge.calculatePi(nIter);
      resultFFITimer = convertRunTime(ffiTimer.elapsed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Enter number of iteration to calculate pi'),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                height: 50,
                width: 150,
                child: TextField(
                  controller: nIterController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Calculate Pi using by raw dart code'),
            Text(
              '${dartPi.toStringAsFixed(6)} (Runtime: $resultDartTimer)',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            const Text('Calculate Pi using by C FFI'),
            Text(
              '${ffiPi.toStringAsFixed(6)} (Runtime: $resultFFITimer)',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _runCalculatePi,
        tooltip: 'Run to calculate pi',
        backgroundColor: Colors.black54,
        child: const Icon(
          Icons.play_arrow,
          size: 40,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
