import 'package:e_commerce_app_ui/screens/welcome/sign_in_screen.dart';
import 'package:e_commerce_app_ui/widgets/welcome/account_state_widget.dart';
import 'package:e_commerce_app_ui/widgets/welcome/error_widget.dart';
import 'package:e_commerce_app_ui/widgets/welcome/form_text_field_widget.dart';
import 'package:e_commerce_app_ui/widgets/welcome/rounded_button.dart';
import 'package:e_commerce_app_ui/widgets/welcome/sign_in_form_widget.dart';
import 'package:e_commerce_app_ui/widgets/welcome/social_icon_widget.dart';
import 'package:e_commerce_app_ui/widgets/welcome/top_texts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'complete_profile_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const id = '/sign_up_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;
  String? password;
  String? confirmPassword;
  bool checkRememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final errors = [];
  final focusNodeEmail = FocusNode();
  final focusNodePassword = FocusNode();
  final focusNodeConfirmPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () => setState(() {
            FocusManager.instance.primaryFocus?.unfocus();
          }),
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
                    const TopTextsWidget(
                      upperText: 'Register Account',
                      downText:
                          'Complete your details or continue with social media',
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
                        const SizedBox(
                          height: 20,
                        ),
                        FormTextFieldWidget(
                          onSaved: (value) {
                            password = value;
                          },
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          imageSource: 'Lock',
                          focusNode: focusNodePassword,
                          onTap: () {
                            setState(() {});
                          },
                          obsecureText: true,
                          textInputType: TextInputType.text,
                          errors: errors,
                          password: password,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormTextFieldWidget(
                          onSaved: (value) {
                            confirmPassword = value;
                          },
                          hintText: 'Re-enter your password',
                          labelText: 'Confirm Password',
                          imageSource: 'Lock',
                          focusNode: focusNodeConfirmPassword,
                          onTap: () {
                            setState(() {});
                          },
                          obsecureText: true,
                          textInputType: TextInputType.text,
                          errors: errors,
                          password: confirmPassword,
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
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {});

                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate() &&
                            errors.isEmpty) {
                          Navigator.pushNamed(
                            context,
                            CompleteProfileScreen.id,
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SocialIconWidget(
                          imageSource: 'google-icon',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SocialIconWidget(
                          imageSource: 'facebook-2',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SocialIconWidget(
                          imageSource: 'twitter',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AccountStateWidget(
                        firstText: 'Already have an account? ',
                        secondText: 'Sign In',
                        onTapSecondText: () {
                          Navigator.pushNamed(context, SignInScreen.id);
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'Note: By continuing your confirm that you are agree with our Term and Condition',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
  }
}
