import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCubit extends Cubit<int> {
  Timer? _timer;
  int _remainingTime;

  TimerCubit(super.initialTime) : _remainingTime = initialTime;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        emit(_remainingTime); 
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
