import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class Selectmode {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const Selectmode({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State {
  bool questionFlag = true;
  int questionIndex = 0;
  int correctAnswer = 0;
  int selectedAnswerIndex = -1;
  List allQuestions = [
    const Selectmode(
      question: "Who is the Founder of MicroSoft",
      options: ["steve jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 2,
    ),
    const Selectmode(
        question: "Who is the Founder of Amazon",
        options: ["jonny Bhai", "Jeff Bezos", "Bill Gates", "Elon Musk"],
        answerIndex: 1),
    const Selectmode(
      question: "Who is the Founder of Apple",
      options: ["steve jobs", "Jeff Bezos", "Mark ", "Elon Musk"],
      answerIndex: 0,
    ),
    const Selectmode(
      question: "Who is the Founder of Tesla",
      options: ["Raj Pawar", "Jeff Bezos", "Larry Page", "Elon Musk"],
      answerIndex: 3,
    ),
    const Selectmode(
      question: "Who is the Founder of Google",
      options: ["steve jobs", "Larry Page", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
    ),
  ];
  MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedAnswerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void validateNextPage() {
    if (questionIndex == allQuestions.length - 1) {
      setState(() {
        questionFlag = false;
      });
    }
    if (selectedAnswerIndex == -1) {
      return;
    }
    if (selectedAnswerIndex == allQuestions[questionIndex].answerIndex) {
      correctAnswer++;
    }
    if (selectedAnswerIndex != -1) {
      setState(() {
        questionIndex++;
        selectedAnswerIndex = -1;
      });
    }
  }

  Scaffold isQuestionScrren() {
    if (questionFlag == true) {
      return Scaffold(
        drawer: const Drawer(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.yellow,
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "QuizApp",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w800, color: Colors.red),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            validateNextPage();
          },
          // tooltip: "Next",
          child: const Icon(
            Icons.forward,
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Questions : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 380,
              height: 50,
              child: Text(
                "${questionIndex + 1})${allQuestions[questionIndex].question}",
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(0)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 0;
                    });
                  }
                },
                child: Text("A.${allQuestions[questionIndex].options[0]}"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(1)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 1;
                    });
                  }
                },
                child: Text("B.${allQuestions[questionIndex].options[1]}"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(2)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 2;
                    });
                  }
                },
                child: Text("C.${allQuestions[questionIndex].options[2]}"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(3)),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 3;
                    });
                  }
                },
                child: Text("D.${allQuestions[questionIndex].options[3]}"),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w800, color: Colors.red),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 200,
                  width: 350,
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmgrmOi-ZfzcHkK4YHVYNkD55LJnlD1qC-Tw&usqp=CAU")),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Congratulations!!!!",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "  You Have Completed The Quiz",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "  Your Score is",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "$correctAnswer/${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  selectedAnswerIndex = -1;
                  questionIndex = 0;
                  questionFlag = true;
                  correctAnswer = 0;
                  setState(() {});
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScrren();
  }
}
