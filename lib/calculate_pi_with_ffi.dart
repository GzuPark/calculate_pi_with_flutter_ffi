import 'dart:ffi';
import 'dart:io';

typedef CalculatePiFunction = Double Function(Uint64 nIter);
typedef CalculatePiFunctionDart = double Function(int nIter);

class FFIBridge {
  late CalculatePiFunctionDart _calculatePi;

  FFIBridge() {
    final dl = Platform.isAndroid ? DynamicLibrary.open('libcalculatepi.so') : DynamicLibrary.process();
    _calculatePi = dl.lookupFunction<CalculatePiFunction, CalculatePiFunctionDart>('calculatePi');
  }

  double calculatePi(int nIter) {
    return _calculatePi(nIter);
  }
}
