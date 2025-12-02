import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remainder_app/core/constants/app_colors.dart';
import 'package:remainder_app/core/utils/snackbar_utils.dart';
import 'package:remainder_app/core/widgets/custom_icon_button.dart';
import 'package:remainder_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:remainder_app/features/auth/presentation/screens/signinScreen.dart';
import 'package:remainder_app/features/connections/presentation/screens/connectons_screen.dart';
import 'package:remainder_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:remainder_app/features/remainders/presentation/screens/remainder_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.isSuccess == true && state.isLoading == false) {
                  if (state.actionType == ActionType.signOut) {
                    print(state.actionType);
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

                if (state.isSuccess == false && state.isLoading == false) {
                  if (state.actionType == ActionType.signOut) {
                    print(state.actionType);

                    showWarningSnack(context, state.msg);
                  }
                }
              },
              child: CustomIconButton(
                icon: Icons.logout,
                onTap: () {
                  context.read<AuthBloc>().add(AuthEvent.signOut());
                },
              ),
            ),
          ],
          bottom: TabBar(
            overlayColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 194, 252, 247),
            ),
            labelColor: AppColors.primaryColor, // Selected tab color
            unselectedLabelColor: Colors.grey, // Unselected tab color
            indicatorColor: AppColors.primaryColor, // Underline color
            tabs: [
              Tab(icon: Icon(Icons.notifications_active), text: 'Reminders'),
              Tab(icon: Icon(Icons.group), text: 'Connections'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: TabBarView(
          children: [RemainderScreen(), ConnectonsScreen(), ProfileScreen()],
        ),
      ),
    );
  }
}
