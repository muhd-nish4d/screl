import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screl/models/enums/fetch_status.dart';
import 'package:screl/provider/user_provider.dart';
import 'package:screl/screens/user_detail/user_detail.dart';
import 'package:screl/widgets/user_dp.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<UserProvider>(
        builder: (context, value, child) {
          return value.status == FetchStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : value.status == FetchStatus.succes
                  ? Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CupertinoSearchTextField(),
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: (context, index) {
                              var eachData = value.userData[index];
                              return ListTile(
                                onTap: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) =>
                                      ScreenUserDetail(usermodel: eachData),
                                )),
                                title: Text(eachData.username),
                                leading: const UserDP(),
                                subtitle: Text(eachData.name),
                              );
                            },
                            itemCount: value.userData.length,
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: Row(
                        children: [
                          Icon(Icons.wifi_off_rounded),
                          Text('Something went wrong')
                        ],
                      ),
                    );
        },
      ),
    ));
  }
}
