import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/percent_indicator.dart';

class dashboard extends StatefulWidget {

  String users = '';
  dashboard({Key? key, required this.users}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Estimacloud",
          style: TextStyle(
            fontFamily: 'BebasNeue',
            fontSize: 50,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(123,44,191,1.0),

      ),
      body: Center(
 /**       child: CircularPercentIndicator(
          animation: true,
          animationDuration: 750,
          radius: 200,
          lineWidth: 30,
          percent: 0.4,
          progressColor: Color.fromRGBO(123, 44, 191, 1.0),
          backgroundColor: Colors.deepPurple.shade100,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(
            '40%',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 50
            ),
          ),
        ),**/
        child: Text(
          '${widget.users} utilisateurs',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 50
          ),
        ),
      ),
    );
  }
}

