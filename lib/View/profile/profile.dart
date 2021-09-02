import 'package:app/Controller/account.dart';
import 'package:app/View/profile/profile_menu.dart';
import 'package:app/View/profile/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AccountController account = Get.put(AccountController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return account.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      child: Column(
                        children: [
                          ProfilePic(),
                          SizedBox(height: 20),
                          ProfileMenu(
                            text: ("$account.getUser.email"),
                            icon: "assets/icons/User Icon.svg",
                            press: () => {},
                          ),
                        ],
                      ),
                    );
            }),
          ),
        ],
      ),
    );
  }
}
