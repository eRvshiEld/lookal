import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookal/account_page.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 20, 0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 90,
            height: 40,
            child: Image.asset("assets/img/logo_brand.png"),
          ),
          Row(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return AccountPage();
                        }),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: FaIcon(
                        color: Color(0xFF616464),
                        size: 19,
                        FontAwesomeIcons.userAlt,
                      ),
                    ),
                  ),
                ],
              ),
              FaIcon(
                color: Color(0xFF616464),
                size: 19,
                FontAwesomeIcons.search,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
