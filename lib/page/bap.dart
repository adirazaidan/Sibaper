// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibaperr/components/dosen.dart';
import 'package:sibaperr/components/textfield.dart';
import 'package:sibaperr/page/baplist.dart';

class BapPage extends StatefulWidget {
  final Dosen dosen;

  const BapPage({super.key, required this.dosen});

  @override
  _BapPageState createState() => _BapPageState();
}

class _BapPageState extends State<BapPage> {
  String? _selectedMatkul;
  String? _selectedKelas;
  List<String> _filteredKelas = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
          'Matkul & Kelas',
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
        color: const Color.fromARGB(255, 125, 9, 1),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              RoundedDropdownField(
                hintText: 'Pilih Matkul',
                icon: Icons.book,
                items: widget.dosen.matkulDiampu.map((matkul) => matkul.nama).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedMatkul = value;
                    _selectedKelas = null;
                    if (value != null) {
                      _filteredKelas = widget.dosen.matkulDiampu
                          .firstWhere((matkul) => matkul.nama == value)
                          .kelasDiampu;
                    } else {
                      _filteredKelas = [];
                    }
                  });
                },
              ),
              RoundedDropdownField(
                hintText: 'Pilih Kelas',
                icon: Icons.class_,
                items: _filteredKelas,
                onChanged: (value) {
                  setState(() {
                    _selectedKelas = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _selectedMatkul != null && _selectedKelas != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BapListPage(
                              dosen: widget.dosen,
                              selectedMatkul: _selectedMatkul!,
                              selectedKelas: _selectedKelas!,
                            ),
                          ),
                        );
                      }
                    : null,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromARGB(255, 252, 55, 41),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text
                      Text(
                        'Isi BAP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      // Icon
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
