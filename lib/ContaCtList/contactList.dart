import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_lead_project/ContaCtList/CreateContact.dart';
import 'package:flutter_lead_project/ContaCtList/showDetai;lsPage.dart';
import 'package:flutter_lead_project/api/ApiFile.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/PROVIDER.dart';

class contactPage extends StatefulWidget {
  const contactPage({super.key});

@override
  State<contactPage> createState() => _contactPageState();
}

class _contactPageState extends State<contactPage> {

TextEditingController check_first_namecontroller = TextEditingController();
TextEditingController check_last_name_namecontroller  = TextEditingController();
TextEditingController check_assistantcontroller = TextEditingController();
TextEditingController check_secondary_emailcontroller =TextEditingController();
TextEditingController checktwittercontroller = TextEditingController();
TextEditingController  check_phone_numbercontroller= TextEditingController();
TextEditingController check_faxcontroller = TextEditingController();
TextEditingController check_skype_idcontroller = TextEditingController();

//for search
TextEditingController searchcontroller = TextEditingController();
//filtes variable s
bool isFiltersapllied = false;

//fort favorites button
bool isFavorites = true;


//for favorites page
bool isFvaoritesButton= false;

 String id = '1';
 //for initilalizing metods

//indexing of pafes
int _Currentindex=0;
@override
void initState(){
//  getFilterData();
 
  super.initState();
}

 //method of bottomdsheet for filter
 void _showFiltersBottomSheet(BuildContext context)async {
  
  // Future.delayed(Duration(seconds: 7),(){
  //   Navigator.pop(context);
  // });
 
//  List<dynamic> newFiltersData = await  getFilterData(
//   firstnaemecontroller.text,
   
//   lastnamecontroller.text,

//   check_assistantcontroller.text, 
//   check_secondary_emailcontroller.text, 
//     checktwittercontroller.text,
//   check_phone_numbercontroller.text, 
//   check_faxcontroller.text, 
//   check_skype_idcontroller.text,
//   );


// setState(() {
//   filterList  = newFiltersData;
// });
  showModalBottomSheet(
  

    context: context,
    builder: (BuildContext context) {
      return Container(
        // Bottom sheet content goes here
        height: 1250,
                width:390,
       
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Column(
                  children: [
           
           SizedBox(height:20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Filters',
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 25
              ),
              
              ),
            ),
            // Divider(thickness: 2,),
                               SizedBox(height:20,),

                    Row(children: [
                      //  SizedBox(width: 10,),
Container(
 height: 50,
 width: 140,
  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
 child:  Align(
  alignment: Alignment.center,
   child: Text('Check first name',
 style:TextStyle(fontSize: 15),
 ),
 ),),
                            SizedBox(width: 10,),

                       Container(
                        height: 50,
                        width: 200,
                        
                         child: TextField(
                          decoration: InputDecoration(
                         hintText: '',
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide(color: Colors.black)
                         )),),
                       )
                    ]),
                  ],
                ),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Column(
                  children: [
                               SizedBox(height:20,),

                    Row(children: [
                      //  SizedBox(width: 10,),
Container(
 height: 50,
 width: 140,
  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
 child:  Align(
  alignment: Alignment.center,
   child: Text('Check last name',
 style:TextStyle(fontSize: 15),
 ),
 ),),
                            SizedBox(width: 10,),

                       Container(
                        height: 50,
                        width: 200,
                        
                         child: TextField(
                          decoration: InputDecoration(
                         hintText: '',
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide(color: Colors.black)
                         )),),
                       )
                    ]),
                  ],
                ),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
                
              
              
              
              
