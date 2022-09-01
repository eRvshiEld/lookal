import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        margin: EdgeInsets.only(
          left: 15,
          top: 5,
          right: 15,
          bottom: 5,
        ),
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 0.1,
              // offset: Offset(0, 0),
              blurRadius: 0.2,
            )
          ],
        ),
        child: TextFormField(
          // controller: titleinput,
          decoration: const InputDecoration(
            // labelText: 'Price',
            hintText: "Search",
            border: InputBorder.none,
            suffixIcon: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
