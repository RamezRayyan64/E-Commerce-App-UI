import 'package:e_commerce_app_ui/utilities/constants.dart';
import 'package:flutter/material.dart';

class OTPVerificationTextFieldWidget extends StatelessWidget {
  const OTPVerificationTextFieldWidget({
    Key? key,
    required this.onSaved,
    this.focusNode,
    this.onTap,
    this.onChanged,
    required this.isEmpty,
  }) : super(key: key);

  final Function(String? value)? onSaved;
  final Function(String? value)? onChanged;
  final FocusNode? focusNode;
  final Function()? onTap;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextFormField(
        onTap: onTap,
        onSaved: onSaved,
        focusNode: focusNode,
        obscureText: true,
        onChanged: onChanged,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: isEmpty == true ? kErrorColor : kTextColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
