import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatefulWidget {
  AddTask({this.email});
  final String email;

  @override
  _AddTaskState createState() => _AddTaskState();
}
//  enum Error{
//   newTask
// }

class _AddTaskState extends State<AddTask> {
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
  // AndroidInitializationSettings androidInitializationSettings;
  // IOSInitializationSettings iosInitializationSettings;
  // InitializationSettings initializationSettings;

//  void initializing() async{
//    androidInitializationSettings = AndroidInitializationSettings("app_icon");
//   iosInitializationSettings = IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotfication);
//   initializationSettings =InitializationSettings(androidInitializationSettings,iosInitializationSettings);
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification:onSelectNotification);

//  }

//  void showNotifications() async{
//    await  notifications();
//  }

//  Future<void> notifications() async{
//   // var timeDelay= DateTime.now().add(Duration(minutes: 2));

//   var time =new Time(12,0,0);
//    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//      'Channel ID',
//      'Channel title',
//      'channel body',
//      priority: Priority.High,
//      importance: Importance.Max,
//      ticker:'test');
//      IOSNotificationDetails iosNotificationDetails =IOSNotificationDetails();
//      NotificationDetails notificationDetails =NotificationDetails(androidNotificationDetails,iosNotificationDetails);
//      await flutterLocalNotificationsPlugin.showDailyAtTime(
//        0,"My tasks",
//        "Hey there! Check out your unfinished tasks",
//        time,notificationDetails);
//   }

//   Future onSelectNotification(String payload){
//     if(payload!=null){
//       print(payload);
//     }
//   }
//   Future onDidReceiveLocalNotfication(
//     int id,String title,String body,String payload) async{
//       return CupertinoAlertDialog(
//         title:Text(title),
//         content:Text(body),
//         actions: <Widget>[
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             onPressed: (){
//               print("");
//             },
//             child: Text("Okay")),
//         ],
//       );
//     }

  DateTime _dueDate = new DateTime.now();
  String _dateText = '';
  String newTask = '';
  String description = ' ';
  String priority = '';

  Future<Null> _selectDueDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _dueDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2120));
    if (picked != null) {
      setState(() {
        _dueDate = picked;
        _dateText = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _addData() {
    Firestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference =
          Firestore.instance.collection('todos'); //document name
      await reference.add({
        "email": widget.email,
        "title": newTask,
        "duedate": _dueDate,
        "note": description,
        "priority": priority,
      });
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    //  initializing();
    _dateText = "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
  }

  bool _enabled = false;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    void toggleSwitch(bool value) {
      if (isSwitched == false) {
        setState(() {
          isSwitched = true;
          priority = "important";
        });
      } else {
        setState(() {
          isSwitched = false;
          priority = null;
        });
      }
    }

    return Material(
        child: Column(
      children: <Widget>[
        Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("Assets/purpbg.jpg"),fit:BoxFit.cover ) ,
            //   color:Colors.purple,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
            boxShadow: [new BoxShadow(color: Colors.purple, blurRadius: 10.0)],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //           Text("My tasks",
                //           style:GoogleFonts.lora(
                //  color:Colors.white, fontSize:28, letterSpacing:2.0,fontStyle: FontStyle.italic),
                //    ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Add tasks",
                      style: GoogleFonts.lora(
                          color: Colors.white,
                          fontSize: 23,
                          fontStyle: FontStyle.italic)),
                ),
                // Icon(FontAwesomeIcons.envelopeOpenText,color: Colors.white,size: 30),
                ClipOval(
                    child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Icon-notepad.svg/1200px-Icon-notepad.svg.png",
                        height: 36,
                        width: 36))
              ]),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              // validator: (value)=> value.length==0 ? "Provide a title":null,
              //onSaved: (value) => newTask=value,
              onChanged: (String str) {
                setState(() {
                  newTask = str;
                  _enabled = true;
                });
              },
              decoration: new InputDecoration(
                icon: Icon(FontAwesomeIcons.listAlt),
                labelText: "Task title",
                // fillColor: Color(0xFFDBEDFF),
                fillColor: Colors.amber[50],
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey)),
                hintStyle: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: new Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(FontAwesomeIcons.calendar),
            ),
            Text(
              "Pick date:   ",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            new RaisedButton(
                color: Colors.amber[100],
                onPressed: () => _selectDueDate(context),
                child: Text(
                  _dateText,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                )),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: TextField(
            minLines: 3,
            maxLines: 10,
            onChanged: (String str) {
              setState(() {
                description = str;
              });
            },
            decoration: new InputDecoration(
              //fillColor: Color(0xFFDBEDFF),
              fillColor: Colors.amber[50],
              icon: Icon(FontAwesomeIcons.stickyNote),
              filled: true,
              labelText: "Notes",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey)),
            ),
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // CupertinoButton(
              //   child: Text("sar"),
              //   onPressed: (){

              //   }),
              // IconButton(icon:Icon(Icons.star_border),onPressed:(){ }),
              Switch(
                value: isSwitched,
                //       //   onChanged: (value) {
                //       //  setState(() {
                //       //           isSwitched = value;
                //       //           print(isSwitched);
                //       //            });
                //           //  },
                onChanged: toggleSwitch,
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
              ButtonBar(
                // alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 27.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: RaisedButton(
                        color: Colors.orange,
                        hoverColor: Colors.white,
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "SAVE",
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        disabledColor: Colors.grey,
                        onPressed: () {
                          if (_enabled == true) {
                            _addData();
                          } else {
                            //    showDialog(context: context,child: AlertDialog(
                            //         backgroundColor: Colors.lightBlue[100],
                            //          content: Container(
                            //         decoration: BoxDecoration(
                            //          borderRadius: BorderRadius.circular(10),
                            //         border:Border.all(color:Colors.blue,width:2),
                            //         ),
                            //         height: 80,
                            //         child: Column(
                            //         children: <Widget>[
                            //            Padding(
                            //              padding: const EdgeInsets.symmetric(horizontal: 15,vertical:20),
                            //              child: Text("Provide title for your task!",style: GoogleFonts.paprika(fontWeight: FontWeight.w400),
                            //            )
                            //            )
                            //       ],
                            //      )
                            //    )
                            //    )
                            //  );
                            showDialog(
                              child: CupertinoAlertDialog(
                                title: Text(
                                    "Please provide a title for your task"),
                                actions: <Widget>[
                                  CupertinoButton(
                                    child: Text("OK",
                                        style: TextStyle(color: Colors.blue)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                              context: context,
                            );
                            // showDialog(context: context, child: alertDialog);
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 9,
                        color: Colors.grey,
                        child: Text("CANCEL",
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
