import 'package:flutter/material.dart';
import 'package:lookal/login/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) {
                              return const LoginPage();
                            }),
                          );
                        },
                        child: const Text("Sign in"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.width - 200) / 2,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 260,
                    child: Image.asset("assets/img/logo.png"),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF475934),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: const Center(
                  child: InkWell(
                    child: Text(
                      "Enter",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
