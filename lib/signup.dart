import 'package:flutter/material.dart';
import 'package:projet_testt/input_file.dart';
import 'package:projet_testt/insert_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            iconSize: 20,
            color: Colors.black,
          ),
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  children: [
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Create an account',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 133, 134, 134),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    inputFile(label: "Username"),
                    inputFile(label: "Email"),
                    inputFile(label: "Password", obscureText: true),
                    inputFile(label: "Confirm password", obscureText: true),
                  ],
                ),
                insertButton(label: "Sign up"),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    Text(
                      " Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        // body: Center(
        //   child: Column(children: [
        //     Container(
        //         padding: EdgeInsets.all(10),
        //         child: const Text(
        //           'Sign up',
        //           style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        //         )),
        //     const Text('Create your account',
        //         style: TextStyle(color: Colors.grey)),
        //     TextField(
        //       decoration: InputDecoration(labelText: 'User name'),
        //     ),
        //     const Text('Password')
        //   ]),
        // ),
      ),
    );
  }
}
