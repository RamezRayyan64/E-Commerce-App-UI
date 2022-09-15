import 'package:flutter/material.dart';

class OTPVerificationFormWidget extends StatelessWidget {
  final Key formKey;
  final List<Widget>? children;

  const OTPVerificationFormWidget(
      {Key? key, required this.formKey, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children!.toList(),
        ));
  }
}
