import 'package:e_commerce/utilities/constants.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/welcome/forgot_password_screen.dart';
import 'package:e_commerce/screens/welcome/sign_up_screen.dart';
import 'package:e_commerce/widgets/welcome/account_state_widget.dart';
import 'package:e_commerce/widgets/welcome/error_widget.dart';
import 'package:e_commerce/widgets/welcome/form_text_field_widget.dart';
import 'package:e_commerce/widgets/welcome/rounded_button.dart';
import 'package:e_commerce/widgets/welcome/sign_in_form_widget.dart';
import 'package:e_commerce/widgets/welcome/social_icon_widget.dart';
import 'package:e_commerce/widgets/welcome/top_texts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  static const id = '/sign_in_screen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? email;
  String? password;
  bool checkRememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final errors = [];
  final focusNodeEmail = FocusNode();
  final focusNodePassword = FocusNode();
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
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
                      upperText: 'Welcome Back',
                      downText:
                          'Sign in with your email and password or continue with social media',
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
                          password: '12345678',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checkRememberMe,
                          onChanged: (value) {
                            setState(() {
                              checkRememberMe = !checkRememberMe;
                            });
                          },
                          checkColor: Colors.white,
                          activeColor: kPrimaryColor,
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(fontSize: 18),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.pushNamed(
                                context, ForgotPasswordScreen.id);
                          },
                          child: const Text(
                            'Forgot password',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: kPrimaryColor,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(errors.length,
                          (index) => errorWidget(errorText: errors[index])),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    RoundedButtonWidget(
                      text: 'Sign In',
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                        // FocusManager.instance.primaryFocus?.unfocus();
                        // setState(() {});
                        // _formKey.currentState!.save();
                        // if (_formKey.currentState!.validate() &&
                        //     errors.length == 0) {
                        //   Navigator.pushNamedAndRemoveUntil(
                        //     context,
                        //     SuccessfulRegistrationScreen.id,
                        //     (route) => false,
                        //     arguments: {
                        //       'title': 'Success Sign In',
                        //       'text': 'Success Sign In',
                        //       'textButton': 'Go To Home'
                        //     },
                        //   );
                        // }
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
                        firstText: 'Don\'t have an account? ',
                        secondText: 'Sign Up',
                        onTapSecondText: () {
                          Navigator.pushNamed(context, SignUpScreen.id);
                        })
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
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  final Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
    );
  }
}