                // onTap: () {
                //   // Handle option 2 tap
                //   Navigator.pop(context);
                // },
              ),
              // Add more options or content here
             ListTile(
                title: Column(
                  children: [
                               SizedBox(height:20,),

                    Row(children: [
                      //  SizedBox(width: 10,),
Container(
 height: 50,
 width: 140,
  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
 child:  Align(
  alignment: Alignment.center,
   child: Text('Check email',
 style:TextStyle(fontSize: 15),
 ),
 ),),
                            SizedBox(width: 10,),

                       Container(
                        height: 50,
                        width: 200,
                        
                         child: TextField(
                          decoration: InputDecoration(
                         hintText: '',
                          border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.black)
                         )),),
                       )
                    ]),
                  ],
                ),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
                
              
             ),
                ListTile(
                title: Column(
                  children: [
                               SizedBox(height:20,),

                    Row(children: [
                      //  SizedBox(width: 10,),j 
Container(
 height: 50,
 width: 140,
  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
 child:  Align(
  alignment: Alignment.center,
   child: Text('Check title',
 style:TextStyle(fontSize: 15),
 ),
 ),),
                            SizedBox(width: 10,),
                       Container(
                        height: 50,
                        width: 200,
                        
                         child: TextField(
                          decoration: InputDecoration(
                         hintText: '',
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide(color: Colors.black)
                         )),),
                       )
                    ]),
                  ],
                ),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
                ),
               ListTile(
                title: Column(
                  children: [
                               SizedBox(height:20,),

                    Row(children: [
                      //  SizedBox(width: 10,),
Container(
 height: 50,
 width: 140,
  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
 child:  Align(
  alignment: Alignment.center,
   child: Text('Check mobile number',
 style:TextStyle(fontSize: 15),
 ),
 ),),
                            SizedBox(width: 10,),

                       Container(
                        height: 50,
                        width: 200,
                        
                         child: TextField(
                          decoration: InputDecoration(
                         hintText: '',
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide(color: Colors.black)
                         )),),
                       )
                    ]),
                  ],
                ),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
                ),
              
              ListTile(
                title: Column(
                  children: [
                               SizedBox(height:20,),

                    Row(children: [
                      //  SizedBox(width: 10,),
Container(
 height: 50,
 width: 140,
  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
 child:  Align(
  alignment: Alignment.center,
   child: Text('Check phone number',
 style:TextStyle(fontSize: 15),
 ),
 ),),
                            SizedBox(width: 10,),

                       Container(
                        height: 50,
                        width: 200,
                        
                         child: TextField(
                          decoration: InputDecoration(
                         hintText: '',
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide(color: Colors.black)
                         )),),
                       )
                    ]),
                  ],
                ),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
                ),
              ListTile(
                title: Column(
                  children: [
                               SizedBox(height:20,),

                    Row(children: [
                      //  SizedBox(width: 10,),
Container(
 height: 50,
 width: 140,
  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
 child:  Align(
  alignment: Alignment.center,
   child: Text('Check lead choice source',
 style:TextStyle(fontSize: 15),
 ),
 ),),
                            SizedBox(width: 10,),

                       Container(
                        height: 50,
                        width: 200,
                        
                         child: TextField(
                          decoration: InputDecoration(
                         hintText: '',
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide(color: Colors.black)
                         )),),
                       )
                    ]),
                  ],
                ),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
                ),
              ListTile(
                title: Column(
                  children: [
                           SizedBox(height:20,),

                    Row(children: [
                      //  SizedBox(width: 10,),
Container(
 height: 50,
 width: 140,
  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
 child:  Align(
  alignment: Alignment.center,
   child: Text('Check lead choice source',
 style:TextStyle(fontSize: 15),
 ),
 ),),

                            SizedBox(width: 10,),

                       Container(
                        height: 50,
                        width: 200,
                        
                         child: TextField(
                          decoration: InputDecoration(
                         hintText: '',
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide(color: Colors.black)
                         )),),
                       )
                    ]),
                  ],
                ),
                                                       onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
                ),
              
            ListTile(
                title: Column(
                  children: [
                               SizedBox(height:20,),

                    Row(children: [
                      //  SizedBox(width: 10,),
Container(
 height: 50,
 width: 140,
  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
 child:  Align(
  alignment: Alignment.center,
   child: Text('Check fax',
 style:TextStyle(fontSize: 15),
 ),
 ),),
                            SizedBox(width: 10,),

                       Container(
                        height: 50,
                        width: 200,
                        
                         child: TextField(
                          decoration: InputDecoration(
                         hintText: '',
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide(color: Colors.black)
                         )),),
                       )
                    ]),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                
              
              
                
            ),
              
              
              
            
              
            ListTile(
                title: Column(
                  children: [
                               SizedBox(height:20,),

                    Row(children: [
                      //  SizedBox(width: 10,),
Container(
 height: 50,
 width: 140,
  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
 child:  Align(
  alignment: Alignment.center,
   child: Text('Check skype id',
 style:TextStyle(fontSize: 15),
 ),
 ),),
                            SizedBox(width: 10,),

                       Container(
                        height: 50,
                        width: 200,
                        
                         child: TextField(
                          decoration: InputDecoration(
                         hintText: '',
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide(color: Colors.black)
                                                  ),
                         ),),
                       )
                    ]),
                  ],
                ),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
                
           
            ),
            ListTile(
                title: Column(
                  children: [
                               SizedBox(height:20,),

                    Row(children: [
                      //  SizedBox(width: 10,),
Container(
 height: 50,
 width: 140,
  decoration:BoxDecoration(border: Border.all(color: Colors.black)),
 child:  Align(
  alignment: Alignment.center,
   child: Text('Check twitter',
 style:TextStyle(fontSize: 15),
 ),
 ),),
                            SizedBox(width: 10,),

                       Container(
                        height: 50,
                        width: 200,
                         child: TextField(
                          decoration: InputDecoration(
                         hintText: '',
                          border: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(20),
                         borderSide: BorderSide(
                          color: Colors.black)
                         )),),
                       )
                    ]),
                  ],
                ),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
            ) ,
            SizedBox(height: 30,
            ),
             InkWell(
              onTap: (){
                getFilterData(
check_first_namecontroller.text,
check_last_name_namecontroller.text,
 check_assistantcontroller.text,
 check_secondary_emailcontroller.text,
 checktwittercontroller.text,
 check_phone_numbercontroller.text,
 check_faxcontroller.text,
 check_skype_idcontroller.text,

                
                );
// setState(() {
//   showcontactlist = ;



  
// });

              },
               child: Container(
                         height: 50,
                         width: 150,
             
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [
                  Colors.purple,
                
                  Colors.orange,
                ]),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Apply',
                             style: TextStyle(color: Colors.white),
                             ),
                ),),
             ),
              
              
              
            Container(height: 100,)
            
            
            
            ],
          ),
        ),
      );
    },
  );
}

