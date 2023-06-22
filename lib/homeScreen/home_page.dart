import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = [
    'English',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              gradients: [
                [
                  Color.fromRGBO(147, 210, 243, 1),
                  Color.fromRGBO(46, 59, 98, 0.5)
                ],
                [
                  Color.fromRGBO(46, 59, 98, 0.5),
                  Color.fromRGBO(147, 210, 243, 1),
                ],
              ],
              durations: [3500, 19440],
              heightPercentages: [0.78, 0.78],
            ),
            size: Size(double.infinity, double.infinity),
          ),
          Positioned.fill(
            bottom: 100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Image(
                      image: AssetImage('Images/Vector.png'),
                    ),
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 60),
                      child: Image(image: AssetImage('Images/Frame.png'))),
                  RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Please select your Language\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 21,
                            )),
                        TextSpan(
                          text: '\n',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        TextSpan(
                            text: 'You can change the language\nat any time',
                            style: TextStyle(fontSize: 16, color: Colors.grey))
                      ])),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                    height: 45,
                    width: 220,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                    )),
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      value: dropdownValue,
                      isExpanded: true,
                      items: items.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue ?? '';
                        });
                      },
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      minimumSize: Size(220, 45),
                      backgroundColor: Color.fromRGBO(46, 59, 98, 1),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/lib/homeScreen/phone_number.dart');
                    },
                    child: Text(
                      'NEXT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
