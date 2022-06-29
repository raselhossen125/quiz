// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, prefer_final_fields, unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz/model/question_answer.dart';
import 'package:quiz/pages/result_page.dart';
import '../widget/question_set_widget.dart';

class QustionPage extends StatefulWidget {
  static const routeName = '/';

  @override
  State<QustionPage> createState() => _QustionPageState();
}

class _QustionPageState extends State<QustionPage> {
  bool _hasQuizStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222222),
      appBar: AppBar(
        backgroundColor: Color(0xff222222),
        title: Text(
          'Question',
          style: TextStyle(color: Colors.deepOrange),
        ),
        actions: [
          IconButton(
            onPressed: !_hasQuizStarted
                ? null
                : () {
                    Navigator.pushNamed(context, ResultPage.routeName);
                  },
            icon: Icon(
              Icons.save,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
      body: !_hasQuizStarted
          ? Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _hasQuizStarted = true;
                  });
                },
                child: Container(
                  height: 48,
                  width: 135,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                      child: Text(
                    'START QUIZ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              ),
            )
          : ListView.builder(
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
