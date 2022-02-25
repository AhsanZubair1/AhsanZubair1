import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:untitled/Constants/Colors.dart';
import 'package:untitled/SittingPlane/Resturatnt.dart';
import 'package:untitled/SittingPlane/SittingPAlne.dart';


const storedPasscode = '123456';
class Passscode extends StatefulWidget {
  const Passscode({Key? key}) : super(key: key);

  @override
  _PassscodeState createState() => _PassscodeState();
}

class _PassscodeState extends State<Passscode> {
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Future.delayed(Duration(milliseconds: 1),(){
      _defaultLockScreenButton(context);

    });
    super.didChangeDependencies();
  }
  final StreamController<bool> _verificationNotifier =
  StreamController<bool>.broadcast();

  bool isAuthenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Ccolors.appbarrcolo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Ccolors.appbarrcolo
            )


          ],
        ),
      ),
    );
  }
  _defaultLockScreenButton(BuildContext context) => Container(

      height: MediaQuery.of(context).size.height*0.8,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Ccolors.appbarrcolo,
      ),
      child:
      _showLockScreen(
        context,
        opaque: false,
        circleUIConfig: CircleUIConfig(
          fillColor: Ccolors.textcolor,

        ),
        keyboardUIConfig: KeyboardUIConfig(
          primaryColor: Ccolors.appbarrcolo,
          digitBorderWidth: 0.0,
        ),
        cancelButton: Text(
          'Cancel',
          style: const TextStyle(fontSize: 16, color: Colors.white),
          semanticsLabel: 'Cancel',
        ),

      )
  );


  _showLockScreen(
      BuildContext context, {
        required bool opaque,
        CircleUIConfig? circleUIConfig,
        KeyboardUIConfig? keyboardUIConfig,
        required Widget cancelButton,
        List<String>? digits,
      }) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
                title: Column(
                  children: [
                    Image.asset("Assets/tlogo.png"),
                    Text("Event Management",style: TextStyle(
                        color: Ccolors.textcolor,
                        fontSize: 24
                    ),

                    ),
                    Text("Enter your Passcode",style: TextStyle(
                        color: Colors.white,
                        fontSize: 15
                    ),

                    ),

                  ],
                ),
                circleUIConfig: circleUIConfig,
                keyboardUIConfig: keyboardUIConfig,
                passwordEnteredCallback: _onPasscodeEntered,
                cancelButton: cancelButton,
                deleteButton: Text(
                  'Delete',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  semanticsLabel: 'Delete',
                ),
                shouldTriggerVerification: _verificationNotifier.stream,
                backgroundColor: Colors.black.withOpacity(0.8),
                cancelCallback: _onPasscodeCancelled,
                digits: digits,
                passwordDigits: 6,
                bottomWidget: _buildPasscodeRestoreButton(),
              ),
        ));
  }

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Resturants()));
      });
    }
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  _buildPasscodeRestoreButton() => Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
      child: TextButton(
        child: Text(
          "Reset passcode",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w300),
        ),
        onPressed: _resetAppPassword,
        // splashColor: Colors.white.withOpacity(0.4),
        // highlightColor: Colors.white.withOpacity(0.2),
        // ),
      ),
    ),
  );

  _resetAppPassword() {
    Navigator.maybePop(context).then((result) {
      if (!result) {
        return;
      }
      _showRestoreDialog(() {
        Navigator.maybePop(context);
        //TODO: Clear your stored passcode here
      });
    });
  }

  _showRestoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Reset passcode",
            style: const TextStyle(color: Colors.black87),
          ),
          content: Text(
            "Passcode reset is a non-secure operation!\n\nConsider removing all user data if this action performed.",
            style: const TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text(
                "Cancel",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            TextButton(
              child: Text(
                "I understand",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: onAccepted,
            ),
          ],
        );
      },
    );
  }
}
