import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:final_proj/2.TaskPlanner/features/AddTask.dart';
import 'package:final_proj/2.TaskPlanner/features/editData.dart';
import 'package:final_proj/MenuBar/pages/task-planner.dart';

class MyTask extends StatefulWidget {
  MyTask({this.user, this.googleSignIn});
  final FirebaseUser user;
  final GoogleSignIn googleSignIn;
  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  void _signOut() {
  // AlertDialog alertDialog = new AlertDialog(
  //     content: Container(
  //     height: 250,
  //     child: Column(
  //       children: <Widget>[
  //         ClipOval(
  //           child: new Image.network(widget.user.photoUrl),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Text(
  //             " Do you want to log out?",
  //             style: TextStyle(fontSize: 16),
  //           ),
           
  //         ),
  //         new Divider(),
  //         new Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: <Widget>[
  //             InkWell(
  //                 child: Column(
  //               children: <Widget>[
  //                 IconButton(
  //                     icon: Icon(Icons.check_circle),
  //                     padding: const EdgeInsets.all(16.0),
  //                     onPressed: () {
  //                       widget.googleSignIn.signOut();
  //                       Navigator.of(context).push(new MaterialPageRoute(
  //                           builder: (BuildContext context) => new ToDo()));
  //                     }),
  //                 Text("Exit"),
                
  //               ],
  //             )),
  //             InkWell(
  //                 child: Column(
  //               children: <Widget>[
  //                 IconButton(
  //                     icon: Icon(Icons.close),
  //                     padding: const EdgeInsets.all(16.0),
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     }),
  //                 Text("Cancel"),
  //               ],
  //             )),
  //           ],
  //         )
  //       ],
  //     ),
  //   ));
  //   showDialog(context: context, child: alertDialog);
  // }
    CupertinoAlertDialog dialog = CupertinoAlertDialog(
        title:Text("Are you sure you want to log out?"),
        actions: <Widget>[ 
              CupertinoButton(
                child:Text("Exit",style:TextStyle(fontWeight: FontWeight.w500)),
                onPressed: () {
                            widget.googleSignIn.signOut();
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) => new ToDo()));
                         }),
                          
          CupertinoButton(
            child: Text("cancel",style:TextStyle(fontWeight: FontWeight.w500)),
            onPressed: () {
                        Navigator.pop(context);
                      }),
            ],
      
    );
    showDialog(context: (context),child:dialog);
  }
   

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) =>
                    new AddTask(email: widget.user.email)));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.deepPurple[200],
           shape: _DiamondBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            elevation: 50.0,
            color: Colors.deepPurple,
            child: ButtonBar(
              children: <Widget>[],
            )),
        body: Stack(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top:160),
              child: StreamBuilder(
                stream: Firestore.instance.collection("todos").where("email",isEqualTo:widget.user.email).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData)
                    return new Container(child: Center(
                      child: CircularProgressIndicator(),
                      ));
                       return new TaskList(document: snapshot.data.documents,);
                },
               ),
            ),
             Container(
                height: 170,
                width: double.infinity,
               
                decoration: BoxDecoration(
                 // image: DecorationImage(
                   //   image: new AssetImage("Assets/purpbg.jpg"),
                     // fit: BoxFit.cover),
                     //color:Colors.deepOrange,

                     gradient: LinearGradient(
                    colors: [ Colors.red[800],Colors.redAccent[400],Colors.deepOrange[400]]),
                    boxShadow: [
                    new BoxShadow(color: Colors.indigo, blurRadius: 11.0)
                  ],
                  //color: Colors.purple,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        new NetworkImage(widget.user.photoUrl),
                                    fit: BoxFit.cover)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      "WELCOME,",
                                      style: GoogleFonts.lato(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    new Text(
                                      widget.user.displayName,
                                      style:GoogleFonts.lato(
                                          fontSize: 18, color: Colors.white,),
                                    )
                                  ]),
                            ),
                          ),
                        
                          // PopupMenuButton<Options>(
                          //   onSelected: (Options result){setState((){
                          //         _selection= result;
                          //     });
                          //   },
                          //   itemBuilder: (BuildContext context)=> <PopupMenuEntry<Options>>[
                          //   PopupMenuItem(child: Text("About"),
                          //   value:Options.About 
                          //   ),
                          //   PopupMenuItem(child: Text("Logout"),
                          //   value:Options.About 
                          //   ),
                          //   ])
                                                     new IconButton(
                                                       icon: Icon(Icons.exit_to_app,
                                                           color: Colors.white, size: 28.0),
                                                       onPressed: () {
                                                         _signOut();
                                                       },
                                                     )
                                                   ],
                                                 ),
                                               ),
                                               new Text("Your Tasks",
                                                   style: GoogleFonts.handlee(
                                                       color: Colors.white,
                                                       fontSize: 30,
                                                       letterSpacing: 2.0,
                                                      // fontFamily: "Montserrat",
                                                       fontWeight: FontWeight.w600))
                                             ],
                                           )),
                                       
                                     ],
                                   )
                                // )
                                   );
                             }
                           }

