import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screl/models/user_model/user_model.dart';
import 'package:screl/widgets/user_dp.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    super.key,
    required this.usermodel,
  });

  final UserModel usermodel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.back)),
        const UserDP(),
        const SizedBox(width: 10),
        Text(
          usermodel.username,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
