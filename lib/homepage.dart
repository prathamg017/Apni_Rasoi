import 'package:apnirasoi/cartscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.network(
              'https://assets7.lottiefiles.com/private_files/lf30_nocwwn6m.json',
              height: 400),
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
