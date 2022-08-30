import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                    child: Icon(
                      color: Color(0xFF616464),
                      Icons.newspaper_outlined,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 5,
              color: Colors.black54,
            ),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
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
                                    " <8/22/2022>",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Cabbage 20php/kl nalang po...",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Brgy. Lamcaliaf, Polomolok",
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
