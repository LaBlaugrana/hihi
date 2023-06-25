

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class  Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }
  final user=FirebaseAuth.instance.currentUser!;

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar:
    Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(11),color: Color(0xFFF4F8FF)) ,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GNav(activeColor:Color(0xFF233C67),tabBackgroundColor: Color(0xFF99AFD7),tabs: [
          GButton(icon: Icons.home),
          GButton(icon: Icons.app_registration),
         GButton(icon:Icons.book,),
          GButton(icon: Icons.account_box)
        ],

        ),
      ),
    ),
      body: SafeArea(
        child: ListView(

          children: [
            Row(children: [IconButton(onPressed: (){signUserOut();}, icon:Icon(Icons.logout))],),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text('Hi ${user.email}', style: TextStyle(fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),)
              ,
            ),
            Text('Better your sleep with Hush!', style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 12),),

  Padding(
    padding: const EdgeInsets.only(top:30),
    child: Center(
      child: Container(height: 200,width: 430,decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color:Color(0xFF253F6D)
      ),
        child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
          Container(width:200,height: 200,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color:Color(0xFF253F6D)

          ),child: Column(children: [
            Text('Article',style: TextStyle(color: Colors.white,fontFamily: 'Poppins'),),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text('   A good nights sleep is like a reset    button for the mind and body',style: TextStyle(fontFamily: 'Poppins',fontWeight:FontWeight.bold,color: Colors.white,fontSize: 10),),
            ),
          Padding(
            padding: const EdgeInsets.only(top:80),
            child: ElevatedButton(onPressed: (){}, child: Text('Read more'),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF99AFD8)))),
          )],
            ),),
          Container(width: 180,height: 200,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color:Color(0xFF253F6D)
          ),
            child: ClipRRect(borderRadius: BorderRadius.circular(11),
              clipBehavior: Clip.antiAlias,child: Image(image: AssetImage('assets/images/sleep1.png'),fit: BoxFit.cover,),)
          )
        ],),
      ),
    ),
  )
            ,Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('Improve your sleep using',style: TextStyle(fontFamily: 'Poppins-med',fontWeight: FontWeight.bold),),

            )
            ,
            Padding(
              padding: const EdgeInsets.only(top:15),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [

                  InkWell(
                    onTap:(){},
                    child: SizedBox(child:Container(height:152 ,width: 152,decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(11)
                    ),
                      child: ClipRRect(borderRadius:BorderRadius.circular(11),child: Image(image: AssetImage('assets/images/sleep journal.png'),)),
                    ) ,),
                  ),
                  InkWell(
                    onTap: (){},
                    child: SizedBox(child:Container(height:152 ,width: 152,decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(11)
                    ),
                      child: ClipRRect(borderRadius:BorderRadius.circular(11),child: Image(image: AssetImage('assets/images/sleeptrack.png'),)),
                    ) ,),
                  )

                ],),
              ),
            ),
Padding(
  padding: const EdgeInsets.only(top: 20),
  child:   Container(child:Image(image: AssetImage('assets/images/enjoy2.png')),),
),
            Text('Try our Relaxers',style: TextStyle(fontFamily: 'Poppins-med',fontWeight: FontWeight.bold),),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width:100 ,height:100 ,child:
                  Container(height:100,width: 100,decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(11)
                  ),child:Image(image: AssetImage('assets/images/tictactoe.gif')),),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: SizedBox(width:100 ,height:100 ,child:
                  Container(height:100,width: 100,decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(11)
                  ),child:Image(image: AssetImage('assets/images/tictactoe.gif')),),

                  ),
                ),Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: SizedBox(width:100 ,height:100 ,child:
                  Container(height:100,width: 100,decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(11)
                  ),child:Image(image: AssetImage('assets/images/tictactoe.gif')),),

                  ),
                ), ],
            )
        ]
        ),
      ),
    );
  }

}
