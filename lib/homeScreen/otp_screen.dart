import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homeScreen/phone_number.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(color: Color.fromRGBO(147, 210, 243, 1)),
    );

    var code = "";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'Verify Phone\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(text: '\n', style: TextStyle(fontSize: 15)),
                TextSpan(
                    text: "Code is sent to ${PhoneNumber.num}",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16))
              ])),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 70,
            width: 350,
            child: Pinput(
              defaultPinTheme: defaultPinTheme,
              length: 6,
              showCursor: true,
              onChanged: (value) {
                code = value;
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive the code?",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Request Again',
                      style: TextStyle(
                        color: Color.fromRGBO(6, 29, 40, 1),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                minimumSize: Size(330, 50),
                backgroundColor: Color.fromRGBO(46, 59, 98, 1),
              ),
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: PhoneNumber.verify, smsCode: code);
                  await auth.signInWithCredential(credential);
                  Navigator.pushNamedAndRemoveUntil(context,
                      "/lib/homeScreen/profile.dart", (route) => false);
                } catch (e) {
                  print("wrong otp");
                }
              },
              child: Text(
                'VERIFY AND CONTINUE',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
