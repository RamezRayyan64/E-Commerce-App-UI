import 'package:e_commerce_app_ui/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormTextFieldWidget extends StatefulWidget {
  const FormTextFieldWidget({
    Key? key,
    required this.onSaved,
    required this.hintText,
    required this.labelText,
    required this.imageSource,
    required this.focusNode,
    required this.onTap,
    required this.obsecureText,
    required this.textInputType,
    required this.errors,
    required this.password,
  }) : super(key: key);

  final Function(String? value)? onSaved;
  final String hintText;
  final String labelText;
  final String imageSource;
  final FocusNode focusNode;
  final Function() onTap;
  final bool obsecureText;
  final TextInputType textInputType;
  final List errors;
  final String? password;

  @override
  State<FormTextFieldWidget> createState() => _FormTextFieldWidgetState();
}

class _FormTextFieldWidgetState extends State<FormTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      onSaved: widget.onSaved,
      focusNode: widget.focusNode,
      onChanged: (value) {
        widget.labelText == 'Email'
            ? emailOnChange(value)
            : widget.labelText == 'Password'
                ? passwordOnChange(value)
                : widget.labelText == 'Confirm Password'
                    ? cofirmPasswordOnChange(value)
                    : widget.labelText == 'First name'
                        ? firstNameOnChange(value)
                        : widget.labelText == 'Last name'
                            ? lastNameOnChange(value)
                            : widget.labelText == 'Phone Number'
                                ? phoneNumberOnChange(value)
                                : widget.labelText == 'Address'
                                    ? addressOnChange(value)
                                    : () {};
      },
      validator: (value) {
        widget.labelText == 'Email'
            ? emailValidator(value.toString())
            : widget.labelText == 'Password'
                ? passwordValidator(value.toString())
                : widget.labelText == 'Confirm Password'
                    ? confirmPasswordValidator(value.toString())
                    : widget.labelText == 'First name'
                        ? firstNameValidator(value.toString())
                        : widget.labelText == 'Last name'
                            ? lastNameValidator(value.toString())
                            : widget.labelText == 'Phone Number'
                                ? phoneNumberValidator(value.toString())
                                : widget.labelText == 'Address'
                                    ? addressValidator(value.toString())
                                    : () {};
        return null;
      },
      obscureText: widget.obsecureText,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(
            color: widget.focusNode.hasFocus ? kPrimaryColor : kTextColor),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
          child: SvgPicture.asset(
            'assets/icons/${widget.imageSource}.svg',
            color: widget.focusNode.hasFocus ? kPrimaryColor : kTextColor,
          ),
        ),
      ),
    );
  }

  void emailValidator(String value) {
    if (value.isEmpty && !widget.errors.contains(kEmailNullError)) {
      setState(() {
        widget.errors.add(kEmailNullError);
      });
    } else if (!emailValidatorRegExp.hasMatch(value) &&
        !widget.errors.contains(kInvalidEmailError) &&
        !widget.errors.contains(kEmailNullError)) {
      setState(() {
        widget.errors.add(kInvalidEmailError);
      });
    }
  }

  void emailOnChange(String value) {
    if (value.isNotEmpty && widget.errors.contains(kEmailNullError)) {
      setState(() {
        widget.errors.remove(kEmailNullError);
      });
    } else if (emailValidatorRegExp.hasMatch(value) &&
        widget.errors.contains(kInvalidEmailError)) {
      setState(() {
        widget.errors.remove(kInvalidEmailError);
      });
    }
  }

  void passwordValidator(String value) {
    if (value.isEmpty && !widget.errors.contains(kPassNullError)) {
      setState(() {
        widget.errors.add(kPassNullError);
      });
    } else if (value != widget.password &&
        !widget.errors.contains(kMatchPassError) &&
        !widget.errors.contains(kPassNullError)) {
      setState(() {
        widget.errors.add(kMatchPassError);
      });
    }
  }

  void passwordOnChange(String value) {
    if (value.isNotEmpty && widget.errors.contains(kPassNullError)) {
      setState(() {
        widget.errors.remove(kPassNullError);
      });
    } else if (value == widget.password &&
        widget.errors.contains(kMatchPassError)) {
      setState(() {
        widget.errors.remove(kMatchPassError);
      });
    }
  }

  void confirmPasswordValidator(String value) {
    if (value.isEmpty && !widget.errors.contains(kPassNullError)) {
      setState(() {
        widget.errors.add(kEmailNullError);
      });
    } else if (value != widget.password &&
        widget.errors.contains(kMatchPassError)) {
      setState(() {
        widget.errors.remove(kMatchPassError);
      });
    }
  }

  void cofirmPasswordOnChange(String value) {
    if (value.isNotEmpty && widget.errors.contains(kPassNullError)) {
      setState(() {
        widget.errors.remove(kPassNullError);
      });
    } else if (value == widget.password &&
        widget.errors.contains(kMatchPassError)) {
      setState(() {
        widget.errors.remove(kMatchPassError);
      });
    }
  }

  void firstNameValidator(String value) {
    if (value.isEmpty && !widget.errors.contains(kFirstNamelNullError)) {
      setState(() {
        widget.errors.add(kFirstNamelNullError);
      });
    }
  }

  void firstNameOnChange(String value) {
    if (value.isNotEmpty && widget.errors.contains(kFirstNamelNullError)) {
      setState(() {
        widget.errors.remove(kFirstNamelNullError);
      });
    }
  }

  void lastNameValidator(String value) {
    if (value.isEmpty && !widget.errors.contains(kLastNamelNullError)) {
      setState(() {
        widget.errors.add(kLastNamelNullError);
      });
    }
  }

  void lastNameOnChange(String value) {
    if (value.isNotEmpty && widget.errors.contains(kLastNamelNullError)) {
      setState(() {
        widget.errors.remove(kLastNamelNullError);
      });
    }
  }

  void phoneNumberValidator(String value) {
    if (value.isEmpty && !widget.errors.contains(kPhoneNumberNullError)) {
      setState(() {
        widget.errors.add(kPhoneNumberNullError);
      });
    }
  }

  void phoneNumberOnChange(String value) {
    if (value.isNotEmpty && widget.errors.contains(kPhoneNumberNullError)) {
      setState(() {
        widget.errors.remove(kPhoneNumberNullError);
      });
    }
  }

  void addressValidator(String value) {
    if (value.isEmpty && !widget.errors.contains(kAddressNullError)) {
      setState(() {
        widget.errors.add(kAddressNullError);
      });
    }
  }

  void addressOnChange(String value) {
    if (value.isNotEmpty && widget.errors.contains(kAddressNullError)) {
      setState(() {
        widget.errors.remove(kAddressNullError);
      });
    }
  }
}
