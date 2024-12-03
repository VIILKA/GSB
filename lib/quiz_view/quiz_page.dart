import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsb_new_app/models/question.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;

  // Список вопросов и ответов
  final List<Question> _questions = [
    Question(
      text:
          'Which country has won the World Cup Football the maximum number of times?',
      options: ['Germany', 'Brazil', 'England', 'Argentina'],
      correctOptionIndex: 1,
    ),
    Question(
      text:
          'Which of the following international tennis tournaments is held on grass court?',
      options: ['Australian open', 'Wimbledon', 'Frencj open', 'US open'],
      correctOptionIndex: 1,
    ),
    Question(
      text: 'Sambo, a form of martial arts is associeated with which country?',
      options: ['China', 'Russia', 'Japan', 'Korea'],
      correctOptionIndex: 1,
    ),
    Question(
      text: 'Who was the winner of four WTA singles tournaments?',
      options: [
        'Veronika Kudermetova',
        'Victoria Azarenko',
        'Paula Badosa',
        'Elise Mertens'
      ],
      correctOptionIndex: 2,
    ),
    Question(
      text:
          'Who amomng the following was the first heavyweight boxer to go undefeated throughout his career?',
      options: [
        'Rocky Marciano',
        'Lee Epperson',
        'Larry Holmes',
        'Michael Spinks'
      ],
      correctOptionIndex: 0,
    ),
    Question(
      text:
          'Who was the only player to win all 12 major matches he participated in?',
      options: [
        'Nikoloz Basilashvili',
        'Cameron Norrie',
        'Filip Polasek',
        'Andrey Rublev'
      ],
      correctOptionIndex: 1,
    ),
    Question(
      text: 'Which is the reckoning year for beginning of Open Era tennis?',
      options: ['1968', '1962', '1970', '1966'],
      correctOptionIndex: 0,
    ),
    Question(
      text: 'Who is the youngest chess player to top the official FIDE rating?',
      options: [
        'Fabiano Caruana',
        'Wesley So',
        'Magnus Carlsen',
        'Sergey Karjakin'
      ],
      correctOptionIndex: 2,
    ),
    // Добавьте еще вопросы
  ];

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == _questions[_currentQuestionIndex].correctOptionIndex) {
      setState(() {
        _currentQuestionIndex = (_currentQuestionIndex + 1) % _questions.length;
      });
    } else {
      _showLoseDialog();
    }
  }

  void _showLoseDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        contentPadding: EdgeInsets.zero, // Убираем стандартные отступы
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Закругленные углы
        ),
        content: Stack(
          children: [
            // Фоновая картинка
            Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/360_F_99235383_EfGbYsCdUrYdmJgIPsuSQ3BGT7EQC6wH.jpg'), // Путь к картинке
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Содержимое поверх фона
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'You lose',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Закрыть диалог
                      setState(() {
                        _currentQuestionIndex = 0; // Сбросить индекс вопроса
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Try Again',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/slide-0.jpg'), // Укажите путь к вашему фону
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 200,
              ),
              // Контейнер для вопроса
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  question.text,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              // Кнопки для вариантов ответа
              ...List.generate(question.options.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () => _answerQuestion(index),
                    child: Text(
                      question.options[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
              const Spacer(),
              // Кнопка выхода
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.white,
                    shadowColor: Colors.black.withOpacity(0.2),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 0, 108, 197), width: 5),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Exit',
                    style: GoogleFonts.chicle(
                      textStyle: const TextStyle(
                        fontSize: 34,
                        color: Color.fromARGB(255, 0, 108, 197),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
