import 'package:e_commerce/utilities/constants.dart';
import 'package:e_commerce/screens/welcome/sign_in_screen.dart';
import 'package:e_commerce/utilities/size_config.dart';
import 'package:e_commerce/widgets/welcome/on_boarding.dart';
import 'package:e_commerce/widgets/welcome/rounded_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const id = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 3,
                    child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      itemCount: list.length,
                      itemBuilder: (context, index) => OnBoardingWidget(
                        text: list[index]['text'],
                        sourceImage: list[index]['imageSource'],
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            list.length, (index) => buildDot(index)),
                      ),
                      const Spacer(),
                      RoundedButtonWidget(
                          text: 'Continue',
                          onPressed: () {
                            Navigator.pushNamed(context, SignInScreen.id);
                          }),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
