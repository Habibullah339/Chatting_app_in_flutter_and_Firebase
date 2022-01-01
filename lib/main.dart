import 'package:flutter/material.dart';
import 'package:vacations_chat_app/screens/after_login.dart';
import 'package:vacations_chat_app/screens/after_registration.dart';
import 'package:vacations_chat_app/screens/welcome_screen.dart';
import 'package:vacations_chat_app/screens/login_screen.dart';
import 'package:vacations_chat_app/screens/registration_screen.dart';
import 'package:vacations_chat_app/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(
  
//   FlashChat()
//   );
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white)
        ),
      ),
     
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context)=>WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
         AfterLogIn.id: (context) =>AfterLogIn(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        AfterRegistration.id: (context)=> AfterRegistration(),
        ChatScreen.id: (context) => ChatScreen(),
       
        
        
      },
    );
  }
}
