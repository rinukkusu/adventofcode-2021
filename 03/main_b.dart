import 'dart:io';

main() {
  var list = new File('data').readAsLinesSync();

  var oxygenResult = calcResult(list, '1', '0');
  var co2Result = calcResult(list, '0', '1');

  var oxygenRating = int.parse(oxygenResult, radix: 2);
  var co2Rating = int.parse(co2Result, radix: 2);

  print('oxygen generator rating: $oxygenResult');
  print('co2 scrubber rating: $co2Result');
  print(oxygenRating * co2Rating);
}

String calcResult(List<String> list, String more, String less) {
  var resultList = list.toList();

  for (var i = 0; i < list.first.length; i++) {
    var value = resultList
        .map((x) => x[i])
        .map((x) => int.parse(x))
        .reduce((a, b) => a + b);

    if (value >= (resultList.length - value)) {
      resultList = resultList.length > 1
          ? resultList.where((x) => x[i] == more).toList()
          : resultList;
    } else {
      resultList = resultList.length > 1
          ? resultList.where((x) => x[i] == less).toList()
          : resultList;
    }
  }

  return resultList.first;
}
