import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_solution_1_2022/pages/home/home_page.dart';

import '../../utils/helpers.dart';
import '../main/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _input = '';
  var _message = '';

  @override
  Widget build(BuildContext context) {
    Widget _buildIndicater(bool on) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 16.0,
          height: 16.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pink, width: 1.0),
              color: on ? Colors.pink : Colors.transparent),
        ),
      );
    }

    void _handleClickButton(int num) {
      const password = '123456';

      setState(() {
        if (num == -1) {
          _input = _input.substring(0, _input.length - 1);
        } else {
          _input = _input + num.toString();
        }
      });

      if (_input.length == 6) {
        // ตรวจสอบรหัสผ่านว่าถูกต้องหรือไม่
        if (_input == password) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
          );
          setState(() {
            //showMyDialog(context, 'Sorry', 'Incorrect PIN. Please try again.');
            _message = 'ยินดีต้อนรับสู่ Mobile Banking App :)';
          });
        } else {
          showMyDialog(context, 'Sorry', 'Incorrect PIN, please try again.');
          setState(() {
            _input = '';
            //_message = 'รหัสผ่านไม่ถูกต้อง กรุณาลองใหม่';
          });
        }
      }
    }

    Widget _buildButton(int num) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            _handleClickButton(num);
          },
          customBorder: CircleBorder(),
          child: Container(
            width: 60.0,
            height: 60.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: num != -1
                  ? Border.all(
                color: Color(0xFFCCCCCC),
                width: 1.0,
              )
                  : null,
            ),
            child: num == -1
                ? Icon(Icons.backspace_outlined)
                : Text(
                    num.toString(),
                    style: GoogleFonts.firaCode(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/new-k-plus-logo.png',
            width: 120.0,
          ),
          Text('Please Enetr Your PIN'),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < _input.length; i++) _buildIndicater(true),
              for (var i = _input.length; i < 6; i++) _buildIndicater(false),

              /*_buildIndicater(_input.length >= 1 ? true : false),
              _buildIndicater(_input.length >= 2 ? true : false),
              _buildIndicater(_input.length >= 3 ? true : false),
              _buildIndicater(_input.length >= 4 ? true : false),
              _buildIndicater(_input.length >= 5 ? true : false),
              _buildIndicater(_input.length >= 6 ? true : false),*/
            ],
          ),
          Column(
            children: [
              for (var row in [
                [1, 2, 3],
                [4, 5, 6],
                [7, 8, 9],
              ])
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [for (var i in row) _buildButton(i)],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 76.0, height: 76.0),
                  _buildButton(0),
                  _buildButton(-1),
                ],
              )
            ],
          ),
          Text(_input),
          Text(_message),
        ],
      ),
    );
  }
}
