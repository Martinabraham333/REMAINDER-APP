import 'package:flutter/material.dart';
import 'package:remainder_app/core/constants/app_colors.dart';
import 'package:remainder_app/core/widgets/customButton.dart';
import 'package:remainder_app/core/widgets/customSearchfield.dart';
import 'package:remainder_app/features/connections/presentation/screens/connection_list_screen.dart';
import 'package:remainder_app/features/connections/presentation/screens/pending_connection_screen.dart';

class ConnectonsScreen extends StatefulWidget {
  const ConnectonsScreen({super.key});

  @override
  State<ConnectonsScreen> createState() => _ConnectonsScreenState();
}

class _ConnectonsScreenState extends State<ConnectonsScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white, size: 35),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomSearchField(
                          controller: _searchController,
                          hintText: 'Search by email',
                          onSubmitted: (p0) {},
                        ),

                        SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            child: Center(child: Text("No connection found")),
                          ),
                        ),

                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: 35,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.send,
                                color: AppColors.primaryColor,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: AppColors.primaryColor,
          shape: CircleBorder(),
        ),
        body: TabBarView(
          children: [ConnectionListScreen(), PendingConnectionScreen()],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            overlayColor: WidgetStateProperty.all(
              const Color.fromARGB(255, 194, 252, 247),
            ),
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.check_circle), text: 'Accepted'),
              Tab(icon: Icon(Icons.hourglass_empty), text: 'Pending'),
            ],
          ),
        ),
      ),
    );
  }
}
