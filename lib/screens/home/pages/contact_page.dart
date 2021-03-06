import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/components/contact_tile.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ScrollController _contactListController;
  Alignment headerAlignment = Alignment.center;
  EdgeInsets headerPadding = EdgeInsets.only(bottom: 90.0, top: 60.0);
  double headerTextSize = 40.0;
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  _scrollListener() {
    if (_contactListController.offset >=
            _contactListController.position.maxScrollExtent &&
        !_contactListController.position.outOfRange) {
      setState(() {
        headerTextSize = 22.0;
        headerAlignment = Alignment.topLeft;
        headerPadding = EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        );
        print("reached bottom");
      });
    }
    if (_contactListController.offset <=
            _contactListController.position.minScrollExtent &&
        !_contactListController.position.outOfRange) {
      setState(
        () {
          headerTextSize = 40.0;
          headerAlignment = Alignment.bottomCenter;
          headerPadding = EdgeInsets.only(bottom: 90.0, top: 60.0);
          print("reached top");
        },
      );
    }
  }



  @override
  void initState() {
    super.initState();
    _contactListController = ScrollController();
    _contactListController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _contactListController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _users = Provider.of<List<UserData>>(context) ?? List<UserData>();
    final currentUser = Provider.of<UserData>(context) ?? UserData();
    //it removes current user from the list
    _users.removeWhere((userData) {
      return userData.uid == currentUser.uid;
    });
    return Scaffold(
      backgroundColor: SamsungColor.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 400.0,
              child: ListView.builder(
                controller: _contactListController,
                itemCount: _users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ContactTile(
                    userData: _users[index],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
