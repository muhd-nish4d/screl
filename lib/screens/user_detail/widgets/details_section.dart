import 'package:flutter/material.dart';
import 'package:screl/models/user_model/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
    required this.usermodel,
  });

  final UserModel usermodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsKeyVal(
              title: 'Full Name',
              subTitle: usermodel.name,
              isLink: false),
          const SizedBox(
            height: 10,
          ),
          DetailsKeyVal(
              title: 'Email', subTitle: usermodel.email, isLink: false),
          const SizedBox(
            height: 10,
          ),
          DetailsKeyVal(
              isLink: false,
              title: 'Address',
              subTitle:
                  '${usermodel.address.street},  ${usermodel.address.suite},  ${usermodel.address.city}'),
          const SizedBox(
            height: 10,
          ),
          DetailsKeyVal(
            title: 'Phone Number',
            subTitle: usermodel.phone,
            isLink: false,
          ),
          const SizedBox(
            height: 10,
          ),
          DetailsKeyVal(
              isLink: true,
              title: 'Visit his site',
              subTitle: usermodel.website,
              ontap: () async {
                final url = Uri.https(usermodel.website);
                if (!await launchUrl(url,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception('Could not launch $url');
                }
              }),
        ],
      ),
    );
  }
}
class DetailsKeyVal extends StatelessWidget {
  const DetailsKeyVal({
    super.key,
    required this.title,
    required this.subTitle,
    this.ontap,
    required this.isLink,
  });

  final String title;
  final String subTitle;
  final bool isLink;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
            onTap: ontap,
            child: Text(
              subTitle,
              style: isLink ? const TextStyle(color: Colors.blue) : null,
            ))
      ],
    );
  }
}
