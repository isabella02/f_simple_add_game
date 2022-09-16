import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sum_game/controllers/Sum_Controller.dart';

Widget resultButton(int value) {
    SumController myController = Get.find();
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () => myController.checkAnswer(value),
          child: Text(value.toString(),
              style: const TextStyle(
                fontSize: 40,
              ))),
    ));
  }