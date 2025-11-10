import 'package:flutter/material.dart';
import 'package:remainder_app/core/widgets/customButton.dart';
import 'package:remainder_app/core/widgets/customText.dart';
import 'package:remainder_app/core/widgets/customTextfield.dart';
import 'package:remainder_app/features/auth/presentation/screens/signinScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.1,
              vertical: height * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05),
                _headerSection(height),
                SizedBox(height: height * 0.05),
                _emailPasswordSection(height),
                SizedBox(height: height * 0.05),
                _googleSigninSection(height),
                SizedBox(height: height * 0.05),
                _footerSection(height),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _headerSection(height) {
    return Column(
      children: [
        Center(child: CustomText(text: 'Join us today', fontSize: 40)),
        SizedBox(height: height * 0.02),
        Center(
          child: CustomText(text: 'Let’s create your account', fontSize: 20),
        ),
      ],
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
        CustomButton(title: 'Sign Up', ontap: () {}),
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
        SizedBox(height: height * 0.03),
        CustomButton(
          title: 'Google',
          ontap: () {},
          backGroundColor: Colors.red,
          textColor: Colors.white,
        ),
      ],
    );
  }

  Row _footerSection(height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: 'You’re one of us! '),
        GestureDetector(
          onTap: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SigninScreen();
                },
              ),
            );
          },
          child: CustomText(text: ' Login to continue',color:Colors.black,)
        ),
      ],
    );
  }
}
