import 'dart:math';

class CalculatorBrain {
  final int _height;
  final int _weight;

  double _bmi;

  CalculatorBrain(this._height, this._weight);

  String calculateBMI() {
    _bmi = _weight / pow(_height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }


}
