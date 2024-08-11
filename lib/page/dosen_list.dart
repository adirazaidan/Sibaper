import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibaperr/components/dosen.dart';
import 'package:sibaperr/components/textfield.dart';
import 'package:sibaperr/page/dosen_profile.dart';

class DosenListPage extends StatefulWidget {
  const DosenListPage({super.key});

  @override
  State<DosenListPage> createState() => _DosenListPageState();
}

class _DosenListPageState extends State<DosenListPage> {
  List<Dosen> _filteredDosenList = [];

  @override
  void initState() {
    super.initState();
    _filteredDosenList = DosenData.dosenList;
  }

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
          'List Dosen',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 252, 55, 41),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          RoundedInputField(
            hintText: 'Cari Nama Dosen',
            icon: Icons.search,
            onChanged: (text) {
              setState(() {
                _filteredDosenList = DosenData.dosenList
                    .where((dosen) => dosen.nama.toLowerCase().contains(text.toLowerCase()))
                    .toList();
              });
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDosenList.length,
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
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        _filteredDosenList[index].nama,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        _filteredDosenList[index].nip,
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
                          MaterialPageRoute(builder: (context) => DosenProfilePage(dosen: _filteredDosenList[index])),
                        );
                      },
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
