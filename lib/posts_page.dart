import 'package:flutter/material.dart';
import 'package:lookal/widget/header_widget.dart';
import 'package:lookal/widget/search_widget.dart';

class PostsPage extends StatefulWidget {
  final String user_type;
  final String user_id;

  const PostsPage({
    Key? key,
    required this.user_type,
    required this.user_id,
  }) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            /// Header Widget
            const HeaderWidget(),

            /// Divider
            const Divider(
              height: 10,
              color: Colors.black54,
            ),

            // /// Search Widget
            // const SearchWidget(),
            Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width - 20) / 2,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        Text(
                          "Sell",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 20) / 2,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Text("Categories"),
                  ),
                ),
              ],
            ),

            /// ListView
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 300,
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 0.3,
                          // offset: Offset(0, 0),
                          blurRadius: 0.3,
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(100),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Richard A. Aldea",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "17 minutes ago",
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Text(
                                        "Php 20/kilo",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Cabbage 20pesos per kilo nalang po pa ubos nalang po meron pa akong 50kl.",
                                ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                // Text(
                                //   "Php 20/kilo",
                                //   style: TextStyle(
                                //     color: Colors.blue,
                                //     fontSize: 16,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoM1mYfFL8CRDMNxUUKppwR95Im6NW2c3lg0qRHKvwrdV43nDC4hPpX3pSfaQJE1jV1uU&usqp=CAU",
                                  ),
                                ),
                              ),
                            ),
                          )
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
