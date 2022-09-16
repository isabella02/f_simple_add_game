import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/op.dart';
import '../widgets/resultButton.dart';

extension RandomInt on int {
  static int generate({int min = 0, required int max}) {
    final _random = Random();
    return min + _random.nextInt(max - min);
  }
}

class SumWidget extends StatefulWidget {
  const SumWidget({Key? key}) : super(key: key);

  @override
  State<SumWidget> createState() => _SumWidgetState();
}

class _SumWidgetState extends State<SumWidget> {
  late int op1;
  late int op2;
  late int rta;
  List<int> vectorRta = [];
  int score = 0;

  @override
  void initState() {
    super.initState();
  }

  void onResultClick(int value) {
    if (value == rta) {
      score = score + 1;
    }
    setState(() {});
  }

  void setValues() {
    op1 = RandomInt.generate(max: 50);
    op2 = RandomInt.generate(max: 50);

    rta = op1 + op2;
    vectorRta.clear();
    vectorRta.add(rta);
    vectorRta.add(rta + 1);
    vectorRta.add(rta - 1);
    vectorRta.shuffle();
  }

  void reset() {
    setState(() {
      score = 0;
    });

    setValues();
  }

  @override

  Widget build(BuildContext context) {
    setValues();
    return Column(
      children: [

        //score
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Spacer(flex: 1),
                    Text(
                      'Score: $score',
                      style: const TextStyle(
                        fontSize: 36,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          reset();
                        },
                        child: const Icon(Icons.replay),
                      ),
                    )
                  ],
                )),
          ),
          flex: 1,
        ),

        //ope
        
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blue,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OpWidget(text: op1.toString()),
                    const OpWidget(text: '+'),
                    OpWidget(text: op2.toString()),
                    const OpWidget(text: '='),
                    const OpWidget(text: '?'),
                  ]),
            ),
          ),
        ),

        //opt

        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              resultButton(vectorRta[0], onResultClick),
              resultButton(vectorRta[1], onResultClick),
              resultButton(vectorRta[2], onResultClick),
            ],
          ),
        )
      ],
    );
  }
}

