import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';
import 'package:vacations_chat_app/screens/chat_screen.dart';

class AfterRegistration extends StatefulWidget {
  static String id = 'after_registration';

  @override
  _AfterRegistrationState createState() => _AfterRegistrationState();
}

class _AfterRegistrationState extends State<AfterRegistration> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        
        child: Column(
        
          children: [
            SizedBox(height: 20,),
            UnDraw(
              color: Colors.blue,
              //illustration: UnDrawIllustration.mobile_application,
              illustration: UnDrawIllustration.welcome_cats,
              
              // placeholder: Text(
              //     "Illustration is loading..."), //optional, default is the CircularProgressIndicator().
              errorWidget: Icon(Icons.error_outline,
                  color: Colors.blue,
                  size:
                      25), //optional, default is the Text('Could not load illustration!').
            ),
            Text(' You Are Registered Successfully', style: TextStyle(color: Colors.black54, fontSize: 20)),
            //SizedBox(height: 10,),
            Text('Now You can start', style: TextStyle(color: Colors.black54, fontSize: 20)),
            Text('chatting', style: TextStyle(color: Colors.black54, fontSize: 20)),
           SizedBox(height: 5,),
TextButton.icon(
    style: TextButton.styleFrom(
      textStyle: TextStyle(color: Colors.blue),
      backgroundColor: Colors.blueAccent,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ), 
    ),
    onPressed: () => {
      Navigator.pushNamed(context, ChatScreen.id),
    },
    icon: Icon(Icons.send_rounded, color: Colors.white, size: 25,),
    label: Text('Start Chat', style: TextStyle(color: Colors.white , fontSize: 15),),
  ),
  SizedBox(height: 5,),

TextButton.icon(
    style: TextButton.styleFrom(
      textStyle: TextStyle(color: Colors.blue),
      backgroundColor: Colors.white,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ), 
    ),
    onPressed: () => {
      _auth.signOut(),
      //Navigator.pop(context),
      Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst),
    },
    icon: Icon(Icons.logout_rounded),
    label: Text('Log Out',),
  ),
  

          ],
        ),
      ),
    );
  }
}
