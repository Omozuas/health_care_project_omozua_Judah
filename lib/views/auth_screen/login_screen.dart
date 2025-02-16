import 'package:automatedcountingapp/common/app_style.dart';
import 'package:automatedcountingapp/common/custom_textfield.dart';
import 'package:automatedcountingapp/common/reuseable_text.dart';
import 'package:automatedcountingapp/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _numberController = TextEditingController();
  bool _isPasswordObscured = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                bottom: 10.h,
                top: 10.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/barulogo.svg',
                          height: 30.h,
                          width: 73.w,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReuseableText(
                          text: 'Admin App',
                          style: appStyle(16, appBlack, FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CustomTextFields(
                    controller: _numberController,
                    firstText: "Login to begin counting",
                    hintText: 'Phone number',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