//methpd of bottomsheet for sorting
void _showsortingbottomSheet(BuildContext context) {
   Future.delayed(Duration(seconds: 3), () {
    Navigator.pop(context); // This closes the bottom sheet
  });

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        // Bottom sheet content goes here
        height: 200,
        width:390,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
             SizedBox(height: 30,),
              ListTile(
                title: Row(children: [
                
                  Text('Recently Added',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 160,
                  ),
                  
                  IconButton(onPressed: (){
                  },
                   icon: Icon(Icons.check_box_outline_blank))
           
                ]),
                onTap: () {
                  // Handle option 1 tap
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Row(children: [
                
                  Text('Favorites',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 210,
                  ),
                  IconButton(onPressed: (){

                  }, icon: Icon(Icons.check_box_outline_blank))
                              ]),
                onTap: () {
                  // Handle option 2 tap
                  Navigator.pop(context);
                },
              ),
              // Add more options or content here
          InkWell(onTap: (){
            
          },
              child: Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [
                  Colors.purple,
                  Colors.orange,
                ])
                ),
                child: Align(
                alignment: Alignment.center,
                child: Text('Apply',
                style: TextStyle(color: Colors.white,
                ),
                ),
              ),),
            ),
            Container(height: 100,
            ),
                       
            ],
          ),
        ),
      );
    },
  );
}




 
  @override
  Widget build(BuildContext context) {
    return  Consumer<FilterPage>(
      builder: (context, filterProvider, _) {
// body: 
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
 
    InkWell(
      onTap:(){

getshowcontactListData(id);
setState(() {
  isFvaoritesButton = false;
});
      },
      child: Text('All contacts',
      style: TextStyle(fontWeight: FontWeight.bold,
      fontSize: 20,
        ),
      ),
    ),
 SizedBox(width: 120,),
 InkWell(
  onTap:(){
getfavroites();
 setState(() {
   isFvaoritesButton = true;
 });
  },
   child: Text('Favorites',
   style: TextStyle(fontWeight: FontWeight.bold,
   fontSize: 20,
   ),
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
 // if(newFiltersData == true)
 
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
       
    ),
    ),),
 ),
 
//  Container(
//    height: 1000,
//    child:   FutureBuilder(
//          future: getFilterData(
//          check_first_namecontroller,
//     check_last_name_namecontroller.text,
//      check_assistantcontroller.text,
//      check_secondary_emailcontroller.text,
//      checktwittercontroller.text,
//      check_phone_numbercontroller.text,
//      check_faxcontroller.text,
//      check_skype_idcontroller.text
//          ),
//          builder: (context,snapshot) {
    
//        if (
//         snapshot.connectionState == ConnectionState.waiting) {
//              return Text('Loading',
    
//          style: TextStyle(color: Colors.purple),
    
//          );
    
//        }else if(snapshot.hasError){
    
//          return Text('No any filters found');
    
//        }else if(snapshot.hasData){
//     // String filterData = check_first_namecontroller.text;
//          return ListView.builder(
    
//            itemCount: newFiltersData.length,
    
//            itemBuilder: (context, index) {
//          return Text('${newFiltersData[index]['first_name']}');
//        });
//        }else{
    
//          return Text('Error in loading');
    
//        }
    
//      } ,),
//  ),
 
 
 // isFiltersapllied?
 // Container(
 //   height: 1000,
 //   child:   FutureBuilder(
    
 //     future: getFilterData(),


// if(isFvaoritesButton== false)

     Container(
    height: 1000,
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
 
 
 
          // return Center(child: Text('No contacts available.'));
       
        
       final showcontactlist = showContactlist['data'];
 
        return InkWell(
          onTap: (){
    
         
          Navigator.push(context, MaterialPageRoute(builder:(context) => showDetailsPage(),));  
          },
          child: ListView.builder(
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
         
         IconButton(onPressed: (){
         
         
        
         PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
               value: 'Edit',
          child: Text('Edit'),
         ),
        
         PopupMenuItem<String>(
          value: 'Delete',
          child: Text('Delete'),
         ),
         ];
         },
        
           onSelected: (String selectedValue) {
            // Handle the selected option
            if (selectedValue =='Edit') {
              // Handle option 1
            } else if (selectedValue == 'Delete') {
              // Handle option 2
            }
           }
         );
         
         
         
         
         
         }, 
         icon: Icon(Icons.more_vert),
         )    ,  
          
              
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
         IconButton(
          onPressed: (){
          Get.snackbar(
          'items added to your list',
           'Messages',
           backgroundColor: Colors.green,
           colorText: Colors.white,
          duration: Duration(seconds: 10),
         snackPosition: SnackPosition.BOTTOM,
          );
         
         print(isFavorites);
         setState(() {
         isFavorites = !isFavorites;
         });
                             
         }, 
        
        
         icon: isFavorites?
         Icon(Icons.favorite,
         color: Colors.grey,
         ):Icon(Icons.favorite,
         color: Colors.blue,
         ),
         
         )
             ],
           ),
         
         
         SizedBox(height: 40,)
           
            ],)
            
            ;
            
          },),
        );
    
      }else{
    
        return Text('sorry');
    
 
     
       }
      }),
      ),
   
   
    
          
   
