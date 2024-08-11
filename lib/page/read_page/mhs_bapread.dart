import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sibaperr/components/dosen.dart';

class MhsBapRead extends StatefulWidget {
  final int index;
  final Dosen dosen;
  final String selectedMatkul;
  final String selectedKelas;

  const MhsBapRead({
    super.key,
    required this.index,
    required this.dosen,
    required this.selectedMatkul,
    required this.selectedKelas,
  });

  @override
  _MhsBapReadState createState() => _MhsBapReadState();
}

class _MhsBapReadState extends State<MhsBapRead> {
  final _controllers = List.generate(7, (_) => TextEditingController());
  bool _isLoading = true;
  bool _isLiked = false;
  bool _isDisliked = false;
  bool _isBapFilled = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final keyPrefix = '${widget.dosen.nip}_${widget.selectedMatkul}_${widget.selectedKelas}_${widget.index}';
    final keys = ['tanggal', 'pokokBahasan', 'subPokokBahasan', 'sakit', 'izin', 'alpa', 'media'];

    bool isFilled = true;
    for (int i = 0; i < keys.length; i++) {
      final value = prefs.getString('${keys[i]}_$keyPrefix') ?? '';
      _controllers[i].text = value;
      if (value.isEmpty) {
        isFilled = false;
      }
    }

    setState(() {
      _isLiked = prefs.getBool('isLiked_$keyPrefix') ?? false;
      _isDisliked = prefs.getBool('isDisliked_$keyPrefix') ?? false;
      _isBapFilled = isFilled;
      _isLoading = false;
    });
  }

  Future<void> _saveLikeStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final keyPrefix = '${widget.dosen.nip}_${widget.selectedMatkul}_${widget.selectedKelas}_${widget.index}';
    await prefs.setBool('isLiked_$keyPrefix', _isLiked);
    await prefs.setBool('isDisliked_$keyPrefix', _isDisliked);
  }

  void _toggleLike() {
    if (_isBapFilled) {
      setState(() {
        _isLiked = !_isLiked;
        if (_isLiked) {
          _isDisliked = false;
        }
        _saveLikeStatus();
      });
    }
  }

  void _toggleDislike() {
    if (_isBapFilled) {
      setState(() {
        _isDisliked = !_isDisliked;
        if (_isDisliked) {
          _isLiked = false;
        }
        _saveLikeStatus();
      });
    }
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
          'Berita Acara Perkuliahan ${widget.index + 1}',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 252, 55, 41),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  for (int i = 0; i < _controllers.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(
                            _getLabel(i),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            _controllers[i].text,
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                    ),
                  if (_isBapFilled)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            _isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                            color: _isLiked ? Colors.blue : Colors.grey,
                          ),
                          onPressed: _toggleLike,
                        ),
                        IconButton(
                          icon: Icon(
                            _isDisliked ? Icons.thumb_down : Icons.thumb_down_outlined,
                            color: _isDisliked ? Colors.red : Colors.grey,
                          ),
                          onPressed: _toggleDislike,
                        ),
                      ],
                    ),
                ],
              ),
            ),
    );
  }

  String _getLabel(int index) {
    const labels = ['Tanggal', 'Pokok Bahasan', 'Sub Pokok Bahasan', 'Sakit', 'Izin', 'Alpa', 'Media'];
    return labels[index];
  }
}