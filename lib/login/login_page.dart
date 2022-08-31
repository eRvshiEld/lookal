import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:lookal/posts_page.dart';

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
                height: 150,
                child: Image.asset("assets/img/logo.png"),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  final userCredential =
                      await FirebaseAuth.instance.signInAnonymously();

                  if (userCredential.user?.uid != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const PostsPage(),
                    ));
                  }
                },
                child: const Text('Sign In Anonymously'),
              ),
              const SizedBox(height: 8),
              SignInButton(
                Buttons.Google,
                onPressed: () async {},
              ),
              const SizedBox(height: 8),
              SignInButton(
                Buttons.FacebookNew,
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              SignInButton(
                Buttons.Twitter,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
