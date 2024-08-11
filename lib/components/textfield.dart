import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    super.key, 
    required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    super.key, 
    required this.hintText, 
    required this.icon, 
    required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color.fromARGB(255, 125, 9, 1)),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    super.key,
    required this.onChanged,
  });
 
  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: 'Password',
          icon: Icon(Icons.lock, color: Color.fromARGB(255, 125, 9, 1)),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Color.fromARGB(255, 125, 9, 1),
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedDropdownField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String?> onChanged;
  final List<String> items;

  const RoundedDropdownField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color.fromARGB(255, 125, 9, 1),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        isExpanded: true, // Expands the dropdown to fill the available width
        // Optional: You can set an initial value if needed
        // value: value,
      ),
    );
  }
}



class RoundedDropdownField2 extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String?> onChanged;
  final List<String> items;
  final bool isEnabled; // tambahkan properti ini

  const RoundedDropdownField2({
    super.key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.items,
    this.isEnabled = true, String? value, // default value
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: IgnorePointer(
        ignoring: !isEnabled, // jika isEnabled adalah false, maka IgnorePointer akan meng-ignore pointer
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Color.fromARGB(255, 125, 9, 1),
            ),
            hintText: hintText,
            border: InputBorder.none,
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}