import 'package:apnirasoi/cartscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80, bottom: 80, right: 80, top: 120),
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPo-torn9o3bEmMZro3fF4kG3hWEf26tAyHGJykvQw0tHBTnVmnz2UddZiIDFtfvH-Y5E&usqp=CAU'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('We deliver food to your doorstep.',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 10,
          ),
          Text('New delicious meals everyday'),
          Spacer(),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return cartScreen();
            })),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Lets Order !',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
