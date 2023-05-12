import 'package:c8_calculator/components/my_btn.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userinput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userinput.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      answer.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        title: "AC",
                        onpress: () {
                          userinput = '';
                          answer = '';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "+/-",
                        onpress: () {
                          userinput += '+/-';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "%",
                        onpress: () {
                          userinput += '%';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "/",
                        onpress: () {
                          userinput += '/';
                          setState(() {});
                        },
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: "7",
                        onpress: () {
                          userinput += '7';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "8",
                        onpress: () {
                          userinput += '8';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "0",
                        onpress: () {
                          userinput += '0';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "x",
                        onpress: () {
                          userinput += '*';
                          setState(() {});
                        },
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: "4",
                        onpress: () {
                          userinput += '4';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "5",
                        onpress: () {
                          userinput += '5';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "6",
                        onpress: () {
                          userinput += '6';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "-",
                        onpress: () {
                          userinput += '-';
                          setState(() {});
                        },
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: "1",
                        onpress: () {
                          userinput += '1';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "2",
                        onpress: () {
                          userinput += '2';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "3",
                        onpress: () {
                          userinput += '3';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "+",
                        onpress: () {
                          userinput += '+';
                          setState(() {});
                        },
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: "0",
                        onpress: () {
                          userinput += '0';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: ".",
                        onpress: () {
                          userinput += '.';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "DEL",
                        onpress: () {
                          userinput =
                              userinput.substring(0, userinput.length - 1);
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "=",
                        onpress: () {
                          equalpress();
                          setState(() {});
                        },
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalpress() {
    Parser p = Parser();
    Expression exp = p.parse(userinput);
    ContextModel model = ContextModel();
    double evl = exp.evaluate(EvaluationType.REAL, model);
    answer = evl.toString();
  }
}
