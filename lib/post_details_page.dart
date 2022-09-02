import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookal/edit_post_page.dart';
import 'package:lookal/models/product_model.dart';
import 'package:lookal/widget/header_widget.dart';

class PostDetailsPage extends StatefulWidget {
  final ProductModel? productModel;
  final String productId;
  final VoidCallback? onItemDeleted;

  const PostDetailsPage({
    super.key,
    this.productModel,
    required this.productId,
    this.onItemDeleted,
  });

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  String? updatedName;
  String? updatedDescription;
  String? updatedCategory;
  String? updatedQuantity;
  String? updateUnit;
  String? updatedPrice;

  // void getData() async {
  //   final querySnapshot = await FirebaseFirestore.instance
  //       .collection('products')
  //       .where('name', isEqualTo: widget.productModel!.name)
  //       .get();

  //   // if (querySnapshot.docs.isNotEmpty) {
  //   //   final name = querySnapshot.docs.first.get("name");
  //   // }
  //   productDescription = querySnapshot.docs.first.get("description");
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('products')
            .doc(widget.productId)
            .get(),
        builder: (context, product) {
          // print(product.data!.data());
          // print(widget.productId);
          if (product.hasData) {
            print(product.data!.data());
            // print('JDG ${product.data!.data()!['name']}');
            // final farmerName = product.data!.data()!['name'];
          }
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Icon(
                              Icons.arrow_back_rounded,
                              size: 24,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Row(
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.edit,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) {
                                      return EditPostPage(
                                        id: widget.productId,
                                        productModel: updatedName != null &&
                                                updateUnit != null &&
                                                updatedQuantity != null &&
                                                updatedCategory != null &&
                                                updatedDescription != null &&
                                                updatedPrice != null
                                            ? ProductModel(
                                                name: updatedName!,
                                                unit: updateUnit!,
                                                quantity: updatedQuantity!,
                                                category: updatedCategory!,
                                                description: updatedDescription,
                                                price: updatedPrice!,
                                              )
                                            : widget.productModel,
                                        editMode: EditMode.edit,
                                      );
                                    }),
                                  ).then((value) {
                                    if (value is ProductModel) {
                                      /// `setState` notifies the Flutter
                                      /// to rebuild the UI
                                      setState(() {
                                        /// Updates local value of the item models
                                        /// to display it on the current page.
                                        updatedName = value.name;
                                        updatedDescription = value.description;
                                        updatedPrice = value.price;
                                      });
                                    }
                                  });
                                },
                              ),
                              SizedBox(width: 16),
                              InkWell(
                                child: Icon(Icons.delete),
                                onTap: () {
                                  widget.onItemDeleted!();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
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
                            // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoM1mYfFL8CRDMNxUUKppwR95Im6NW2c3lg0qRHKvwrdV43nDC4hPpX3pSfaQJE1jV1uU&usqp=CAU",
                            widget.productModel!.imageUrl ??
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
                            updatedName ?? widget.productModel!.name,
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
                                updatedPrice ?? widget.productModel!.price,
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
                            updatedDescription ??
                                widget.productModel!.description ??
                                "",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
