import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibaperr/components/dosen.dart';
import 'package:sibaperr/page/bapform.dart';

class BapListPage extends StatefulWidget {
  final Dosen dosen;
  final String selectedMatkul;
  final String selectedKelas;

  const BapListPage({super.key, required this.dosen, required this.selectedMatkul, required this.selectedKelas});

  @override
  _BapListPageState createState() => _BapListPageState();
}

class _BapListPageState extends State<BapListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 9, 1),
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
          'Berita Acara Perkuliahan',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 252, 55, 41),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text(
                    'Dosen: ${widget.dosen.nama}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Matkul: ${widget.selectedMatkul}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    'Kelas: ${widget.selectedKelas}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 12, // Example count
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 252, 55, 41),
                        ),
                        child: const Icon(
                          Icons.book,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Berita Acara Perkuliahan ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Minggu ${index + 1}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: Colors.black54,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromARGB(255, 125, 9, 1),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BapFormField(
                              index: index,
                              dosen: widget.dosen,
                              selectedMatkul: widget.selectedMatkul,
                              selectedKelas: widget.selectedKelas,
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
