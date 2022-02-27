import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Select Number',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Select Number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var images = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png"
  ];

  var imageNumber = [0, 1, 2, 3, 4, 5, 6, 7, 8];

  int generateRandomNumber() {
    var random = Random();

    int min = 1;

    int max = 9;

    int result = min + random.nextInt(max - min);

    return result;
  }

  int randomNumber = 1;
  int score = 0;
  var answerResult = "";

  @override
  Widget build(BuildContext context) {
    randomNumber = generateRandomNumber();
    var shuffleImageNumber = imageNumber..shuffle();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Please select the number $randomNumber"),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {
                  checkAnswer(shuffleImageNumber[0] + 1);
                }, // Handle your callback.
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images[shuffleImageNumber[0]]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {
                  checkAnswer(shuffleImageNumber[1] + 1);
                }, // Handle your callback.
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images[shuffleImageNumber[1]]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {
                  checkAnswer(shuffleImageNumber[2] + 1);
                }, // Handle your callback.
                child: Ink(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images[shuffleImageNumber[2]]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text("Your Answer is $answerResult."),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  setState(() {});
                },
                child: const Text('Next'),
              ),
              const SizedBox(
                height: 12,
              ),
              Text("Score : $score")
            ],
          ),
        ),
      ),
    );
  }

  void checkAnswer(int selectImageNumber) {
    setState(() {
      if (randomNumber == selectImageNumber) {
        score = score + 10;
        answerResult = "correct";
      } else {
        answerResult = "incorrect";
      }
    });
  }
}
