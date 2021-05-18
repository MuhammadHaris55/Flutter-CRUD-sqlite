import 'package:flutter/material.dart';
import 'package:flutter_crud_sqlite/main.dart';
import 'package:flutter_crud_sqlite/models/contact.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Contact _contact = Contact();
  List<Contact> _contacts = [];

  final _formKey = GlobalKey<FormState>();

  _form() => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),

//FOR VALIDATION ------------- STARTS -----------------------
                validator: (val) =>
                    (val.length == 0 ? 'This field is mandatory' : null),
                onSaved: (val) => setState(() => _contact.name = val),
//FOR VALIDATION ------------- ENDS -----------------------
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile'),
//FOR VALIDATION ------------- STARTS -----------------------
//                 controller: _ctrlMobile,
                validator: (val) =>
                    val.length < 10 ? '10 characters required' : null,
                onSaved: (val) => setState(() => _contact.mobile = val),
//FOR VALIDATION ------------- ENDS -----------------------
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () => _onSubmit(),
                  child: Text('Submit'),
                  color: darkBlueColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            // widget.title,
            'Home',
            style: TextStyle(color: darkBlueColor),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_form(), _list()],
        ),
      ),
    );
  }

  // _form() => Text('form goes here');

  // _list() => Text('list of contacts goes here');

//DEFINITION OF ON SUBMIT FUNCTION ------------------------- STARTS ---------------
  _onSubmit() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print('''
    Full Name : ${_contact.name}
    Mobile : ${_contact.mobile}
    ''');
      _contacts
          .add(Contact(id: null, name: _contact.name, mobile: _contact.mobile));
      form.reset();
    }
  }
//DEFINITION OF ON SUBMIT FUNCTION --------------- ENDS ------------------

//DEFINITION OF LIST FUNCTION ----------------- STARTS ----------------
  _list() => Expanded(
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Scrollbar(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: darkBlueColor,
                        size: 40.0,
                      ),
                      title: Text(
                        _contacts[index].name.toUpperCase(),
                        style: TextStyle(
                            color: darkBlueColor, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_contacts[index].mobile),
                      onTap: () {},
                    ),
                    Divider(
                      height: 5.0,
                    ),
                  ],
                );
              },
              itemCount: _contacts.length,
            ),
          ),
        ),
      );
//DEFINITION OF LIST FUNCTION ----------------- ENDS ----------------
}
