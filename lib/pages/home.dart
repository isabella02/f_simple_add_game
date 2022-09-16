import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/Sum_Controller.dart';
import '../widgets/op.dart';
import '../widgets/resultButton.dart';

class SumWidget extends StatelessWidget {
  const SumWidget({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {
    SumController sumController = Get.put(SumController());
    sumController.setValues();
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
                      'Score: ${sumController.score}',
                      style: const TextStyle(
                        fontSize: 36,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          sumController.reset();
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
                    Obx(() => OpWidget(text: sumController.op1.toString())),
                    const OpWidget(text: '+'),
                    Obx(() => OpWidget(text: sumController.op2.toString())),
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
              Obx(() => resultButton(sumController.vectorRta[0])),
              Obx(() => resultButton(sumController.vectorRta[1])),
              Obx(() => resultButton(sumController.vectorRta[2])),
            ],
          ),
        )
      ],
    );
  }
  
}



