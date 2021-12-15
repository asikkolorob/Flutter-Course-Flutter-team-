import 'package:bmi_calculator/widgets/bmi_button.dart';
import 'package:flutter/material.dart';

import '../helper/constent.dart';
import '../widgets/reuseble_card.dart';

class ResulsPage extends StatelessWidget {
  const ResulsPage({
    Key? key,
    required this.bmiResult,
    required this.interpretation,
    required this.resultText,
  }) : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("BMI CALCULATOR")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 18.0, top: 18.0),
              child: Text(
                'Your Result',
                textAlign: TextAlign.start,
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: ReusableCard(
              onpress: () {},
              color: kActiveCardBackgroundColor,
              cardChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          resultText.toUpperCase(),
                          style: kResultCardHaddingTaxtStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          bmiResult,
                          style: kResultCardNumberStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        interpretation,
                        style: kResultCardDescriptionTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //Bottom Button
          BmiButton(
            onPress: () {
              Navigator.pop(context);
            },
            text: 're-calculate',
          )
        ],
      ),
    );
  }
}
