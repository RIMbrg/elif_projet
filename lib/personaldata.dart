import 'package:flutter/material.dart';
import 'package:projet_testt/constants2.dart';
import 'package:projet_testt/insert_button.dart';

class EditProfilPage extends StatefulWidget {
  @override
  _EditProfilPageState createState() => _EditProfilPageState();
}

class _EditProfilPageState extends State<EditProfilPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isMaleSelected = false;
  bool _isFemaleSelected = false;

  String? _nom;
  DateTime? _dateNaissance;
  String? _metier;
  double? _revenuMensuel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          tEditProfile,
          style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(tProfileImage),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Add image selection functionality here
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField(
                      label: 'Name',
                      onSaved: (value) => _nom = value,
                      validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (picked != null && picked != _dateNaissance) {
                          setState(() {
                            _dateNaissance = picked;
                          });
                        }
                      },
                      child: AbsorbPointer(
                        child: _buildTextField(
                          label: 'Date of Birth',
                          hint: _dateNaissance == null
                              ? 'Select a date'
                              : '${_dateNaissance!.day}/${_dateNaissance!.month}/${_dateNaissance!.year}',
                          validator: (value) => _dateNaissance == null ? 'Please select a date' : null,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      label: 'Job',
                      onSaved: (value) => _metier = value,
                      validator: (value) => value!.isEmpty ? 'Please enter your job' : null,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      label: 'Monthly Income',
                      keyboardType: TextInputType.number,
                      onSaved: (value) => _revenuMensuel = double.tryParse(value ?? '0'),
                      validator: (value) => value == null || double.tryParse(value) == null ? 'Enter a valid income' : null,
                    ),
                    SizedBox(height: 20),
                    _buildGenderSelection(),
                    SizedBox(height: 20),
                    insertButton(label: 'Edit Profile'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, String? hint, TextInputType? keyboardType, FormFieldSetter<String>? onSaved, FormFieldValidator<String>? validator}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      keyboardType: keyboardType,
      onSaved: onSaved,
      validator: validator,
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildGenderOption(
              label: 'Male',
              isSelected: _isMaleSelected,
              color: Colors.blue,
              onSelected: () {
                setState(() {
                  _isMaleSelected = true;
                  _isFemaleSelected = false;
                });
              },
            ),
            _buildGenderOption(
              label: 'Female',
              isSelected: _isFemaleSelected,
              color: Colors.pink,
              onSelected: () {
                setState(() {
                  _isMaleSelected = false;
                  _isFemaleSelected = true;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderOption({required String label, required bool isSelected, required Color color, required VoidCallback onSelected}) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.2) : Colors.grey[200],
          border: Border.all(color: isSelected ? color : Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (_) => onSelected(),
              activeColor: color,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? color : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
