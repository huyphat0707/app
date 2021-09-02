import 'package:app/Controller/user.dart';
import 'package:app/View/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Get.put(UserController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          onPressed: () {
            print(1);
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: IconButton(
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Profile()));
              },
              icon: Icon(Icons.account_box_rounded),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return controller.postLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.getUser.length,
                    itemBuilder: (context, index) {
                      var item = controller.getUser[index];
                      return Card(
                        child: ListTile(
                          title: Text(
                            item.email,
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          subtitle: Text(item.firstName,
                              style: TextStyle(fontSize: 18)),
                          leading: Text(item.lastName),
                          onTap: () {
                            print(item.id);
                          },
                        ),
                      );
                    });
          }))
        ],
      ),
    );
  }
}
