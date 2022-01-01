import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:vacations_chat_app/components/rounded_button.dart';
import 'package:vacations_chat_app/constants.dart';
import 'package:vacations_chat_app/screens/after_login.dart';
import 'package:vacations_chat_app/screens/chat_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:vacations_chat_app/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  static String id = 'login_sreen';
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration:
                    KTextFieldDecoration.copyWith(hintText: 'Enter Your Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: KTextFieldDecoration.copyWith(
                    hintText: 'Enter Your Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  colour: Colors.lightBlueAccent,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        //Navigator.pushNamed(context, ChatScreen.id);
                        Navigator.pushNamed(context, AfterLogIn.id);

                        var snackBar = SnackBar(
                          content: Text('Log In Success', style: TextStyle(color: Colors.white),),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.RIGHSLIDE,
                          headerAnimationLoop: true,
                          title: 'Invalid User',
                          dialogBackgroundColor: Colors.black87,
                          desc:
                              'UserName Or Password is not Correct. Kindly First Register YourSelf',
                          btnOkOnPress: () {
                            Navigator.pop(context);
                          },
                          btnOkIcon: Icons.cancel,
                          btnOkColor: Colors.red)
                        ..show();
                      //print(e);
                    }
                  },
                  title: 'Log In')
            ],
          ),
        ),
      ),
    );
  }
}
