import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibaperr/components/button.dart';
import 'package:sibaperr/components/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _selectedRole;
  String _username = '';
  String _password = '';

  final Map<String, Map<String, String>> _credentials = {
    'Admin': {'username': 'admin', 'password': '123'},
    'Kaprodi': {'username': 'kaprodi', 'password': '123'},
    'Dosen': {'username': 'dosen', 'password': '123'},
    'Mahasiswa': {'username': 'mahasiswa', 'password': '123'},
  };

  void _login() {
    if (_selectedRole == null) {
      _showErrorMessage('Pilih Role terlebih dahulu');
      return;
    }

    final roleCredentials = _credentials[_selectedRole!];
    if (roleCredentials == null) {
      _showErrorMessage('Role tidak valid');
      return;
    }

    if (_username == roleCredentials['username'] && _password == roleCredentials['password']) {
      switch (_selectedRole) {
        case 'Admin':
          Navigator.pushNamed(context, '/dosenlistreadpage');
          break;
        case 'Kaprodi':
          Navigator.pushNamed(context, '/dosenlistreadpage');
          break;
        case 'Dosen':
          Navigator.pushNamed(context, '/dosenlistpage');
          break;
        case 'Mahasiswa':
          Navigator.pushNamed(context, '/Mhsdosenlistreadpage');
          break;
      }
    } else {
      _showErrorMessage('Username atau password salah');
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 9, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Silahkan Login",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 30),
              
              Image.asset(
                'lib/images/reading.png',
                height: size.height * 0.3,
              ),
              
              const SizedBox(height: 30),
              
              RoundedInputField(
                hintText: 'ID',
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
                icon: Icons.person,
              ),
              
              RoundedPasswordField(
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              
              RoundedDropdownField(
                hintText: 'Pilih Role',
                icon: Icons.stars_outlined,
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value;
                  });
                },
                items: const ['Admin', 'Kaprodi', 'Dosen', 'Mahasiswa'],
              ),
              
              const SizedBox(height: 30),
              
              SizedBox(
                width: size.width * 0.8,
                child: MyButton(
                  text: 'Login',
                  onTap: _login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}