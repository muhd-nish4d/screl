import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screl/models/user_model/user_model.dart';

class ScreenUserDetail extends StatelessWidget {
  const ScreenUserDetail({super.key, required this.usermodel});
  final UserModel usermodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.back)),
                    
              ],
            )
          ],
        ),
      ),
    );
  }
}
