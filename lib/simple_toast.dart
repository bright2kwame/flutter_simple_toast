import 'dart:async';
import 'package:flutter/material.dart';

class SimpleToast {
  static Timer? toastTimer;
  static OverlayEntry? _overlayEntry;

  //show a toast to display information
  static void showInfoToast(
      BuildContext context, String title, String message) {
    if (toastTimer == null || !toastTimer!.isActive) {
      _overlayEntry = createOverlayEntry(context, title, message,
          const Color(0xFF767676), const Color(0xFFF9F9F9));
      Overlay.of(context).insert(_overlayEntry!);
      toastTimer = Timer(const Duration(seconds: 2), () {
        if (_overlayEntry != null) {
          _overlayEntry?.remove();
        }
      });
    }
  }

//show toast to display success information
  static void showSuccessToast(
      BuildContext context, String title, String message) {
    if (toastTimer == null || !toastTimer!.isActive) {
      _overlayEntry = createOverlayEntry(context, title, message,
          const Color(0xFF009C49), const Color(0xFFD6EBE0));
      Overlay.of(context).insert(_overlayEntry!);
      toastTimer = Timer(const Duration(seconds: 2), () {
        if (_overlayEntry != null) {
          _overlayEntry?.remove();
        }
      });
    }
  }

//show message for errors
  static void showErrorToast(
      BuildContext context, String title, String message) {
    if (toastTimer == null || !toastTimer!.isActive) {
      _overlayEntry = createOverlayEntry(context, title, message,
          const Color(0xFFD6292E), const Color(0xFFEEE0DF));
      Overlay.of(context).insert(_overlayEntry!);
      toastTimer = Timer(const Duration(seconds: 3), () {
        if (_overlayEntry != null) {
          _overlayEntry?.remove();
        }
      });
    }
  }

//basic construction of the toast message
  static OverlayEntry createOverlayEntry(BuildContext context, String title,
      String message, Color color, Color bgColor) {
    return OverlayEntry(
      builder: (context) => Positioned(
        bottom: 16,
        left: 16,
        right: 16,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(width: 1.0, color: color),
              borderRadius: BorderRadius.circular(10)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        softWrap: true,
                        style: _customTextStyle(16, fontColor: color),
                      ),
                      Text(
                        message,
                        textAlign: TextAlign.start,
                        softWrap: true,
                        style: _customTextStyle(14, fontColor: Colors.black),
                      )
                    ],
                  ),
                ),
                Center(
                  child: ClipOval(
                    child: Container(
                      height: 20,
                      width: 20,
                      color: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          if (_overlayEntry != null) {
                            toastTimer?.cancel();
                            toastTimer = null;
                            _overlayEntry!.remove();
                          }
                        },
                        child: Icon(
                          Icons.close,
                          size: 16,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//state a custom font to be used
  static TextStyle _customTextStyle(double fontSize,
      {Color? fontColor = Colors.black,
      FontWeight? weight = FontWeight.normal,
      bool? underline = false}) {
    TextStyle textStyle = TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: weight,
        decoration:
            underline! ? TextDecoration.underline : TextDecoration.none);
    return textStyle;
  }
}
