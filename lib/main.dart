import 'package:e_commerce/screens/cart/cart_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/home/product_detail_screen.dart';
import 'package:e_commerce/screens/home/see_more_screen.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:e_commerce/screens/welcome/complete_profile_screen.dart';
import 'package:e_commerce/screens/welcome/forgot_password_screen.dart';
import 'package:e_commerce/screens/welcome/otp_verification_screen.dart';
import 'package:e_commerce/screens/welcome/sign_in_screen.dart';
import 'package:e_commerce/screens/welcome/sign_up_screen.dart';
import 'package:e_commerce/screens/welcome/splash_screen.dart';
import 'package:e_commerce/screens/welcome/successful_registration_screen.dart';
import 'package:e_commerce/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        CompleteProfileScreen.id: (context) => const CompleteProfileScreen(),
        OTPVerificationScreen.id: (context) => const OTPVerificationScreen(),
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        SuccessfulRegistrationScreen.id: (context) =>
            const SuccessfulRegistrationScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        SeeMoreScreen.id: (context) => const SeeMoreScreen(),
        ProductDetailScrenn.id: (context) => const ProductDetailScrenn(),
        CartScreen.id: (context) => const CartScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
