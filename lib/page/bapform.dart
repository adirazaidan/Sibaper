import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sibaperr/components/dosen.dart';

class BapFormField extends StatefulWidget {
  final int index;
  final Dosen dosen;
  final String selectedMatkul;
  final String selectedKelas;

  const BapFormField({
    super.key,
    required this.index,
    required this.dosen,
    required this.selectedMatkul,
    required this.selectedKelas,
  });

  @override
  _BapFormFieldState createState() => _BapFormFieldState();
}

class _BapFormFieldState extends State<BapFormField> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = List.generate(7, (_) => TextEditingController());
  bool _isEditable = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final keyPrefix = '${widget.dosen.nip}_${widget.selectedMatkul}_${widget.selectedKelas}_${widget.index}';
    final keys = ['tanggal', 'pokokBahasan', 'subPokokBahasan', 'sakit', 'izin', 'alpa', 'media'];

    bool hasData = false;

    for (int i = 0; i < keys.length; i++) {
      String? value = prefs.getString('${keys[i]}_$keyPrefix');
      _controllers[i].text = value ?? '';
      if (value != null && value.isNotEmpty) {
        hasData = true;
      }
    }

    setState(() {
      _isEditable = !hasData; 
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final keyPrefix = '${widget.dosen.nip}_${widget.selectedMatkul}_${widget.selectedKelas}_${widget.index}';
    final keys = ['tanggal', 'pokokBahasan', 'subPokokBahasan', 'sakit', 'izin', 'alpa', 'media'];

    for (int i = 0; i < keys.length; i++) {
      await prefs.setString('${keys[i]}_$keyPrefix', _controllers[i].text);
    }

    setState(() => _isEditable = false);
  }

  Future<void> _deleteData() async {
    final prefs = await SharedPreferences.getInstance();
    final keyPrefix = '${widget.dosen.nip}_${widget.selectedMatkul}_${widget.selectedKelas}_${widget.index}';
    final keys = ['tanggal', 'pokokBahasan', 'subPokokBahasan', 'sakit', 'izin', 'alpa', 'media'];

    for (String key in keys) {
      await prefs.remove('${key}_$keyPrefix');
      _controllers.forEach((controller) => controller.clear());
    }

    setState(() => _isEditable = true);
  }

  @override
  Widget build(BuildContext context) {
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
          'Berita Acara Perkuliahan ${widget.index + 1}',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 252, 55, 41),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              for (int i = 0; i < _controllers.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: TextFormField(
                    controller: _controllers[i],
                    decoration: InputDecoration(labelText: _getLabel(i)),
                    validator: (value) => (value == null || value.isEmpty) ? 'Field harus diisi' : null,
                    enabled: _isEditable,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _isEditable
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                _saveData();
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0), 
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), 
                      ),
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: !_isEditable ? () => setState(() => _isEditable = true) : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 123, 255), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      ),
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _deleteData(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 0, 0), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      ),
                      child: const Text(
                        'Hapus',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  String _getLabel(int index) {
    const labels = ['Tanggal', 'Pokok Bahasan', 'Sub Pokok Bahasan', 'Sakit', 'Izin', 'Alpa', 'Media'];
    return labels[index];
  }
}
