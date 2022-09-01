import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lookal/edit_post_page.dart';
import 'package:lookal/models/product_model.dart';
import 'package:lookal/post_details_page.dart';
import 'package:lookal/widget/header_widget.dart';
import 'package:lookal/widget/menu_button.dart';
import 'package:lookal/widget/search_widget.dart';

class PostsPage extends StatefulWidget {
  final String user_type;
  final String user_id;
  final String? farmer_id;

  const PostsPage({
    Key? key,
    required this.user_type,
    required this.user_id,
    this.farmer_id,
  }) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final productsCollection = FirebaseFirestore.instance.collection('products');

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
              height: 1,
              color: Colors.grey,
            ),

            Row(
              children: [
                if (widget.user_type == "Google")
                  Expanded(
                    child: MenuButton(
                      buttonIcon: Icon(
                        Icons.edit,
                        size: 14,
                        color: Colors.white,
                      ),
                      buttonName: "Sell",
                      onItemPressed: () async {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (_) => EditPostPage(productModel: null, editMode: PostsPage.add, )),
                        // ));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) {
                            return EditPostPage(
                              productModel: null,
                              editMode: EditMode.add,
                              farmerId: widget.farmer_id,
                            );
                          }),
                        );
                      },
                    ),
                  ),
                Expanded(
                  child: MenuButton(
                    buttonIcon: Icon(
                      Icons.menu,
                      size: 14,
                      color: Colors.white,
                    ),
                    buttonName: "Categories",
                  ),
                ),
              ],
            ),

            StreamBuilder<QuerySnapshot>(
              stream: productsCollection.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;

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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) {
                                  return PostDetailsPage(
                                    productModel: ProductModel(
                                      name: data["name"],
                                      price: data["price"],
                                      quantity: data["quantity"],
                                      unit: data["unit"],
                                      category: data["category"],
                                      description: data["description"],
                                      imageUrl: data["image_url"],
                                    ),
                                    productId: snapshot.data!.docs[index].id,
                                  );
                                }),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      BorderRadius.circular(
                                                          100),
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
                                                    data['name'],
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                              "${data['price']}/${data['unit']}",
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
                                        data["description"],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          data['image_url'] ?? "",
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
                  );
                }

                return const Center(
                  child: Text('No items found.'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
