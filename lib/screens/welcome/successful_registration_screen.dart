import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/welcome/sign_in_screen.dart';
import 'package:e_commerce/utilities/size_config.dart';
import 'package:e_commerce/widgets/welcome/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuccessfulRegistrationScreen extends StatefulWidget {
  static const id = '/successful_registration_screen';

  const SuccessfulRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfulRegistrationScreen> createState() =>
      _SuccessfulRegistrationScreenState();
}

class _SuccessfulRegistrationScreenState
    extends State<SuccessfulRegistrationScreen> {
  dynamic map = {};

  @override
  Widget build(BuildContext context) {
    map = ModalRoute.of(context)!.settings.arguments;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${map['title']}'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.04,
                ),
                Image.asset(
                  'assets/images/success.png',
                  height: SizeConfig.screenHeight! * 0.4,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.08,
                ),
                Text(
                  '${map['text']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(30),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 60,
                ),
                RoundedButtonWidget(
                    text: '${map['textButton']}',
                    onPressed: () {
                      map['textButton'] == 'Go To Home'
                          ? Navigator.pushNamedAndRemoveUntil(
                              context, HomeScreen.id, (route) => false)
                          : Navigator.pushNamedAndRemoveUntil(
                              context, SignInScreen.id, (route) => false);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
