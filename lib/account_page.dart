import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookal/widget/header_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
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
                            FontAwesomeIcons.locationDot,
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
                            FontAwesomeIcons.phone,
                            size: 16,
                            color: Colors.red[900],
                          ),
                          // SizedBox(
                          //   width: ,
                          // ),
                          Text("Lamcaliaf, Polomolok South Cotabato"),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
