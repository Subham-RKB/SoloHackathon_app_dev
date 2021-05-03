import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _name, _email, _password, _url, _phonenumber;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildName() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Company Name'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name can\'t be empty';
          }
          return null;
        },
        onSaved: (String value) {
          _name = value;
        });
  }

  Widget _buildEmail() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Company Email'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email can\'t be empty';
          }
          if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }
          return null;
        },
        onSaved: (String value) {
          _email = value;
        });
  }

  Widget _buildPassword() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        keyboardType: TextInputType.visiblePassword,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password can\'t be empty';
          }
          return null;
        },
        onSaved: (String value) {
          _password = value;
        });
  }

  Widget _buildUrl() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'URL'),
        keyboardType: TextInputType.url,
        validator: (String value) {
          if (value.isEmpty) {
            return 'URL can\'t be empty';
          }
          return null;
        },
        onSaved: (String value) {
          _url = value;
        });
  }

  Widget _buildPhonenumber() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Phone Number'),
        keyboardType: TextInputType.phone,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Ph.No can\'t be empty';
          }
          return null;
        },
        onSaved: (String value) {
          _phonenumber = value;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FORM')),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildEmail(),
              _buildPassword(),
              _buildUrl(),
              _buildPhonenumber(),
              SizedBox(height: 100),
              ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
