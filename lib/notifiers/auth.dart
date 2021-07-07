import 'dart:async';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _phoneNo;

  String? get phoneNo => _phoneNo;
  Timer? _timer;
  int _start = 30;
  int get remainingTime => _start;

  void sendOtp({required phoneNo}) {
    _phoneNo = phoneNo;
    notifyListeners();
    startTimer();
  }

  void resend() {
    startTimer();
  }

  bool checkOtp({required String otp}) {
    if (otp == "858585") {
      _timer!.cancel();
      return true;
    }
    return false;
  }

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _start = 30;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          _start = 0;
          _timer!.cancel();
        } else {
          _start--;
          notifyListeners();
        }
      },
    );
  }
}
