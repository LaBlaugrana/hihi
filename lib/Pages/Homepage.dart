

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hush/Components/carousel_card.dart';



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
        padding: const EdgeInsets.symmetric(horizontal: 8),
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

Carousel(),
            Padding(
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
