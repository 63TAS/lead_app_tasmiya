import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_lead_project/ContaCtList/CreateContact.dart';
import 'package:flutter_lead_project/api/ApiFile.dart';


class contactPage extends StatefulWidget {
  const contactPage({super.key});

  @override
  State<contactPage> createState() => _contactPageState();
}

class _contactPageState extends State<contactPage> {
 
TextEditingController searchcontroller = TextEditingController();
String searchValue ='';

 String id = '1';
 //for initilalizing metods
@override
void initState(){
 getFilterData();
  super.initState();
}

 //method of bottomdsheet for filter
 void _showFiltersBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        // Bottom sheet content goes here
        height: 300,
        width:390,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Option 1'),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Option 2'),
                onTap: () {
                  // Handle option 2 tap
                  Navigator.pop(context);
                },
              ),
              // Add more options or content here
            ],
          ),
        ),
      );
    },
  );
}

//methpd of bottomsheet for sorting
void _showsortingbottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        // Bottom sheet content goes here
        height: 300,
        width:390,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Option 1'),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Option 2'),
                onTap: () {
                  // Handle option 2 tap
                  Navigator.pop(context);
                },
              ),
              // Add more options or content here
            ],
          ),
        ),
      );
    },
  );
}

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: SingleChildScrollView(
  child:   Column(children: [
     Container(
 height: 100,
 width: 396,

  decoration: BoxDecoration(gradient: LinearGradient(colors: [

    Colors.purple,
    Colors.purple,
    Colors.orange,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
    )),
  child: Row(children: [
IconButton(
  onPressed: (){
Navigator.push(context, MaterialPageRoute(
  builder:(context) => contactPage(),));
}, icon: Icon(Icons.arrow_back,
color: Colors.white,
)),
SizedBox(width:90,),
Text(' Contact List',
style: TextStyle(color: Colors.white,
fontSize: 20,
),
),
SizedBox(width: 80,),

Icon(Icons.notifications,
color: Colors.white,
),
]),),
SizedBox(height: 40,),

Row(children: [
  SizedBox(width: 20,),

  Text('All contacts',
  style: TextStyle(fontWeight: FontWeight.bold,
  fontSize: 20,
  
  
  ),
  ),
SizedBox(width: 120,),
Text('Favorites',
style: TextStyle(fontWeight: FontWeight.bold,
fontSize: 20,
),
)

],),
SizedBox(height: 30,),
Row(
  children: [
       
       SizedBox(width: 30,),
        InkWell(
          onTap: (){
_showFiltersBottomSheet(context);
          },
          child: Container(
            
             height: 40,
            
             width: 120,
          
              decoration: BoxDecoration(
            
          borderRadius: BorderRadius.circular(30),
            
              border: Border.all()
            
              ),
            
              child: Row(
            
              
            
          children: [
            
            SizedBox(width: 20,),
            
            Align(
            
             alignment: Alignment.center,
            
              child:   Text('Filters',
            
              
            
              style: TextStyle(color: Colors.grey,
            
              
            
              fontSize: 15,
            
              
            
              ),
            
              
            
              ),
            
            ),
            
            Icon(Icons.filter_list_alt)
            
            ]),),
        ),
      SizedBox(width:90,),

   InkWell(
  onTap: (){
    _showsortingbottomSheet(context);
  },
   child:  Container(
      
       height: 40,
      
       width: 120,
      
        decoration: BoxDecoration(
      
          borderRadius: BorderRadius.circular(30),
      
        border: Border.all()
      
        ),
      
        child: Row(
      
        
      
          children: [
      
      SizedBox(width: 20,),
      
      Align(
      
       alignment: Alignment.center,
      
        child:   Text('Sorting',
      
        
      
        style: TextStyle(color: Colors.grey,
      
        
      
        fontSize: 15,
            ),
            ),
          ),
         Icon(Icons.sort)
      
      ]),),
   )
 
 
 
  ],
),
SizedBox(height: 30,),
Padding(
  padding: const EdgeInsets.only(left: 10,
  right: 10,
  
  ),
  child:   TextField(
  

  controller: searchcontroller,
  onChanged: (query){
    getsearchData(searchcontroller.text);
 print(query);
  setState(() {
    showcontactlist = searchData;
  });
  },
    
  
    decoration: InputDecoration(
  
  
  hintText: 'Search here....',
  prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
  
      borderRadius: BorderRadius.circular(40),
  
  
  
  )),),
),
Container(
  height: 1000,
  // MediaQuery.of(context).size.height,
  child:   FutureBuilder(
  
    future: getshowcontactListData(id),
  
    builder: (context, snapshot) {
  
  if(snapshot.connectionState == ConnectionState.waiting){
  
    return Text('Loading',
    style: TextStyle(color: Colors.purple,
    fontWeight: FontWeight.bold,
    ),
    );
  
  
  
  }else if(snapshot.hasError){
  
   
  
      return Text('Error found');
  
    }else if(snapshot.hasData){
              final  showContactlist= snapshot.data;
        final List<dynamic> contactsData = showContactlist!['data'];


if (contactsData.isEmpty) {
        return Center(child: Text('No contacts available.'));
      }
    //  final showcontactlist = showContactlist['data'];

      return ListView.builder(
  scrollDirection: Axis.vertical,
         itemCount: contactsData.length,
          itemBuilder: (context, index) {
  // final showcontactlist = showcontactlist[index];

        return 
        Column(children: [
  
          Row(children: [
      CircleAvatar(
  
       radius: 30,
  
      backgroundColor: Colors.grey,
  
      child: Icon(Icons.person,
  
      color: Colors.blue,
  
      ),),
  SizedBox(width: 30,),

Text('${contactsData[index]['first_name']}',
style: TextStyle(fontWeight: FontWeight.bold,
fontSize: 20,

),
),
// :Text('${searchData?[index]['data']}'),



// Text('${contactsData[index]['email']}'),

  Spacer(),

      Icon(Icons.more_vert,
      
      )
  
          ],),
  SizedBox(height:5,),
     
       Padding(
         padding: const EdgeInsets.only(right:150),
         child: Text('+91${contactsData[index]['phone']}'),
       ),
 Row(
   children: [
     SizedBox(width: 70,),


     Text('${contactsData[index]['email']}',
     style: TextStyle(fontSize:14),
     ),
  
      //  SizedBox(width: 30,),
Spacer(),
IconButton(onPressed: (){

}, icon: Icon(Icons.favorite,
color: Colors.grey,
))
   ],
 ),


SizedBox(height: 40,)
       
        ],)
  
        ;
  
      },);
  
    }else{
  
      return Text('sorry');
  
    }
  
  }
  
  
  
  ),
),
  ]),
),

floatingActionButton: FloatingActionButton(
  // backgroundColor: Colors.white,
  // clipBehavior: Clip.antiAlias,
  onPressed: (){
Navigator.push(context, MaterialPageRoute(builder:(context) => createcontactPage(),));
},
child: Container(
  height: 100,
  width: 200,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(19),
gradient: LinearGradient(colors: [
  Colors.purple,
  Colors.orange,
],
begin: Alignment.topLeft,
end: Alignment.bottomRight,
)
),
child: Align(
  alignment: Alignment.center,
  child: Text('+',
  style: TextStyle(color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  ),
  
  )),
),
)
    );
  
  }
}