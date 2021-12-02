import 'dart:io';

main() {
  var list =
      new File('data').readAsLinesSync().map(Instruction.FromLine).toList();

  var state = new State();

  for (var instruction in list) {
    state.updateState(instruction);
  }

  print(state.distance * state.depth);
}

class State {
  int distance = 0;
  int depth = 0;
  int aim = 0;

  void updateState(Instruction instruction) {
    switch (instruction.direction) {
      case "forward":
        distance += instruction.steps;
        depth += instruction.steps * aim;
        break;
      case "up":
        aim -= instruction.steps;
        break;
      case "down":
        aim += instruction.steps;
        break;
      default:
        print("whut?");
        break;
    }
  }
}

class Instruction {
  String direction;
  int steps;

  static Instruction FromLine(String line) {
    final split = line.split(" ");
    return new Instruction()
      ..direction = split[0]
      ..steps = int.parse(split[1]);
  }
}
