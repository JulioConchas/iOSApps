import 'package:bmi_calculator/components/reusablecard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class  ResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage({required this.bmiResult, required this.resultText, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                    'Your Result',
                  style: kTitleTextStyle,
                ),
              )
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        bmiResult.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF24D870)
                    ),
                    ),
                    Text(
                        resultText,
                    style:TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold
                    ) ,
                    ),
                    Text(
                        interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0
                    ),
                    )
                  ],
                ),
              )
          ),
          BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: (){
                Navigator.pop(context);
              }
              )
        ],
      ),
    );
  }
}
