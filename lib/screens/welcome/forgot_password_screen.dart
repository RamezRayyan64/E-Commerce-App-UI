import 'package:e_commerce_app_ui/screens/welcome/successful_registration_screen.dart';
import 'package:e_commerce_app_ui/utilities/size_config.dart';
import 'package:e_commerce_app_ui/widgets/welcome/error_widget.dart';
import 'package:e_commerce_app_ui/widgets/welcome/form_text_field_widget.dart';
import 'package:e_commerce_app_ui/widgets/welcome/rounded_button.dart';
import 'package:e_commerce_app_ui/widgets/welcome/sign_in_form_widget.dart';
import 'package:e_commerce_app_ui/widgets/welcome/top_texts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const id = '/forgot_password_screen';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String? email;
  bool checkRememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final errors = [];
  final FocusNode focusNodeEmail = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const TopTextsWidget(
                    upperText: 'Forgot Password',
                    downText:
                        'Please enter your email and we will send you a link to return to your account',
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SignInFormWidget(
                    formKey: _formKey,
                    children: [
                      FormTextFieldWidget(
                        onSaved: (value) {
                          email = value;
                        },
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        imageSource: 'Mail',
                        focusNode: focusNodeEmail,
                        onTap: () {
                          setState(() {});
                        },
                        obsecureText: false,
                        textInputType: TextInputType.emailAddress,
                        errors: errors,
                        password: '',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: List.generate(errors.length,
                        (index) => errorWidget(errorText: errors[index])),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  RoundedButtonWidget(
                    text: 'Continue',
                    onPressed: () {
                      _formKey.currentState!.save();
                      setState(() {});
                      if (_formKey.currentState!.validate() && errors.isEmpty) {
                        Navigator.pushNamed(
                            context, SuccessfulRegistrationScreen.id,
                            arguments: {
                              'title': 'Success Send Email',
                              'text':
                                  'We send a new password to your email check it!',
                              'textButton': 'Back To Sign In'
                            });
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
