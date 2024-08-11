import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibaperr/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 125, 9, 1),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text(
              "SIBAPER",
              style: GoogleFonts.poppins(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('lib/images/reading.png'),
            ),

            const SizedBox(height: 25),

            Text(
              "Welcome To SIBAPER",
              style: GoogleFonts.poppins(
                fontSize: 44,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Sistem Berita Acara Perkuliahan\nProgram Studi Teknik Informatika",
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 232, 232, 232),
                fontWeight: FontWeight.w600,
                height: 2,
              ),
            ),

            const SizedBox(height: 10),


            MyButton(
              text: 'Masuk',
              onTap: () {

                Navigator.pushNamed(context, '/loginpage');
              },
            ),
          ],
        ),
      ),    
    );
  }
}

