// Define a custom Form widget.
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MyTextFormField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}
class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  bool isSwitched = false;
  bool checkboxValue = false;
  String selectedGender;
  DateTime selectedDate = DateTime.now();

  Future<Null> _pickDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(context: context,
        initialDate: selectedDate, firstDate:DateTime(1900, 1), lastDate: DateTime(3000, 1));
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    void checkboxValueChanged(bool value) => setState(() => checkboxValue = value);
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Form(
        key: _formKey,
        child: Column(
            children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Let's fill in the form",
                style: TextStyle(
                  fontSize: 24,
                ),
              )
            ),
              Container(
                alignment: Alignment.topCenter,
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWidth,
                      child: Text(
                        'Change background',
                        style: TextStyle(
                          fontSize: 16
                        ),
                      )

                    ),
                   Container(
                     alignment: Alignment.topCenter,
                     width: halfMediaWidth,
                     child: Switch(
                       value: isSwitched,
                       onChanged: (value){
                         setState(() {
                           isSwitched = value;
                           print(isSwitched);
                         });
                       },
                       activeTrackColor: Colors.white70,
                       activeColor: Colors.blueAccent,
                     ),
                   )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Row(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.topCenter,
                        width: halfMediaWidth,
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 16
                          ),

                        )
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: halfMediaWidth,
                      child: MyTextFormField()
                    )
                  ],
                )
              ),
              Container(
                alignment: Alignment.topCenter,
                child:Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWidth,
                      child: Text(
                        'Birthday',
                        style: TextStyle(
                          fontSize: 16.0
                        )
                      )
                    ),
                    Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(
                        fontSize: 16.0
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.calendarAlt,
                        size: 25.0
                      ),
                      onPressed: () => _pickDate(context),
//                      child: Text('Select')
                    )
                  ],
                )
              ),
              Container(
                alignment: Alignment.topCenter,
                child:Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      width: halfMediaWidth,
                      child: Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                        hint: Text('Select gender'),
                        value: selectedGender,
                        onChanged: (String value){
                          setState(() {
                            selectedGender = value;
                          });
                        },
                        items: ['Female', 'Male'].map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: new Text(gender),
                          );
                        }).toList()
                    )
                  ],
                )
              ),
              Container(
                alignment: Alignment.topCenter,
                child:Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      width: halfMediaWidth,
                      child: Text(
                        'Accept usage terms',
                        style: TextStyle(
                          fontSize: 16
                      ),
                    )
                    ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: Checkbox(value: checkboxValue, onChanged: checkboxValueChanged)
                    )
                  ]
              )
              ),
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.all(20.0),
              child: RaisedButton(
                onPressed: () {},
                textColor: Colors.black,
                child: const Text(
                  'Join now',
                  style: TextStyle(fontSize: 20)
                )
              )
            )]
        )
    );
  }
}

