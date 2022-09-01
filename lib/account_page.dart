import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lookal/login/login_page.dart';
import 'package:lookal/widget/header_widget.dart';
import 'package:lookal/widget/menu_button.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Header Widget
              const HeaderWidget(),

              /// Divider
              const Divider(
                height: 5,
                color: Colors.black54,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(250),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.generated.photos/rQb1H7VGHxItfnrHVH5mtWci1Q1wOp6JRmUf_6mcneI/rs:fit:256:256/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/NTExNzg3LmpwZw.jpg",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Mang Roberto",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.mapMarked,
                          size: 16,
                          color: Colors.red[900],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Lamcaliaf, Polomolok South Cotabato"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.phoneAlt,
                          size: 16,
                          color: Colors.blue[900],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text("09091234567"),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 5,
                      ),
                      // color: Colors.red,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 20,
                ),
                child: MenuButton(
                  buttonIcon: Icon(
                    Icons.logout,
                    size: 14,
                    color: Colors.white,
                  ),
                  buttonName: "Logout",
                  onItemPressed: () async {
                    await GoogleSignIn().signOut();
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => LoginPage(),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
