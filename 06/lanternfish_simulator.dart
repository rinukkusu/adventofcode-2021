import 'dart:async';

import 'dart:collection';

class LanternfishSimulator {
  int _timeToGiveBirth;
  final Queue<LanternfishSimulator> _newFishQueue;

  LanternfishSimulator(Queue newFishQueue, int timeToGiveBirth)
      : _newFishQueue = newFishQueue,
        _timeToGiveBirth = timeToGiveBirth;

  void step() {
    if (_timeToGiveBirth == 0) {
      _newFishQueue.add(new LanternfishSimulator(_newFishQueue, 8));
      _timeToGiveBirth = 6;
      return;
    }

    _timeToGiveBirth--;
  }
}
