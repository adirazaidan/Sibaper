import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibaperr/components/dosen.dart';
import 'package:sibaperr/components/textfield.dart';
import 'package:sibaperr/page/read_page/mhs_baplistread.dart';

class MhsDosenListReadPage extends StatefulWidget {
  const MhsDosenListReadPage({super.key});

  @override
  State<MhsDosenListReadPage> createState() => _MhsDosenListReadPageState();
}

class _MhsDosenListReadPageState extends State<MhsDosenListReadPage> {
  List<Dosen> _filteredDosenList = [];

  @override
  void initState() {
    super.initState();
    _filteredDosenList = DosenData.dosenList;
  }

  void _filterDosenList(String query) {
    setState(() {
      _filteredDosenList = DosenData.dosenList
          .where((dosen) => dosen.nama.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showMatkulSelectionDialog(Dosen dosen) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Pilih Matakuliah',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: dosen.matkulDiampu.map((matkul) {
              return ListTile(
                title: Text(matkul.nama),
                onTap: () {
                  Navigator.pop(context);
                  _showKelasSelectionDialog(dosen, matkul);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showKelasSelectionDialog(Dosen dosen, Matkul matkul) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Pilih Kelas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: matkul.kelasDiampu.map((kelas) {
              return ListTile(
                title: Text(kelas),
                onTap: () {
                  Navigator.pop(context);
                  _showActionSelectionDialog(dosen, matkul, kelas);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showActionSelectionDialog(Dosen dosen, Matkul matkul, String kelas) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Pilih Aksi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MhsBapListReadPage(
                        dosen: dosen,
                        selectedMatkul: matkul.nama,
                        selectedKelas: kelas,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 252, 55, 41), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0), 
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0), 
                ),
                child: const Text(
                  'Baca Data',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )

            ],
          ),
        );
      },
    );
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
            onChanged: _filterDosenList,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDosenList.length,
              itemBuilder: (context, index) {
                final dosen = _filteredDosenList[index];
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
                        dosen.nama,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        dosen.nip,
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
                        _showMatkulSelectionDialog(dosen);
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