enum Options {About, Logout}
// enum MenuOption {About, Logout} 

// class PopupOptionMenu extends StatelessWidget{
//     const PopupOptionMenu({Key key}): super(key: key);

//     @override
//     Widget build(BuildContext context){
//       return  PopupMenuButton<MenuOption>(
//        itemBuilder: (BuildContext context){
//          return <PopupMenuEntry<MenuOption>>[
//               PopupMenuItem(child: Text("About"),
//               value: MenuOption.About,
//               ,
//               ),
//               PopupMenuItem(child: Text("Logout"),
//               value: MenuOption.Logout,
//               ),
              
//          ];
//        },
//       );
//     }
// }




class TaskList extends StatelessWidget {

  TaskList({this.document});
  final List<DocumentSnapshot> document;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:document.length,
      itemBuilder: (BuildContext context,int index){
        String title = document[index].data["title"].toString();
        String note = document[index].data["note"].toString();
        DateTime _date = document[index].data['duedate'].toDate();
        String priority=document[index].data['priority'].toString();
        String duedate='${_date.day}/${_date.month}/${_date.year}';

        return new Dismissible(
          background: Container(
            color:Colors.green,
            child:
              Icon(FontAwesomeIcons.checkCircle,),
            width:2,
          ),
         
           key: new Key(document[index].documentID),
           onDismissed: (direction){
             Firestore.instance.runTransaction((transaction) async{
                  DocumentSnapshot snapshot=  await transaction.get(document[index].reference);
                  await transaction.delete(snapshot.reference); 
             });

             Scaffold.of(context).showSnackBar(
               
               new SnackBar(
                 backgroundColor: Colors.greenAccent,
                 content:  new Text("Task Completed !"),)
             );
            
           },
        
           
            child: new Padding(
              padding: const EdgeInsets.only(left:16.0,top:9.0,bottom:6.0,right:16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                   child: Card(
                      // color:Colors.yellow[100],
                      
                       color: Colors.primaries[Random().nextInt(Colors.primaries.length)].shade200,
                        elevation: 10,
                        shadowColor: Colors.pink,
                       
                      child:  InkWell(
                         splashColor: Colors.red.withAlpha(30),
                        onTap: (){
                            print("tapped");
                        },
                        child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                             Container(                               
                               width:MediaQuery.of(context).size.width,
                              // color:Colors.brown[50],
                               child: Card(
                                 
                                   color:Colors.amber[100],
                                    child: Padding(
                                    padding: const EdgeInsets.only(bottom:9.0,top:5,left:6),
                                    child: Center(child: Text(title, style:GoogleFonts.neucha(fontSize: 20,letterSpacing: 1.0,fontWeight: FontWeight.w600 ))),
                                  ),
                                ),
                             ),
                            Padding(
                                padding: const EdgeInsets.only(left:330.0),
                                child: Card(
                                     
                                      child: priority=="important" ?
                                    FittedBox( 
                                      fit: BoxFit.contain,
                                      child: Icon(FontAwesomeIcons.bookmark,color: Colors.pinkAccent)):null,
                                       ),
                               ),
                            
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right:16.0,left:10),
                                  child: Icon(Icons.date_range,color: Colors.purple,),
                                ),
                                Text(duedate, style:GoogleFonts.neucha(fontSize: 17,fontWeight: FontWeight.w600),),
                              ],
                            ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right:16.0,top:10,left:10),
                                    child: Icon(Icons.event_note,color: Colors.purple,),
                                  ),
                                  Expanded(child: Padding(
                                    padding: const EdgeInsets.only(top:10.0,bottom:7),
                                    child: Text(note, style:GoogleFonts.neucha(fontSize: 17,fontWeight:FontWeight.w700)),
                                  )),
                               new IconButton(
                               color: Colors.amber,
                               icon: Icon(Icons.edit,color: Colors.deepOrange,), 
                                onPressed: (){
                                       Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> new EditTask(
                                            title: title,
                                            description:note,
                                            duedate: document[index].data['duedate'].toDate(),
                                            index: document[index].reference,
                                           )));
                                         })
                                        ],
                                     ), 
                                  ],
                         
                          ),
                        )
                      ),
                   
                    ),
                  )
                ],
              )
            ),
        );
      },
    );
  }
}



class _DiamondBorder extends ShapeBorder {
  const _DiamondBorder();

  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..moveTo(rect.left + rect.width / 2.0, rect.top)
      ..lineTo(rect.right, rect.top + rect.height / 2.0)
      ..lineTo(rect.left + rect.width / 2.0, rect.bottom)
      ..lineTo(rect.left, rect.top + rect.height / 2.0)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  // This border doesn't support scaling.
  @override
  ShapeBorder scale(double t) {
    return null;
  }
}