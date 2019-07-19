import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  const FormDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.black),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[RegisterFrom()],
            ),
          )),
    );
  }
}

class RegisterFrom extends StatefulWidget {
  _RegisterFromState createState() => _RegisterFromState();
}

class _RegisterFromState extends State<RegisterFrom> {
  final registerFromKey = GlobalKey<FormState>();

  String username, password;
  bool autovalidate = false;

  void _submitRegisterFrom() {
    if (registerFromKey.currentState.validate()) {
      registerFromKey.currentState.save();
      debugPrint('username:$username password:$password');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('正在注册...',style:TextStyle(fontSize: 20.0)),
      ));
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validatorUserName(value) {
    if (value.isEmpty) {
      return 'user name is required';
    }
    return null;
  }

  String validatorPassword(value) {
    if (value.isEmpty) {
      return 'password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFromKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'UserName', helperText: ''),
            onSaved: (value) {
              username = value;
            },
            validator: validatorUserName,
            autovalidate: autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password', helperText: ''),
            onSaved: (value) {
              password = value;
            },
            validator: validatorPassword,
            autovalidate: autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              elevation: 0.0,
              onPressed: _submitRegisterFrom,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('input ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // onChanged: (value){
      //   debugPrint('input: $value');
      // },
      onSubmitted: (value) {
        debugPrint('submie $value');
      },
      decoration: InputDecoration(
          icon: Icon(Icons.subject),
          labelText: 'Title',
          hintText: '输入标题',
          // border:InputBorder.none,
          // border:OutlineInputBorder()
          filled: true),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Theme.of(context).accentColor);
  }
}
