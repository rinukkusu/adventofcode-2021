class LanternfishSimulator {
  List<LanternfishCycleDay> _cycles =
      new List.generate(9, (i) => new LanternfishCycleDay(i));

  LanternfishSimulator(List<int> initialFish) {
    for (var fish in initialFish) {
      _cycles.firstWhere((c) => c.daysToBirth == fish).fishInCycle++;
    }
  }

  void step() {
    var newCycleList = new List<LanternfishCycleDay>();

    for (int i = 8; i >= 0; i--) {
      final thisCycle =
          _cycles.firstWhere((e) => e.daysToBirth == i, orElse: () => null);

      if (thisCycle == null) continue;
      final nextDay = i == 0 ? 6 : i - 1;

      _setOrAdd(newCycleList, nextDay, thisCycle.fishInCycle);

      if (i == 0) {
        _setOrAdd(newCycleList, 8, thisCycle.fishInCycle);
      }
    }

    _cycles = newCycleList;
  }

  void _setOrAdd(List<LanternfishCycleDay> cycles, days, fish) {
    final cycle =
        cycles.firstWhere((e) => e.daysToBirth == days, orElse: () => null);

    if (cycle != null) {
      cycle.fishInCycle += fish;
    } else {
      cycles.add(LanternfishCycleDay.FromData(days, fish));
    }
  }

  int fishCount() {
    return _cycles.map((e) => e.fishInCycle).reduce((a, b) => a + b);
  }
}

class LanternfishCycleDay {
  final int daysToBirth;
  int fishInCycle = 0;

  LanternfishCycleDay(int days) : daysToBirth = days;

  LanternfishCycleDay.FromData(int days, int fish)
      : daysToBirth = days,
        fishInCycle = fish;

  @override
  String toString() {
    return '[$daysToBirth | $fishInCycle]';
  }
}
