import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  var errortrace;

  ErrorScreen({super.key, this.errortrace});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(errortrace.toString())),
    );
  }
}
