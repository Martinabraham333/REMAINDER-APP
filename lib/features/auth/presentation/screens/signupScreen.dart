import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remainder_app/core/constants/app_colors.dart';
import 'package:remainder_app/core/utils/snackbar_utils.dart';
import 'package:remainder_app/core/widgets/customButton.dart';
import 'package:remainder_app/core/widgets/customText.dart';
import 'package:remainder_app/core/widgets/customTextfield.dart';
import 'package:remainder_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:remainder_app/features/auth/presentation/screens/signinScreen.dart';

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

  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  bool isObscureTextPassword = true;
  bool isObscureTextConfirmPassword = true;
  @override
  void initState() {
    _emailController.text = 'martinmangalagiri@gmail.com';
    //  _emailController.text = 'power2rangers123@gmail.com';
    _passwordController.text = '12345678';
    _confirmPasswordController.text = '12345678';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading == false && state.isSuccess == true) {
          if (state.actionType == ActionType.googleSignIn) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
            showSuccessSnack(context, state.msg);
          }
          if (state.actionType == ActionType.emailPasswordSignUp) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SigninScreen();
                },
              ),
            );
            showSuccessSnack(context, state.msg);
          }
        }

        if (state.isLoading == false && state.isSuccess == false) {
          showErrorSnack(context, state.msg);
        }
      },
      child: SafeArea(
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

  Form _emailPasswordSection(height) {
    return Form(
      key: _signUpKey,
      child: Column(
        children: [
          CustomTextField(
            title: 'Email',
            hintText: 'Enter Email',
            controller: _emailController,

            validator: (p0) {
              final String? msg = emailValidation();
              return msg;
            },
          ),
          SizedBox(height: height * 0.03),
          CustomTextField(
            title: 'Password',
            hintText: 'Enter Password',
            controller: _passwordController,

            isObscureText: isObscureTextPassword,
            validator: (value) {
              final String? msg = passwordValidation();
              return msg;
            },

            icon: isObscureTextPassword == true
                ? Icons.visibility_off
                : Icons.visibility,

            ontap: () {
              setState(() {
                isObscureTextPassword = !isObscureTextPassword;
              });
            },
          ),
          SizedBox(height: height * 0.03),
          CustomTextField(
            title: 'Confirm Password',
            hintText: 'Enter Password',
            controller: _confirmPasswordController,
            isObscureText: isObscureTextConfirmPassword,

            validator: (p0) {
              final String? msg = confirmPasswordValidation();
              return msg;
            },

            icon: isObscureTextConfirmPassword == true
                ? Icons.visibility_off
                : Icons.visibility,

            ontap: () {
              setState(() {
                isObscureTextConfirmPassword = !isObscureTextConfirmPassword;
              });
            },
          ),
          SizedBox(height: height * 0.03),
          CustomButton(
            title: 'Sign Up',
            ontap: () {
              if (_signUpKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                  AuthEvent.signUpWithEmailPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  String? passwordValidation() {
    if (_passwordController.text.isEmpty) {
      return 'Password cannot be empty';
    }
    if (_passwordController.text.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }

  String? confirmPasswordValidation() {
    if (_confirmPasswordController.text.isEmpty) {
      return 'Confirm Password cannot be empty';
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      return 'Password Mismatch';
    }

    return null;
  }

  String? emailValidation() {
    const pattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';

    final regex = RegExp(pattern);

    if (_emailController.text.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!regex.hasMatch(_emailController.text.trim())) {
      return "Enter a valid email address";
    }
    return null;
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
            context.read<AuthBloc>().add(AuthEvent.signInWithGoogle());
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
