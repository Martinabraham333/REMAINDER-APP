import 'package:flutter/material.dart';
import 'package:remainder_app/core/constants/app_colors.dart';
import 'package:remainder_app/core/widgets/customButton.dart';
import 'package:remainder_app/core/widgets/customText.dart';
import 'package:remainder_app/core/widgets/customTextfield.dart';
import 'package:remainder_app/features/auth/presentation/screens/signinScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:remainder_app/features/remainders/presentation/screens/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential = await _auth.signInWithCredential(
          credential,
        );
        if (userCredential.user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ),
          );
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

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
            Center(
              child: CustomText(
                text: 'Join us today!',
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.02),
            Center(
              child: CustomText(
                text: 'Let’s set up your account',
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
        CustomTextfield(
          title: 'Confirm Password',
          hint: 'Enter Password',
          controller: _confirmPasswordController,
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
        SizedBox(height: height * 0.01),
        GestureDetector(
          onTap: () async {
            await _signInWithGoogle();
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
                    CustomText(text: 'Sign up with google '),
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
        CustomText(text: 'Already have an account? '),
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
          child: CustomText(
            text: ' Sign in here',
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
