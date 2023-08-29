import 'package:flutter/material.dart';

class showDetailsPage extends StatefulWidget {
  final  String ?contacDetails;
  const showDetailsPage({super.key, this.contacDetails });

  @override
  State<showDetailsPage> createState() => _showDetailsPageState();
}

class _showDetailsPageState extends State<showDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(children: [
SizedBox(height: 30,),

        Row(
          children: [
            SizedBox(width: 10,),

            IconButton(onPressed: (){

Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,
            color: Colors.black,
            ),
            
            ),
          SizedBox(width:5,),
            Text('Details',
      style: TextStyle(color: Colors.black,
      fontSize: 20
      ),
      ),
         
          ],
        ),
   
      Divider(thickness: 1,
      color: Colors.grey.shade200, 
      ),

      SizedBox(height: 60,),

      CircleAvatar(
       radius: 60,
        backgroundColor: Colors.grey.shade200,
      child: Icon(Icons.person,
      color: Colors.grey,
    size: 50,
      ),
      ),
      //phone  number of user


      //Action button 
     SizedBox(height: 40,),
      Row(children: [
SizedBox(width: 50,),
Column(
  children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blue,
        child: Icon(Icons.message,
        color: Colors.white,
        ),
        ),
  Text('Messages',
  style: TextStyle(color: Colors.grey),
  )
  ],
),
SizedBox(width: 40,),
Column(
  children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.green.shade300,
        child: Icon(Icons.call,
        color: Colors.white,
        ),
    
    //
    
    
    
    ),
  Text('Messages',
  style: TextStyle(color: Colors.grey),
  )
  ],
),


SizedBox(width: 40,),


Column(
  children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.green.shade300,
        child: Icon(Icons.video_call,
        color: Colors.white,
        ),
       
    ),
  Text('Video call',
  style: TextStyle(color: Colors.grey),
  )
  ],
),







      ],),

SizedBox(height: 20,) ,     
     //PHONE NUMBER
      Text(''),

      SizedBox(height: 30,),

Divider(thickness: 1,
color: Colors.grey.shade200,
),
      SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.only(right:230),
        child: Text('New contact',
        style: TextStyle(color: Colors.black,
        fontSize: 18,
        ),
        ),
      ),
       SizedBox(height: 50,),
      Padding(
        padding: const EdgeInsets.only(right: 150),
        child: Text('Add to exisitng contact',
        style: TextStyle(color: Colors.black,
        fontSize: 18,
        ),
        ),
      ),
      SizedBox(height: 50,),
      Padding(
        padding: const EdgeInsets.only(right: 200),
        child: Text('Add to  blocklist',
        style: TextStyle(color: Colors.black,
        fontSize: 18,
        ),
        ),
      ),
      SizedBox(height: 50,),
      Padding(
        padding: const EdgeInsets.only(right:230),
        child: Text('Flag Number',
        style: TextStyle(color: Colors.black,
        fontSize: 18,
        ),
        ),
      ),
     
      ]),
 
 
    );
  }
}