//  //for favorites List
 
  Container(
    height: 1000,
    // MediaQuery.of(context).size.height,
    child:   FutureBuilder(
    
      future: getfavroites(),
    
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
          // final List<dynamic> contactsData = showContactlist!['data'];
 
 
 if (favoritesData.isEmpty) {
          return Center(child: Text('No contacts available.'));
        }
      //  final showcontactlist = showContactlist['data'];
 
        return ListView.builder(
    scrollDirection: Axis.vertical,
           itemCount: favoritesData.length,
            itemBuilder: (context, index) {
   return Column(children: [
Row(children:[
SizedBox(width: 10,),
      CircleAvatar(
    
         radius: 30,
    
        backgroundColor: Colors.grey,
    
        child: Icon(Icons.person,
    
        color: Colors.blue,
    
        ),),
    SizedBox(width: 30,),
    
 // Text('${newFiltersData[index]['email']}'):
 Text('${favoritesData[index]['first_name']}',
 style: TextStyle(fontWeight: FontWeight.bold,
 fontSize: 20,
 
 ),
 ),
 // :Text('${searchData?[index]['data']}'),
 
 
 
 // Text('${contactsData[index]['email']}'),
 
    Spacer(),
  IconButton(onPressed: (){
 // Container(child:Row(children: [
 
 //   IconButton(onPressed: =(){
 
 //   },
 //    icon: Icon(Icons.edit))
 // ]),)
 }, 
 icon: Icon(Icons.more_vert),
 )    ,  
        
            
            ],),
    SizedBox(height:5,),
       
         Padding(
           padding: const EdgeInsets.only(right:150),
           child: Text('+91${favoritesData[index]['phone']}'),
         ),
   Row(
     children: [
       SizedBox(width: 70,),
        Text('${favoritesData[index]['email']}',
       style: TextStyle(
        fontSize:14),
       ),
    
        //  SizedBox(width: 30,),
 Spacer(),
IconButton(
  onPressed: (){
}, 
icon: Icon(Icons.favorite,
color: Colors.pink,
))

   ]),
// Text('${favoritesData[index]['first_name']}')
Divider(thickness: 1,
color: Colors.black,
)

   ],);

      }
      );
      }else{
        return Text('sorry');
      } 
      }
  
      )
   ),
   
// ]) ),
 ])));
// floatingActionButton: FloatingActionButton(
//   // backgroundColor: Colors.white,
//   // clipBehavior: Clip.antiAlias,
//   onPressed: (){
// Navigator.push(context, MaterialPageRoute(builder:(context) => createcontactPage(),));
// },
// child: Container(
//   height: 100,
//   width: 200,
//   decoration: BoxDecoration(borderRadius: BorderRadius.circular(19),
// gradient: LinearGradient(colors: [
//   Colors.purple,
//   Colors.orange,
// ],
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// )
// ),
// child: Align(
//   alignment: Alignment.center,
//   child: Text('+',
//   style: TextStyle(color: Colors.white,
//   fontSize: 20,
//   fontWeight: FontWeight.bold,
//   ),
  
//   )),
// ),
// );
  });
  
  }
}