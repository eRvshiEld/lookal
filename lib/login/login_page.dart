import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:lookal/posts_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.asset("assets/img/logo.png"),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  final userCredential =
                      await FirebaseAuth.instance.signInAnonymously();

                  if (userCredential.user?.uid != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PostsPage(
                        user_type: 'Anonymously',
                        user_id: userCredential.user!.uid,
                      ),
                    ));
                  }
                },
                child: Text('Sign In Anonymously'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF475934)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(16)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 14))),
              ),
              const SizedBox(height: 16),
              SignInButton(
                Buttons.Google,
                onPressed: () async {
                  final GoogleSignInAccount? googleUser =
                      await GoogleSignIn().signIn();

                  final tempSnapshot = await FirebaseFirestore.instance
                      .collection('farmers')
                      .where('email_address', isEqualTo: googleUser?.email)
                      .get();

                  if (tempSnapshot.docs.isNotEmpty) {
                    // Obtain the auth details from the request.
                    final GoogleSignInAuthentication? googleAuth =
                        await googleUser?.authentication;

                    // Create a new credential.
                    final OAuthCredential googleCredential =
                        GoogleAuthProvider.credential(
                      accessToken: googleAuth!.accessToken,
                      idToken: googleAuth.idToken,
                    );

                    // Sign in to Firebase with the Google [UserCredential].
                    final UserCredential googleUserCredential =
                        await FirebaseAuth.instance
                            .signInWithCredential(googleCredential);

                    // if (googleUserCredential.user?.uid != null) {
                    final querySnapshot = await FirebaseFirestore.instance
                        .collection('farmers')
                        .where('email_address',
                            isEqualTo: googleUserCredential.user!.email)
                        .get();

                    if (querySnapshot.docs.isNotEmpty) {
                      final String farmerId = querySnapshot.docs.first.id;

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => PostsPage(
                          user_type: 'Google',
                          user_id: googleUserCredential.user!.uid,
                          farmer_id: farmerId,
                        ),
                      ));
                      // } else {
                      //   Widget okButton = TextButton(
                      //     child: const Text("Sign in again"),
                      //     onPressed: () {
                      //       Navigator.of(context).pop();
                      //     },
                      //   );

                      //   AlertDialog alert = AlertDialog(
                      //     title: const Text("Ooops!"),
                      //     content: const Text(
                      //         "There was a problem with signing in to your account."),
                      //     actions: [
                      //       okButton,
                      //     ],
                      //   );

                      //   showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return alert;
                      //     },
                      //   );
                      // }
                    }
                  } else {
                    Widget okButton = TextButton(
                      child: const Text("Switch Account"),
                      onPressed: () async {
                        await GoogleSignIn().signOut();
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pop();
                      },
                    );

                    AlertDialog alert = AlertDialog(
                      title: const Text("Ooops!"),
                      content: const Text(
                          "There was a problem with signing in to your account."),
                      actions: [
                        okButton,
                      ],
                    );

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }
                },
              ),
              // const SizedBox(height: 8),
              // SignInButton(
              //   Buttons.FacebookNew,
              //   onPressed: () {},
              // ),
              // const SizedBox(height: 8),
              // SignInButton(
              //   Buttons.Twitter,
              //   onPressed: () {},
              // )
            ],
          ),
        ),
      ),
    );
  }
}
