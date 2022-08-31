import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookal/widget/header_widget.dart';
import 'package:lookal/widget/search_widget.dart';

class FarmersPage extends StatelessWidget {
  const FarmersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            /// Header Widget
            HeaderWidget(),

            /// Divider
            Divider(
              height: 5,
              color: Colors.black54,
            ),

            /// Search Widget
            SearchWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 15,
                      right: 10,
                    ),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 0.1,
                          // offset: Offset(0, 0),
                          blurRadius: 0.2,
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://images.generated.photos/PEaj_IOUSRDVR6eNNLeFk1lwDoNodRx2caLBxYkNGIs/rs:fit:512:512/wm:0.95:sowe:18:18:0.33/czM6Ly9pY29uczgu/Z3Bob3Rvcy1wcm9k/LnBob3Rvcy92M18w/OTE0NDE0LmpwZw.jpg"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Mang Roberto",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " <09091234567>",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                              Text(
                                "Brgy. Lamcaliaf, Polomolok",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Products: Corn, Cabbage, Lettuce",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
