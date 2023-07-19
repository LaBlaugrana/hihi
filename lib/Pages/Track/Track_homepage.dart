import 'package:hush/bottom_navBar.dart';

import '';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'DisplayInfo.dart';
import '../Homepage.dart';
import 'Display_Info.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {

  late int questionIndex;
  late ValueNotifier<int> number;
  late List<int> numberValues; // Store previous number button values
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void storeNumberValue(int value) {
    final documentRef = firestore.collection('numberValues').doc();
    documentRef.set({'value': value});
  }


  void previousQuestion() {
    setState(() {
      if (questionIndex > 0) {
        numberValues[questionIndex] = number.value; // Store current number button value
        questionIndex--;
        number.value = numberValues[questionIndex]; // Retrieve number button value for the previous case
      }
    });
  }

  @override
  void initState() {
    super.initState();
    questionIndex = 0;
    number = ValueNotifier<int>(0);
    numberValues = List<int>.filled(4, 0); // Initialize list with 4 elements, all set to 0
  }

  void resetFirebase(){
    firestore.collection('numberValues').doc('duration').set({
      'value': 0.0,
      'count' : 0
      // Store second question's input in 'wakes' field
    }).catchError((error) {
    });
    firestore.collection('numberValues').doc('wakes').set({
      'value': 0.0,
      'count' : 0
      // Store second question's input in 'wakes' field
    }).catchError((error) {
    });
    firestore.collection('numberValues').doc('timeToSleep').set({
      'value': 0.0,
      'count' : 0
      // Store second question's input in 'wakes' field
    }).catchError((error) {
    });
    firestore.collection('numberValues').doc('quality').set({
      'value': 0.0,
      'count' : 0
      // Store second question's input in 'wakes' field
    }).catchError((error) {
    });
  }

  void nextQuestion() {
    setState(() {
      if (questionIndex < 3) {
        storeNumberValue(number.value); // Store current number button value
        numberValues[questionIndex] = number.value;
        questionIndex++;
        number.value = numberValues[questionIndex]; // Retrieve number button value for the next case
        number.value = 0;
      } else if (questionIndex == 3) {

        numberValues[questionIndex] = number.value;
        // Store current number button value for the 4th question
        //
        firestore.collection('numberValues').doc('duration').get().then((doc) {
          if (doc.exists) {
            var curr_duration = doc.data()?['value'];
            var cnt = doc.data()?['count'];
            // Store each question's input in specific fields in Firebase

            var avg_duration = ((numberValues[0] + (curr_duration * cnt)) / (cnt + 1));

            print(numberValues[0]);
            print('avg: ${avg_duration}');
            print('duration: ${curr_duration}');
            print('count:  ${cnt}');

            firestore.collection('numberValues').doc('duration').set({
              'value': avg_duration,
              'count': (cnt + 1),
            }).then((_) {
              print('Updated duration: ${avg_duration}');
              print('Updated count:  ${cnt}');
            }).catchError((error) {
            });
          } else {
          }
        }).catchError((error) {
        });

        firestore.collection('numberValues').doc('wakes').get().then((doc) {
          if (doc.exists) {
            var curr_wakes = doc.data()?['value'];
            var cnt = doc.data()?['count'];
            // Store each question's input in specific fields in Firebase

            var avg_wakes = ((numberValues[1] + (curr_wakes* cnt)) / (cnt + 1));

            print(numberValues[1]);
            print('avg: ${avg_wakes}');
            print('duration: ${curr_wakes}');
            print('count:  ${cnt}');

            firestore.collection('numberValues').doc('wakes').set({
              'value': avg_wakes,
              'count': (cnt + 1),
            }).then((_) {
              print('Updated wakes: ${avg_wakes}');
              print('Updated count:  ${cnt}');
            }).catchError((error) {
            });
          } else {
          }
        }).catchError((error) {
        });

        firestore.collection('numberValues').doc('timeToSleep').get().then((doc) {
          if (doc.exists) {
            var curr_timeToSleep = doc.data()?['value'];
            var cnt = doc.data()?['count'];
            // Store each question's input in specific fields in Firebase

            var avg_timeToSleep = ((numberValues[2] + (curr_timeToSleep* cnt)) / (cnt + 1));

            print(numberValues[2]);
            print('avg: ${avg_timeToSleep}');
            print('duration: ${curr_timeToSleep}');
            print('count:  ${cnt}');

            firestore.collection('numberValues').doc('timeToSleep').set({
              'value': avg_timeToSleep,
              'count': (cnt + 1),
            }).then((_) {
              print('Updated timeToSleep: ${avg_timeToSleep}');
              print('Updated count:  ${cnt}');
            }).catchError((error) {
            });
          } else {
          }
        }).catchError((error) {
        });

        firestore.collection('numberValues').doc('quality').get().then((doc) {
          if (doc.exists) {
            var curr_quality = doc.data()?['value'];
            var cnt = doc.data()?['count'];
            // Store each question's input in specific fields in Firebase

            var avg_quality = ((numberValues[3] + (curr_quality* cnt)) / (cnt + 1));

            print(numberValues[3]);
            print('avg: ${avg_quality}');
            print('duration: ${curr_quality}');
            print('count:  ${cnt}');

            firestore.collection('numberValues').doc('quality').set({
              'value': avg_quality,
              'count': (cnt + 1),
            }).then((_) {
              print('Updated quality: ${avg_quality}');
              print('Updated count:  ${cnt}');
            }).catchError((error) {
            });
          } else {
          }
        }).catchError((error) {
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NavBar()),
        );

        resetFirebase();

      }
    });
  }

  void decreaseNumber() {
    setState(() {
      if (number.value > 0) {
        number.value--;
      }
    });
  }

  void increaseNumber() {
    setState(() {
      number.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 40,automaticallyImplyLeading: false,
          backgroundColor: Color(0xffF4F8FF),
          actions: [
          Padding(
            padding: const EdgeInsets.only(top:2),
            child: IconButton(

            icon: Icon(Icons.exit_to_app),
        color: Colors.black,
        onPressed: () {
              Navigator.pop(context);
            // Do
        }),
          ),]),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/sleepassesbg.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Container(
                  width: 324,
                  height: 462,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(33),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: previousQuestion,
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              width: 152,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 3,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: FractionallySizedBox(
                                  widthFactor: (questionIndex + 1) / 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF233C67),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 0),
                      buildQuestion(questionIndex),
                      const SizedBox(height: 7),
                      buildImage(questionIndex),
                      const SizedBox(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(
                            backgroundColor: const Color(0xFFFDFCFF),
                            icon: Icons.remove,
                            onPressed: decreaseNumber,
                          ),
                          const SizedBox(width: 16),
                          NumberButton(number: number),
                          const SizedBox(width: 16),
                          RoundedButton(
                            backgroundColor: const Color(0xFFFDFCFF),
                            icon: Icons.add,
                            onPressed: increaseNumber,
                          ),
                        ],
                      ),

                      //NEXT BUTTON

                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (questionIndex == 3) {
                            const Text('Submit');
                            nextQuestion();
                          } else {
                            nextQuestion();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF233C67),
                          ),
                        ),
                        child: Text(questionIndex == 3 ? 'Submit' : 'Next'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildQuestion(int questionIndex) {
  switch (questionIndex) {
    case 0:
      return const Text(
        'How long did you sleep tonight?',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
    case 1:
      return const Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            'How many times did you wake',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            'up in the middle of the night?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    case 2:
      return const Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            'How well-rested do you feel?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            '    on a scale of 0 to 10?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    case 3:
      return const Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            'How would you rate the quality of',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'your sleep on a scale of 0 to 10',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      );
    default:
      return const SizedBox.shrink();
  }
}





Widget buildImage(int questionIndex) {
  switch (questionIndex) {
    case 0:
      return Image.asset(
        'assets/images/sleepasses1.png',
        width: 200,
      );
    case 1:
      return Image.asset(
        'assets/images/sleepasses2.png',
        width: 200,
      );
    case 2:
      return Image.asset(
        'assets/images/sleepasses3.png',
        width: 200,
      );
    case 3:
      return Image.asset(
        'assets/images/sleepasses4.png',
        width: 200,
      );
    default:
      return const SizedBox.shrink();
  }
}

class RoundedButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onPressed;

  const RoundedButton({
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}


class NumberButton extends StatelessWidget {
  final ValueNotifier<int> number;

  NumberButton({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFFDFCFF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: number,
          builder: (context, value, _) {
            return Text(
              value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            );
          },
        ),
      ),
    );
  }
}
