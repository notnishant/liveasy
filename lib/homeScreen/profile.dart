import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

List<String> options = ['Shipper', 'Transporter'];

class _ProfileState extends State<Profile> {
  String currOpt = options[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 200, 20, 0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Please select your profile",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RadioListTile(
                  contentPadding: EdgeInsets.all(15),
                  value: options[0],
                  shape: Border.all(),
                  secondary: Image(
                    image: AssetImage('Images/shipper.png'),
                  ),
                  title: Text(
                    'Shipper',
                  ),
                  subtitle: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing'),
                  groupValue: currOpt,
                  onChanged: (value) {
                    setState(() {
                      currOpt = value.toString();
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              RadioListTile(
                  title: const Text('Transporter'),
                  subtitle: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing'),
                  value: options[1],
                  secondary: Image(
                    image: AssetImage('Images/transporter.png'),
                  ),
                  shape: Border.all(),
                  contentPadding: EdgeInsets.all(15),
                  groupValue: currOpt,
                  onChanged: (value) {
                    setState(() {
                      currOpt = value.toString();
                    });
                  }),
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
                  onPressed: () async {},
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
