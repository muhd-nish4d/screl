import 'package:flutter/material.dart';
import 'package:screl/models/user_model/user_model.dart';
import 'package:screl/screens/user_detail/widgets/appBar.dart';
import 'package:screl/screens/user_detail/widgets/details_section.dart';

class ScreenUserDetail extends StatelessWidget {
  const ScreenUserDetail({super.key, required this.usermodel});
  final UserModel usermodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          ElevatedButton(onPressed: () {}, child: const Text('Location')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailAppBar(usermodel: usermodel),
            DetailsSection(usermodel: usermodel),
          ],
        ),
      ),
    );
  }
}
