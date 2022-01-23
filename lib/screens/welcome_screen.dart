import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
// import 'package:flash_chat/components/rounded_button';

class WelcomeScreen extends StatefulWidget {
  static String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 1),
      vsync: this);

      animation= ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
      
          controller.forward();
    controller.addListener(() {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                 Hero(
              tag:'logo',
              child: Container(
                height: 60.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
                AnimatedTextKit(
                  animatedTexts: [TypewriterAnimatedText('Flash Chat',
                  textStyle:TextStyle(
                    color: Colors.black87,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  )],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: (){Navigator.pushNamed(context, RegistrationScreen.id);
              },
              ),
             RoundedButton(
              title: 'Login',
              colour: Colors.lightBlueAccent,
              onPressed: (){Navigator.pushNamed(context, LoginScreen.id);
              },
              ),
          ],
        ),
      ),
    );
  }
}

