import 'package:e_commerce/screens/welcome/otp_verification_screen.dart';
import 'package:e_commerce/widgets/welcome/error_widget.dart';
import 'package:e_commerce/widgets/welcome/form_text_field_widget.dart';
import 'package:e_commerce/widgets/welcome/rounded_button.dart';
import 'package:e_commerce/widgets/welcome/sign_in_form_widget.dart';
import 'package:e_commerce/widgets/welcome/top_texts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CompleteProfileScreen extends StatefulWidget {
  static const id = '/complete_profile_screen';

  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  final _formKey = GlobalKey<FormState>();
  final errors = [];
  final focusNodeFirstName = FocusNode();
  final focusNodeLastName = FocusNode();
  final focusNodePhoneNumber = FocusNode();
  final focusNodeAddress = FocusNode();

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
                    const TopTextsWidget(
                      upperText: 'Complete Profile',
                      downText: 'Complete your profile detail',
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
                            firstName = value;
                          },
                          hintText: 'Enter your first name',
                          labelText: 'First name',
                          imageSource: 'User',
                          focusNode: focusNodeFirstName,
                          onTap: () {
                            setState(() {});
                          },
                          obsecureText: false,
                          textInputType: TextInputType.name,
                          errors: errors,
                          password: '',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormTextFieldWidget(
                          onSaved: (value) {
                            lastName = value;
                          },
                          hintText: 'Enter your last name',
                          labelText: 'Last name',
                          imageSource: 'User',
                          focusNode: focusNodeLastName,
                          onTap: () {
                            setState(() {});
                          },
                          obsecureText: false,
                          textInputType: TextInputType.name,
                          errors: errors,
                          password: '',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormTextFieldWidget(
                          onSaved: (value) {
                            phoneNumber = value;
                          },
                          hintText: 'Enter your phone number',
                          labelText: 'Phone Number',
                          imageSource: 'Phone',
                          focusNode: focusNodePhoneNumber,
                          onTap: () {
                            setState(() {});
                          },
                          obsecureText: false,
                          textInputType: TextInputType.phone,
                          errors: errors,
                          password: '',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FormTextFieldWidget(
                          onSaved: (value) {
                            address = value;
                          },
                          hintText: 'Enter your address',
                          labelText: 'Address',
                          imageSource: 'Location point',
                          focusNode: focusNodeAddress,
                          onTap: () {
                            setState(() {});
                          },
                          obsecureText: false,
                          textInputType: TextInputType.streetAddress,
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
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {});
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate() &&
                            errors.isEmpty) {
                          Navigator.pushNamed(context, OTPVerificationScreen.id,
                              arguments: {'phoneNumber': phoneNumber});
                        }
                      },
                    ),
                    const SizedBox(
                      height: 60,
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
    focusNodeFirstName.dispose();
    focusNodeLastName.dispose();
    focusNodePhoneNumber.dispose();
    focusNodeAddress.dispose();
  }
}
