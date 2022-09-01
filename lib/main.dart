import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lookal/login/login_page.dart';
import 'package:lookal/post_details_page.dart';
import 'package:lookal/posts_page.dart';
import 'package:lookal/search_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final provider =
        currentUser?.isAnonymous == true ? "Anonymously" : "Google";

    return MaterialApp(
      title: 'lookal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostDetailsPage(),
      // home: currentUser != null
      //     ? PostsPage(
      //         user_id: currentUser.uid,
      //         user_type: provider,
      //       )
      //     : LoginPage(),
      // home: FutureBuilder(
      // future: FirebaseFirestore.instance.collection("farmers"),
      // builder: builder),
      // home: SearchPage(
      //   user_type: "",
      //   user_id: "",
      // ),
    );
  }
}
