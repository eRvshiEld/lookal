import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookal/widget/header_widget.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 24,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoM1mYfFL8CRDMNxUUKppwR95Im6NW2c3lg0qRHKvwrdV43nDC4hPpX3pSfaQJE1jV1uU&usqp=CAU",
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cabbage",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.pesoSign,
                        size: 20,
                      ),
                      Text(
                        "20",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.local_attraction_rounded,
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
