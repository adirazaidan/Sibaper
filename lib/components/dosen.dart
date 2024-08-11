class Dosen {
  final String nama;
  final String nip;
  final List<Matkul> matkulDiampu;

  Dosen(this.nama, this.nip, this.matkulDiampu);
}

class Matkul {
  final String nama;
  final List<String> kelasDiampu;

  Matkul(this.nama, this.kelasDiampu);
}

class DosenData {
  static final List<Dosen> _dosenList = [
  Dosen(
    'Ferry Faisal, S.ST., M.T.',
    '19730206 199501 1 001',
    [
      Matkul('Web Design', ['Kelas 4A', 'Kelas 4B','Kelas 4D','Kelas 4E']),
    ],
  ),
  Dosen(
    'Yasir Arafat, S.ST., M.T.',
    '19720304 199501 1 001',
    [
      Matkul('Jaringan Komputer', ['Kelas 4D', 'Kelas 4E']),
    ],
  ),
  Dosen(
    'Mariana Syamsudin, S.T., M.T.',
    '19750314 200604 2 001',
    [
      Matkul('Web Design', ['Kelas 4A', 'Kelas 4B','Kelas 4C','Kelas 4D','Kelas 4E']),
    ],
  ),
  Dosen(
    'Suheri, S.T., M.Cs.',
    '19830717 200812 1 005',
    [
      Matkul('Algoritma', ['Kelas M', 'Kelas N']),
      Matkul('Pemrograman', ['Kelas O', 'Kelas P']),
    ],
  ),
  Dosen(
    'Budianingsih, S.T., M.T., S.T., M.T.',
    '19801102 201212 2 003',
    [
      Matkul('Fisika', ['Kelas Q', 'Kelas R']),
      Matkul('Kimia', ['Kelas S', 'Kelas T']),
    ],
  ),
  Dosen(
    'Muhammad Hasbi, S.T., M.T.',
    '19821105 201404 1 014',
    [
      Matkul('Matematika', ['Kelas U', 'Kelas V']),
      Matkul('Statistika', ['Kelas W', 'Kelas X']),
    ],
  ),
  Dosen(
    'Neny Firdyanti, S.T., M.T.',
    '19771002 201404 2 001',
    [
      Matkul('Biologi', ['Kelas Y', 'Kelas Z']),
      Matkul('Kimia', ['Kelas AA', 'Kelas BB']),
    ],
  ),
  Dosen(
    'Fitri Wibowo, S.ST., M.T.',
    '19851228 201504 1 002',
    [
      Matkul('Matematika', ['Kelas 4C', 'Kelas 4D']),
      Matkul('Fisika', ['Kelas 2E', 'Kelas 2F']),
    ],
  ),
  Dosen(
    'Pausta Yugianus, S.Kom., M.T.',
    '19880920 201504 1 003',
    [
      Matkul('Algoritma', ['Kelas GG', 'Kelas HH']),
      Matkul('Pemrograman', ['Kelas II', 'Kelas JJ']),
    ],
  ),
  Dosen(
    'Tri Bowo Atmojo, S.T., M.Cs.',
    '19840717 201903 1 010',
    [
      Matkul('Matematika', ['Kelas KK', 'Kelas LL']),
      Matkul('Statistika', ['Kelas MM', 'Kelas NN']),
    ],
  ),
  Dosen(
    'Lindung Siswanto, S.Kom., M.Eng',
    '19840611 201903 1 012',
    [
      Matkul('Fisika', ['Kelas OO', 'Kelas PP']),
      Matkul('Kimia', ['Kelas QQ', 'Kelas RR']),
    ],
  ),
  Dosen(
    'Muhammad Diponegoro, S.Kom., M.Cs.',
    '19870208 201903 1 005',
    [
      Matkul('Algoritma', ['Kelas SS', 'Kelas TT']),
      Matkul('Pemrograman', ['Kelas UU', 'Kelas VV']),
    ],
  ),
  Dosen(
    'Tommi Suryanto, S.Kom., M.Kom',
    '19901020 201903 1 013',
    [
      Matkul('Matematika', ['Kelas WW', 'Kelas XX']),
      Matkul('Statistika', ['Kelas YY', 'Kelas ZZ']),
    ],
  ),
  Dosen(
    'Sarah Bibi, S.ST., M.Pd.',
    '19880604 201909 2 001',
    [
      Matkul('Biologi', ['Kelas AAA', 'Kelas BBB']),
      Matkul('Kimia', ['Kelas CCC', 'Kelas DDD']),
    ],
  ),
    Dosen(
    'Suharsono, S. Kom., M. Kom',
    '19881111 202203 1 006',
    [
      Matkul('Algoritma', ['Kelas EEE', 'Kelas FFF']),
      Matkul('Pemrograman', ['Kelas GGG', 'Kelas HHH']),
    ],
  ),
  Dosen(
    'Novi Aryani Fitri, S.T., M.Tr.Kom',
    '19911113 202203 2 016',
    [
      Matkul('Matematika', ['Kelas III', 'Kelas JJJ']),
      Matkul('Statistika', ['Kelas KKK', 'Kelas LLL']),
    ],
  ),
  Dosen(
    'Safri Adam, S. Kom., M. Kom',
    '19940716 202203 1 006',
    [
      Matkul('Fisika', ['Kelas MMM', 'Kelas NNN']),
      Matkul('Kimia', ['Kelas OOO', 'Kelas PPP']),
    ],
  ),
];

  static List<Dosen> get dosenList => _dosenList;
}

