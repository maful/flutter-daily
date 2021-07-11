import 'package:countdown_timer/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color(0XFFE09F3E),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Beer Timer',
              style: GoogleFonts.fredokaOne(
                textStyle: Theme.of(context).textTheme.headline3,
                color: Color(0XFFd9c245).withOpacity(.8),
              ),
            ),
            SizedBox(height: 20.0),
            Image.asset(
              'assets/beer.png',
              height: 200,
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                child: TimerIndicator(),
              ),
            ),
            SizedBox(height: 10),
            ButtonsStatus(),
          ],
        ),
      ),
    );
  }
}
