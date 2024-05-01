import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Common_Colors.dart';
import 'Generic.dart';

class LoadingOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    if (_overlayEntry == null && SingleTon().isLoading == true) {
      _overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            const Center(
              child: SpinKitWave(
                // trackColor: green1,
                color: brown1,
                size: 50,
                // waveColor: Colors.white,
                // curve: Curves.bounceInOut,
              ),
            ),
          ],
        ),
      );
      if (_overlayEntry != null) {
        Overlay.of(context).insert(_overlayEntry!);
      }
    }
  }

  static Future<void> hide() async {
    await Future.delayed(
        Duration(seconds: 2)); // Simulate an asynchronous operation

    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null; // Set it to null after removing
    }
  }

  static Future<void> forcedStop() async {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null; // Set it to null after removing
    }
  }
}
