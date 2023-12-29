import 'package:flutter/material.dart';
import 'resuable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResults,
      required this.results,
      required this.interpretation});

  final String bmiResults;
  final String results;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                child: Text('Your Result', style: TitleTextStyle),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      results,
                      style: resultTextStyle,
                    ),
                    Text(
                      bmiResults,
                      style: bmiTextStyle,
                    ),
                    Text(
                      interpretation,
                      style: bodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              text: 'RECALCULATE',
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
