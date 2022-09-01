import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderWidget2 extends StatefulWidget {
  const HeaderWidget2({Key? key}) : super(key: key);

  @override
  State<HeaderWidget2> createState() => _HeaderWidget2State();
}

class _HeaderWidget2State extends State<HeaderWidget2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(),
    );
  }
}
