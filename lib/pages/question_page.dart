// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quiz/model/question_answer.dart';
import 'package:quiz/pages/result_page.dart';
import '../widget/question_set_widget.dart';

class QustionPage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      appBar: AppBar(
        backgroundColor: Color(0xff222222),
        title: Text('Question', style: TextStyle(color: Colors.deepOrange),), actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ResultPage.routeName);
              
            },
            icon: Icon(Icons.save, color: Colors.deepOrange,)),
      ]),
      body: ListView.builder(
        itemCount: questionAnsList.length,
        itemBuilder: (context, index) {
          final ques = questionAnsList[index];
          return QuestionSetWidget(
            index: index,
            onAnswer: (value) {
              ques['givenAns'] = value;
            },
            q: ques,
          );
        },
      ),
    );
  }
}
