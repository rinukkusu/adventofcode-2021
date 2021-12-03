import 'dart:io';

main() {
  var list = new File('data').readAsLinesSync();

  var gamma = '';
  var epsilon = '';

  for (var i = 0; i < list.first.length; i++) {
    var value =
        list.map((x) => x[i]).map((x) => int.parse(x)).reduce((a, b) => a + b);

    if (value >= (list.length - value)) {
      gamma += '1';
      epsilon += '0';
    } else {
      gamma += '0';
      epsilon += '1';
    }
  }

  var gammaVal = int.parse(gamma, radix: 2);
  var epsilonVal = int.parse(epsilon, radix: 2);

  print('gamma: $gamma ($gammaVal)');
  print('epsilon: $epsilon ($epsilonVal)');
  print(gammaVal * epsilonVal);
}
