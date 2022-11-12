import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_solution_1_2022/utils/my_converter.dart';
//import 'package:midterm_solution_1_2022/my_converter.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {

  var _feedbackText = '';
  final _controller = TextEditingController();

  static const _labelList = [
    'C to F',
    'C to K',
    'F to C',
    'F to K',
    'K to C',
    'K to F'
  ];

  void _handleClickButton(int i) {
    var input = _controller.text;
    if(input == ''){
      setState(() {
        _feedbackText = 'Please enter number.';
      });
      return;
    }
    var temp = double.tryParse(input);
    if(temp == null) {
      setState((){
        _feedbackText = 'Error, please enter number.';
      });
      return;
    }

    switch(i){
      case 0:
      // C to F
        setState(() {
          _feedbackText = '$temp C เท่ากับ ${MyConverter.C2F(temp)} F';
        });
        break;
      case 1:
      // C to K
        setState(() {
          _feedbackText = '$temp C เท่ากับ ${MyConverter.C2K(temp)} K';
        });
        break;
      case 2:
      // F to C
        setState(() {
          _feedbackText = '$temp F เท่ากับ ${MyConverter.F2C(temp)} C';
        });
        break;
      case 3:
      // F to K
        setState(() {
          _feedbackText = '$temp F เท่ากับ ${MyConverter.F2K(temp)} K';
        });
        break;
      case 4:
      // K to C
        setState(() {
          _feedbackText = '$temp K เท่ากับ ${MyConverter.K2C(temp)} C';
        });
        break;
      case 5:
      // K to F
        setState(() {
          _feedbackText = '$temp K เท่ากับ ${MyConverter.K2F(temp)} F';
        });
        break;
    }
  }

  Widget _buildButton(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _handleClickButton(i);
        },
        child: Text(_labelList[i]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var myList = [
      ['C to F', 'C to K'],
      ['F to C', 'F to K'],
      ['K to C', 'K to F'],
    ];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'แปลงหน่วยอุณหภูมิ',
              style: GoogleFonts.kanit(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w200,
              ),
            ),
            Container(
              color: Colors.lightGreen.withOpacity(0.2),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _controller,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(0),
                      _buildButton(1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(2),
                      _buildButton(3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(4),
                      _buildButton(5),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              _feedbackText,
              style: GoogleFonts.sarabun(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
