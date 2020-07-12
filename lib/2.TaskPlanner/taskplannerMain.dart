// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// //import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:navbar_drawer/2.TaskPlanner/features/MyTasks.dart';
// import 'package:flutter/services.dart';
// import 'package:navbar_drawer/2.TaskPlanner/Sliders/slideItem.dart';
// import 'package:navbar_drawer/2.TaskPlanner/Sliders/slide.dart';
// import 'dart:async';

// import 'package:navbar_drawer/2.TaskPlanner/Sliders/sliders.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//         DeviceOrientation.portraitUp,
//       ]);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: new ToDo(),
//     );
//   }
// }

// class ToDo extends StatefulWidget {
//   @override
//   _ToDoState createState() => new _ToDoState();
// }


// class _ToDoState extends State<ToDo> {

  

//   @override
//   void initState(){
//     super.initState();
//     Timer.periodic(Duration(seconds:5), (Timer timer) {
//        if(_currentslide<2){
//          _currentslide++;
//        }else{
//          _currentslide=0;
//        }
//        pageController.animateToPage(_currentslide, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
//      });
//   }

//   _onPageChanged(int i){
//     setState(() {
//       _currentslide=i;
//     });
//   }

//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = new GoogleSignIn();

//   Future<FirebaseUser> _signIn() async {
//     GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//     GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;

//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );
//     final FirebaseUser user =
//         (await firebaseAuth.signInWithCredential(credential)).user;
//     // return user;

//     Navigator.of(context).push(new MaterialPageRoute(
//         builder: (BuildContext context) =>
//             new MyTask(user: user, googleSignIn: googleSignIn)));
//   }
//   int _currentslide=0;
//   final PageController pageController =PageController(
//     initialPage: 0
//   );
  
 
//   @override
//   void dispose() {
    
//     super.dispose();
//     pageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      body:Container(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//          Expanded(
//              child: Stack(
//                alignment: AlignmentDirectional.bottomCenter,
//                children:<Widget>[ PageView.builder(
//                 scrollDirection: Axis.horizontal,
//                 controller: pageController,
//                 onPageChanged: _onPageChanged,
//                 itemCount: slideList.length,             
//                  itemBuilder:(context,index)  =>SlideItem(index),
//                ),
//                Stack(
//                  alignment: AlignmentDirectional.topStart,
//                  children: <Widget>[
//                    Container(
//                      margin: const EdgeInsets.only(bottom: 35),
//                      child: Row(
//                        mainAxisSize: MainAxisSize.min,
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          for(int i=0;i<slideList.length;i++)
//                               if(i == _currentslide)
//                                 SlideDots(isActive: true)
//                               else
//                                 SlideDots(isActive: false)
                             
//                        ],),
//                    ),
//                  ],)
//                ]
//              )
//          ),
//          Padding(
//            padding: const EdgeInsets.only(bottom:30.0),
//            child: Column(
//              children: <Widget>[
//             //SizedBox(height:MediaQuery.of(context).size.height*0.1),
//              Center(
//                child: Padding(
//                  padding: const EdgeInsets.only(left:60.0,right:60,bottom:60),
                
//                    child: OutlineButton(
//                      borderSide: BorderSide(width: 1),
//                      color:Colors.black,
//                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                        //  Icon(FontAwesomeIcons.google),
                         
//                             Image(image: NetworkImage("https://cdn4.iconfinder.com/data/icons/bettericons/354/google-2-color-512.png",),
//                            fit:BoxFit.cover,
//                            width: MediaQuery.of(context).size.width*0.1,
//                            height: MediaQuery.of(context).size.height*0.06
//                        ),
                         
//                          Padding(
//                            padding: const EdgeInsets.only(left:10.0,right:20,top:0.2),
//                           child: Text("Sign in with Google",style:GoogleFonts.archivo(fontSize: 19,fontWeight:FontWeight.bold),),
//                         ),
//                        ],
//                      ),
//                      onPressed: (){
//                        try{
//                          _signIn();

//                        } catch(e){
//                        print(e.message);
//                        }
//                      },),
//                  ),
//                ),
             
//            ],),
//          )
//        ],),
//      ) 
     
//     );
//   }
// }

// //diamond shaped add icon bottom centre:

 
