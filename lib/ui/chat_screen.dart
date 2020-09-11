import 'package:flutter/material.dart';
import 'package:flutter_samsung_messaging_app_clone/components/send_text_field.dart';
import 'package:flutter_samsung_messaging_app_clone/models/user.dart';
import 'package:flutter_samsung_messaging_app_clone/theme/samsung_color.dart';
import 'package:flutter_samsung_messaging_app_clone/ui/profile_screen.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key, this.user}) : super(key: key);
  final UserData user;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: SamsungColor.black,
          elevation: 0.0,
          title: GestureDetector(
            child: Text("${widget.user.username}"),
            onTap: navigateToProfile,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: SamsungColor.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: SamsungColor.primaryDark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50.0),
                            topRight: Radius.circular(60.0),
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: 60.0,
                          top: 16.0,
                          right: 10.0,
                        ),
                        padding: EdgeInsets.all(10.0),
                        // height: 40.0,
                        width: 30.0,
                        child: Text(
                          "wfafdassdfas gsdgsdfgsd sfgsdfg sgfsdfgs ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
              SendTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
