import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsb_new_app/quiz_view/quiz_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/slide-0.jpg'), // Замените на ваш фон
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 14, 2, 121),
                  width: 5.0,
                ),
                color: const Color.fromARGB(255, 105, 172, 228),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(15, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text('Main menu',
                      style: GoogleFonts.chicle(
                        textStyle: const TextStyle(
                          fontSize: 39,
                          color: Colors.white,
                        ),
                      )),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 200,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const QuizPage()),
                      );
                    },
                    child: Text(
                      'Play',
                      style: GoogleFonts.chicle(
                        textStyle: const TextStyle(
                          fontSize: 34,
                          color: Color.fromARGB(255, 0, 108, 197),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.black.withOpacity(0.2),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 0, 108, 197),
                        width: 5,
                      ),
                    ),
                    onPressed: () {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop(); // Закрыть приложение на Android
                      } else if (Platform.isIOS) {
                        exit(0); // Закрыть приложение на iOS
                      }
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
      ),
    );
  }
}
