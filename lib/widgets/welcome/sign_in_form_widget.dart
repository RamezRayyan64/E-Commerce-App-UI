import 'package:flutter/material.dart';

class SignInFormWidget extends StatelessWidget {
  final Key formKey;
  final List<Widget> children;

  const SignInFormWidget(
      {Key? key, required this.formKey, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: children,
        ));
  }
}
