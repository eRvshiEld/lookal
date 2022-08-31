import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: 40,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 4,
                  color: Color(0xFF3498DB),
                ),
              ),
            ),
            child: Icon(
              color: Color(0xFF3498DB),
              Icons.newspaper,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 6, 20, 9),
            child: FaIcon(
              color: Color(0xFF616464),
              size: 19,
              FontAwesomeIcons.tractor,
            ),
          ),
        ],
      ),
    );
  }
}
