import 'package:flutter/material.dart';
import 'package:remainder_app/core/constants/app_colors.dart';
import 'package:remainder_app/core/widgets/customButton.dart';
import 'package:remainder_app/core/widgets/customText.dart';
import 'package:remainder_app/core/widgets/customTextfield.dart';
import 'package:remainder_app/features/auth/presentation/screens/signupScreen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _headerSection(height, width),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.05),
                    _emailPasswordSection(height),
                    SizedBox(height: height * 0.01),
                    _googleSigninSection(height),
                    SizedBox(height: height * 0.05),
                    _footerSection(height),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _headerSection(height, width) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.05,
          horizontal: width * 0.05,
        ),
        child: Column(
          children: [
            Center(child: CustomText(text: 'Welcome back!', fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold,)),
            SizedBox(height: height * 0.02),
            Center(
              child: CustomText(
                text: 'Please sign in to continue',
                fontSize: 20,
                
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _emailPasswordSection(height) {
    return Column(
      children: [
        CustomTextfield(
          title: 'Email',
          hint: 'Enter Email',
          controller: _emailController,
          isPrefix: true,
          prefix: Icons.email_sharp,
        ),
        SizedBox(height: height * 0.03),
        CustomTextfield(
          title: 'Password',
          hint: 'Enter Password',
          controller: _passwordController,
          isPrefix: true,
          prefix: Icons.lock,
          isPassword: true,
          isSuffix: true,
        ),
        SizedBox(height: height * 0.03),
        CustomButton(title: 'Sign In', ontap: () {},),
      ],
    );
  }

  Column _googleSigninSection(height) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: 'Or'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: height * 0.01),
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.6),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.primaryColor, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/google.png', width: 30, height: 30),
                    SizedBox(width: 20),
                    CustomText(text: 'Sign in with google '),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _footerSection(height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: 'Don’t have an account ? '),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignupScreen();
                },
              ),
            );
          },
          child: CustomText(text: ' Register now', color:AppColors.primaryColor ),
        ),
      ],
    );
  }
}
