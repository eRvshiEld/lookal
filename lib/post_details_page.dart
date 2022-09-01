import 'package:flutter/cupertino.dart';
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                    size: 24,
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                ],
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
                    height: 3,
                  ),
                  Row(
                    children: [
                      // FaIcon(
                      //   FontAwesomeIcons.euroSign,
                      //   size: 20,
                      // ),
                      Text(
                        "Php20",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.mapMarkedAlt,
                        size: 15,
                        color: Colors.red[900],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Lamcaliaf, Polomolok South Cotabato",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg"),
                      ),
                    ),
                  ),
                  Text(
                    "Contact No.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("09091234567"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Cabbage 20pesos per kilo nalang po pa ubos nalang po meron pa akong 50kl.",
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
