import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditTask extends StatefulWidget {
  EditTask({this.title, this.duedate, this.description, this.index});
 
  final String title;
  final String description;
  final DateTime duedate;
  final index;
  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  TextEditingController controllerTitle;
  TextEditingController controllerDescription;
  TextEditingController controllerDuedate;

 DateTime _dueDate;
 String _dateText = "";

  String newTask;
  String description;

  void _editTask() {
    Firestore.instance.runTransaction((Transaction transaction) async {
      DocumentSnapshot snapshot = 
      await transaction.get(widget.index);
      await transaction.update(snapshot.reference,
          {"title": newTask, "note": description, "duedate": _dueDate});
    });
    Navigator.pop(context);
  }

  Future<Null> _selectDueDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _dueDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2120));
    if (picked != null) {
      setState(() {
        _dueDate = picked;
        _dateText = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }


  @override
  void initState() {
    super.initState();
    _dueDate = widget.duedate;
    _dateText = "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";

    newTask = widget.title;
    description = widget.description;

    controllerTitle = new TextEditingController(text: widget.title);
    controllerDescription = new TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: AssetImage("Assets/purpbg.jpg"), fit: BoxFit.cover),
                //   color: Colors.deepPurple[50]),
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(40),bottomRight: Radius.circular(40)),
              gradient: LinearGradient(
                    colors: [ Colors.orange,Colors.red]),
              boxShadow: [new BoxShadow(color: Colors.purple, blurRadius: 10.0)],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Edit tasks",
                      style: GoogleFonts.lora(
                        color: Colors.white,
                        fontSize: 23,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.edit,
                    color: Colors.white,
                    size: 30.0,
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: controllerTitle,
              onChanged: (String str) {
                setState(() {
                  newTask = str;
                });
              },
              decoration: new InputDecoration(
                  icon: Icon(Icons.assignment),
                  hintText: "Add Task",
                  fillColor: Colors.amber[50],
                  filled:true,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color:Colors.grey)),
                  hintStyle: TextStyle(fontSize: 18,color: Colors.black),
                  ),
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(Icons.date_range,color:Colors.purple)
                ),
                //Expanded(
                     Text(
                  "Pick a date :   ",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              //  ),
                FlatButton(
                    color: Colors.amber[100],
                    onPressed: () => _selectDueDate(context),
                    child: Text(
                      _dateText,
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:22,right:22,top:12),
            child: TextField(
                minLines: 3,
                maxLines: 10,
                controller: controllerDescription,
                onChanged: (String str) {
                  setState(() {
                    description = str;
                  });
                },
                decoration: new InputDecoration(
                    icon: Icon(Icons.description),
                    hintText: "Notes",
                    fillColor: Colors.amber[50],
                    filled:true,
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color:Colors.grey)),
                    hintStyle: TextStyle(fontSize: 18,color: Colors.black), 
                     )
                    ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  
                  ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                   children: <Widget>[
                    
                  Padding(
                    padding: const EdgeInsets.only(right:27.0),
                    child: Container(
                      height:MediaQuery.of(context).size.height*0.06,
                      width:MediaQuery.of(context).size.width*0.20,
                      child: RaisedButton(
                        elevation: 10,
                        color:Colors.amber,
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                        child:Text("SAVE",style:GoogleFonts.lato(fontSize: 15,color:Colors.white,fontWeight: FontWeight.bold)),
                        onPressed: (){
                          _editTask();
                        },
                      ),
                    ),
                  ),
                   
                  Padding(
                    padding: const EdgeInsets.only(left:27.0),
                    child: Container(
                      height:MediaQuery.of(context).size.height*0.06,
                      width: MediaQuery.of(context).size.width*0.20,
                      child: RaisedButton(
                        elevation: 10,
                        color:Colors.grey,
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                        child: Text("CANCEL",style:GoogleFonts.lato(fontSize: 15,color:Colors.white,fontWeight: FontWeight.bold)),
                        onPressed:(){
                           Navigator.pop(context);
                        } ,),
                    ),
                  )
                   ],
                  ),
               ]),
          )
          
        ],
      ),
    );
  }
}