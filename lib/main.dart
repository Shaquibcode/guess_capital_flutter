import 'package:flash_card/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'countries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int score = 0;
  int totalAttempted = 0;
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: totalAttempted < countries.length - 1
          ? Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton(
                child: const Text("Reset"),
                onPressed: () {
                  setState(() {
                    score = 0;
                    totalAttempted = 0;
                  });
                },
              ),
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: const Text("Choose The City"),
                centerTitle: true,
              ),
              backgroundColor: Colors.cyan,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Score : $score/$totalAttempted",
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      height: 200,
                      child: Card(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                showAnswer ? "Capital : " : "Country : ",
                                style: const TextStyle(fontSize: 30),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                !showAnswer
                                    ? countries[totalAttempted]['country']!
                                    : countries[totalAttempted]['city']!,
                                style: const TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showAnswer = !showAnswer;
                          });
                        },
                        child: Text(
                          "Show ${showAnswer ? "Question" : "Answer"}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                            title: "Correct",
                            backGroundColor: Colors.green,
                            onPress: () {
                              setState(() {
                                if (totalAttempted < countries.length - 1) {
                                  score++;
                                  totalAttempted++;
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialog(
                                          title: Text("Alert"),
                                          content: Text("Limit reached"),
                                        );
                                      });
                                }
                              });
                            }),
                        CustomButton(
                            title: "Wrong!",
                            backGroundColor: Colors.redAccent,
                            onPress: () {
                              setState(() {
                                if (totalAttempted < countries.length - 1) {
                                  score++;
                                  totalAttempted++;
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialog(
                                          title: Text("Alert"),
                                          content: Text("Limit reached"),
                                        );
                                      });
                                }
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                title: const Text("The End"),
                centerTitle: true,
              ),
              backgroundColor: Colors.cyan,
              body: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 200,
                      child: Card(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "End Of Questions",
                                style: TextStyle(fontSize: 30),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
