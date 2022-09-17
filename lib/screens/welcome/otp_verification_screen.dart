import 'dart:async';

import 'package:e_commerce_app_ui/utilities/constants.dart';
import 'package:e_commerce_app_ui/screens/welcome/successful_registration_screen.dart';
import 'package:e_commerce_app_ui/widgets/welcome/otp_verification_form_widget.dart';
import 'package:e_commerce_app_ui/widgets/welcome/otp_verification_textfield_widget.dart';
import 'package:e_commerce_app_ui/widgets/welcome/rounded_button.dart';
import 'package:e_commerce_app_ui/widgets/welcome/top_texts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPVerificationScreen extends StatefulWidget {
  static const id = '/otp_verification_screen';

  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  String? firstNumber;
  String? secondNumber;
  String? thirdNumber;
  String? fourthNumber;
  int expireTime = 60;
  String? downText;
  bool isFirstNumberEmpty = false;
  bool isSecondNumberEmpty = false;
  bool isThirdNumberEmpty = false;
  bool isFourthNumberEmpty = false;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final focusNodeFirstNumber = FocusNode();
  final focusNodeSecondNumber = FocusNode();
  final focusNodeThirdNumber = FocusNode();
  final focusNodeFourthNumber = FocusNode();
  dynamic map = {};

  @override
  void initState() {
    super.initState();
    timer();
  }

  void timer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        expireTime > 0 ? expireTime-- : timer.cancel();
      });
    });
  }

  void requestFocus(String value, FocusNode nextFocusNode) {
    if (value.length == 1) {
      nextFocusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    String phoneNumber = map['phoneNumber'];
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('OTP Verification'),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    TopTextsWidget(
                      upperText: 'OTP Verification',
                      downText: expireTime >= 10
                          ? 'We send your code to $phoneNumber this code will expire in 00:$expireTime'
                          : 'We send your code to $phoneNumber this code will expire in 00:0$expireTime',
                      textColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    OTPVerificationFormWidget(
                      formKey: _formKey,
                      children: [
                        OTPVerificationTextFieldWidget(
                          onSaved: (value) {
                            value!.isEmpty
                                ? isFirstNumberEmpty = true
                                : isFirstNumberEmpty = false;
                            firstNumber = value;
                          },
                          focusNode: focusNodeFirstNumber,
                          onTap: () {
                            setState(() {});
                          },
                          onChanged: (value) {
                            requestFocus(value!, focusNodeSecondNumber);
                          },
                          isEmpty: isFirstNumberEmpty,
                        ),
                        OTPVerificationTextFieldWidget(
                          onSaved: (value) {
                            value!.isEmpty
                                ? isSecondNumberEmpty = true
                                : isSecondNumberEmpty = false;
                            secondNumber = value;
                          },
                          focusNode: focusNodeSecondNumber,
                          onTap: () {
                            setState(() {});
                          },
                          onChanged: (value) {
                            setState(() {});
                            value!.isEmpty
                                ? isSecondNumberEmpty = true
                                : isSecondNumberEmpty = false;
                            requestFocus(value, focusNodeThirdNumber);
                          },
                          isEmpty: isSecondNumberEmpty,
                        ),
                        OTPVerificationTextFieldWidget(
                          onSaved: (value) {
                            value!.isEmpty
                                ? isThirdNumberEmpty = true
                                : isThirdNumberEmpty = false;
                            thirdNumber = value;
                          },
                          focusNode: focusNodeThirdNumber,
                          onTap: () {
                            setState(() {});
                          },
                          onChanged: (value) {
                            setState(() {});
                            value!.isEmpty
                                ? isThirdNumberEmpty = true
                                : isThirdNumberEmpty = false;
                            requestFocus(value, focusNodeFourthNumber);
                          },
                          isEmpty: isThirdNumberEmpty,
                        ),
                        OTPVerificationTextFieldWidget(
                          onSaved: (value) {
                            value!.isEmpty
                                ? isFourthNumberEmpty = true
                                : isFourthNumberEmpty = false;
                            fourthNumber = value;
                          },
                          focusNode: focusNodeFourthNumber,
                          onTap: () {
                            setState(() {});
                          },
                          onChanged: (value) {
                            setState(() {});
                            value!.isEmpty
                                ? isFourthNumberEmpty = true
                                : isFourthNumberEmpty = false;
                            if (value.length == 1) {
                              FocusManager.instance.primaryFocus!.unfocus();
                            }
                          },
                          isEmpty: isFourthNumberEmpty,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    RoundedButtonWidget(
                      text: 'Continue',
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        _formKey.currentState!.save();
                        setState(() {});
                        if (!(isFirstNumberEmpty &&
                                isSecondNumberEmpty &&
                                isThirdNumberEmpty &&
                                isFourthNumberEmpty) &&
                            ('$firstNumber$secondNumber$thirdNumber$fourthNumber' ==
                                '1234')) {
                          Navigator.pushNamedAndRemoveUntil(context,
                              SuccessfulRegistrationScreen.id, (route) => false,
                              arguments: {
                                'title': 'Success Sign Up',
                                'text': 'Success Sign Up',
                                'textButton': 'Go To Home'
                              });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (expireTime == 0) {
                          expireTime = 60;
                          timer();
                          return;
                        }
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Text(
                        'Resend OTP Code',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: expireTime == 0 ? kPrimaryColor : kTextColor,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkIsEmpty(String? value, bool isEmpty) {
    value!.isEmpty ? isEmpty = true : isEmpty = false;
  }

  @override
  void dispose() {
    super.dispose();
    focusNodeFirstNumber.dispose();
    focusNodeSecondNumber.dispose();
    focusNodeThirdNumber.dispose();
    focusNodeFourthNumber.dispose();
  }
}
