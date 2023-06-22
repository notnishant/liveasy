import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homeScreen/otp_screen.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});
  static String num = "";
  static String verify = "";

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  static String val = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
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
                    text: 'Please enter your mobile number\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(text: '\n', style: TextStyle(fontSize: 15)),
                TextSpan(
                    text: "You'll recieve a 6 digit code\nto verify next",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16))
              ])),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 70,
            width: 330,
            child: IntlPhoneField(
              showDropdownIcon: false,
              flagsButtonMargin: EdgeInsets.fromLTRB(20, 0, 10, 6),
              dropdownTextStyle: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade900,
              ),
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
                val = phone.completeNumber;
              },
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
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '${val}',
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    PhoneNumber.verify = verificationId;
                    PhoneNumber.num = val;
                    Navigator.pushNamed(
                        context, "/lib/homeScreen/otp_screen.dart");
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
              },
              child: Text(
                'CONTINUE',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
