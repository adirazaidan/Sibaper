import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibaperr/components/button.dart';
import 'package:sibaperr/components/dosen.dart';
import 'package:sibaperr/page/bap.dart';

class DosenProfilePage extends StatefulWidget {
  final Dosen dosen;

  const DosenProfilePage({super.key, required this.dosen});

  @override
  State<DosenProfilePage> createState() => _DosenProfilePageState();
}

class _DosenProfilePageState extends State<DosenProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile Dosen',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 252, 55, 41),
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color.fromARGB(255, 252, 55, 41),
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.dosen.nama,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NIP : ${widget.dosen.nip}',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Jurusan : Teknik Elektro',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Program Studi : Teknik Informatika',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                    width: size.width * 0.8,
                    child: MyButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BapPage(dosen: widget.dosen)),
                      );
                    },
                    text: 'BAP',
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
