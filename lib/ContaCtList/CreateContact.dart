import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_lead_project/ContaCtList/contactList.dart';
import 'package:flutter_lead_project/Userpage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_lead_project/api/ApiFile.dart';
import 'package:http/http.dart'as http;
class createcontactPage extends StatefulWidget {
    const createcontactPage({super.key});
  @override
  State<createcontactPage> createState() => _createcontactPageState();
}

class _createcontactPageState extends State<createcontactPage> {

String id = '1';
 TextEditingController firstNamecontroller = TextEditingController();
 TextEditingController lastNamecontroller = TextEditingController();
 TextEditingController emailcontroller = TextEditingController();
 TextEditingController phonecontroller = TextEditingController();
 TextEditingController otherphonecontroller  = TextEditingController();
 TextEditingController assistantcontroller = TextEditingController();
 TextEditingController streetcontroller = TextEditingController();
//  TextEditingController citycontroller = TextEditingController();
//  TextEditingController statecontroller  = TextEditingController();
 TextEditingController descriptioncontroller = TextEditingController();
TextEditingController zipcodecontroller = TextEditingController();

// FOR DIALOG bOX
bool isalertBoxVisible = false;
//for navogator
bool contactcreatesuccesfully = true;


String countryValue ='';
String statevalue = '';

String cityValue = '';
// bool isFilled = true;

 String? Usercreatecontact;

//FPR DIALOG bOX
void showsAlertDialogBox(){

  setState(() {
    isalertBoxVisible = true;
  });
Future.delayed(
  Duration(seconds: 3),(){
  setState(() {
    isalertBoxVisible = false;
  });
}

);


}
//FOR pIck image from camera

 bool ? cameraImage;
 File? xImage;
 Future<void> getcameraImage(ImageSource source)async{
try{
final cameraImage = await ImagePicker().pickImage(
  source: source 
);
if(cameraImage == null){
  print('No any selected images');
// xImage = ;
print(xImage);
}else{
 setState(() {
xImage=  File(cameraImage.path);
print(xImage);
 });
}


}catch(error){
  print(error);
  rethrow;
}

 }
 
//  initailzie methods
 @override
 void initState(){
  super.initState();
   getcountryData();
 getcity();
 getstate();
 
 }
 
 //for show contact lead
 
 Future<void> getcreateUsercontact() async {
  try {
    var response = await http.post(Uri.parse(
      'https://b1.bhaaraterp.com/leads/api/create-contact-leads/',
    ),
    headers: {
      'token':'6fba84eba684a66dfd52213a34327e14dfffb322',
    },
    body: {
'store_id':'1',
'contact_owner_id':'486',
'first_name':firstNamecontroller.text,
'email':emailcontroller.text,
'phone':phonecontroller.text,
'mobile':otherphonecontroller.text,
'assistant':assistantcontroller.text,
'mailing_street':streetcontroller.text,
'mailing_city':cityValue,
'mailing_state':statevalue,
'description':descriptioncontroller.text,
   'zipcode':zipcodecontroller.text,
    },
   
    );

      var data = json.decode(response.body);
      print(response.body);
        
   Usercreatecontact =data['message'];
   print('tashu# :${Usercreatecontact}');
  //  return Usercreatecontact;
  } catch (error) {
    print('Error: $error');
    rethrow;
  }
}
  
  // Ui part
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20,),
  
Container(
 height: 80,
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
  builder:(context) => UserPage(),));
}, icon: Icon(Icons.arrow_back,
color: Colors.white,
)),
SizedBox(width:90,),
Text('Create Contact',
style: TextStyle(color: Colors.white,
fontSize: 20,
),
),
SizedBox(width: 80,),

Icon(Icons.notifications,
color: Colors.white,
)



]),),
Row(children: [
IconButton(onPressed: ()async{
await getcameraImage(ImageSource.camera);
}, icon: const Icon(Icons.camera_alt,

),
),
const Text('General Informtion',
style: TextStyle(fontWeight: FontWeight.bold,
fontSize: 22,
),
)

],),

Row(
  children: [
        if(xImage != null)
      //  xImage !=null?
        CircleAvatar(
          radius: 50,
       backgroundImage: 
      FileImage(File(xImage!.path )
           ),
                      // NetworkImage('${widget.imageUrl}')

        ),

        ]),
     
     SizedBox(height: 30),
     Padding(
       padding: const EdgeInsets.only(left: 30,
      right: 30, 
       ),
       child: TextField(
     controller: firstNamecontroller,
        decoration: InputDecoration(
       hintText: 'First Name',
      
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
         
       ),
       ),),
     ),
      SizedBox(height: 20),
     Padding(
       padding: const EdgeInsets.only(left: 30,
      right: 30, 
       ),
       child: TextField(
       controller: lastNamecontroller,
        decoration: InputDecoration(
       hintText: 'last Name',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
         
       ),
       ),),
     ),
      SizedBox(height: 20),
     Padding(
       padding: const EdgeInsets.only(left: 30,
      right: 30, 
       ),
       child: TextField(
        controller: emailcontroller,
        decoration: InputDecoration(
       hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
                ),
       ),),
     ),

     SizedBox(height: 30),
     Padding(
       padding: const EdgeInsets.only(left: 30,
      right: 30, 
       ),
       child: TextField(
controller: phonecontroller,
        decoration: InputDecoration(
       hintText: 'Phone',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
         
       ),
       ),),

     ),

      SizedBox(height: 30),
     Padding(
       padding: const EdgeInsets.only(left: 30,
      right: 30, 
       ),
       child: TextField(
      controller: otherphonecontroller,
        decoration: InputDecoration(
       hintText: 'other phone ',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
         
       ),
       ),),
     ),

      SizedBox(height: 30),
     Padding(
       padding: const EdgeInsets.only(left: 30,
      right: 30, 
       ),
       child: TextField(
        controller: assistantcontroller,
        decoration: InputDecoration(
       hintText: 'Assistant',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
         
       ),
       ),),
     ),
 const SizedBox(height: 20,),

const Row(children: [
 SizedBox(width: 20,),
  Icon(Icons.person),
Text('Adress Information',
style: TextStyle(fontWeight: FontWeight.bold,
fontSize: 20,
),
)
],
),


 const SizedBox(height: 30),
     Padding(
       padding: const EdgeInsets.only(left: 30,
      right: 30, 
       ),
       child: TextField(
      //  controller: statecontroller,
        decoration: InputDecoration(
      // suffixIcon: IconButton(onPressed: (){


      // },
      // icon: Icon(Icons.arrow_drop_down_sharp),
      // ),
       hintText: 'zip code',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
         
       ),
       ),),
     ),
     
      const SizedBox(height: 30),
     Padding(
       padding: const EdgeInsets.only(left: 30,
      right: 30, 
       ),
       child: TextField(
        controller: streetcontroller,
        decoration: InputDecoration(
    //  suffixIcon: IconButton(onPressed: (){

    //   },
      
    //   icon: Icon(Icons.arrow_drop_down)),
     
       hintText: 'Select street',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
         
       ),
       ),),
     ),
     
     
     
      const SizedBox(height: 30),
     Padding(
       padding: const EdgeInsets.only(left: 30,
      right: 30, 
       ),
       child: TextField(
        // controller: citycontroller,
        decoration: InputDecoration(
      suffixIcon: IconButton(onPressed: (){
 showDialog(
       context: context,
       builder: (context) {
                return   AlertDialog(
                           contentPadding: EdgeInsets.symmetric(horizontal: 24.0), // Adjust the padding

                  title: Text('Select  country',
                  style: TextStyle(fontWeight: FontWeight.bold,),
                  ),
                  content: Container(
                    height:600,
                    //  MediaQuery.of(context).size.height,
                    width: 340,
                    child:  Column(
                    children: [
Container(
  height: 600,
  child:   ListView.builder(
  scrollDirection: Axis.vertical,
          itemCount: countryData.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
setState(() {
   countryValue  = countryData[index]['name'];//

}
);
             },
              child: ListTile(
                title: Text(countryData[index]['name'],
                         
                ),
              ),
    
    
    
            );}),
),
                  ]),)
                  
                  //  Text('${Usercreatecontact}'),
                );
    });
      },
      
      icon: const Icon(Icons.arrow_drop_down)),
     
           hintText: countryValue ==''?
      
       'Select  country':countryValue,
       
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
         
       ),
       ),),
     ),
    
     SizedBox(height: 30),
     Padding(
       padding: const EdgeInsets.only(left: 30,
      right: 30, 
       ),
     
  child: TextField(
        // controller: streetcontroller,
        decoration: InputDecoration(
      suffixIcon: IconButton(onPressed: (){
 showDialog(
       context: context,
       builder: (context) {
         
     
       
       return   AlertDialog(
                           contentPadding: EdgeInsets.symmetric(horizontal: 24.0), // Adjust the padding

                  title: Text('Select  state',
                  style: TextStyle(fontWeight: FontWeight.bold,),
                  ),
                  content: Container(
                    height: 450,
                    width: 340,
                    child:  SingleChildScrollView(
                      child: Column(
                      children: [
                     Container(
                        height: 600,
                        child:   ListView.builder(
                        scrollDirection: Axis.vertical,
                                itemCount: stateData.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                      setState(() {
                         statevalue  = stateData[index]['state'];//
                      
                      }
                      );
                                   },
                                    child: ListTile(
                                      title: Text(stateData[index]['state'],
                             
                                      ),
                                    ),
                          
                          
                          
                                  );}),
                      ),
                      
                                       
                                      ]),
                    ),)
                  
                  //  Text('${Usercreatecontact}'),
                );
    });
      },
      
      icon: Icon(Icons.arrow_drop_down)),
       hintText:statevalue == ''? 
       
       'Select state':statevalue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
         
       ),
       ),),
      ),
     




      SizedBox(height: 30),
     Padding(
       padding: const EdgeInsets.only(left: 30,
      right: 30, 
       ),
       child: TextField(
      //  controller: statecontroller,
        decoration: InputDecoration(
     suffixIcon: IconButton(onPressed: (){
 showDialog(
       context: context,
       builder: (context) {
         
     
       
       return   AlertDialog(
                           contentPadding: EdgeInsets.symmetric(horizontal: 24.0), // Adjust the padding

                  title: Text('Select  city',
                  style: TextStyle(fontWeight: FontWeight.bold,),
                  ),
                  content: Container(
                    height: 450,
                    width: 340,
                    child:  SingleChildScrollView(
                      child: Column(
                      children: [
                    Container(
                      height: 600,
                      child:   ListView.builder(
                      scrollDirection: Axis.vertical,
                              itemCount: cityData.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                    setState(() {
                       cityValue  = cityData[index]['city'];//
                    
                    }
                    );
                                 },
                                  child: ListTile(
                                    title: Text(cityData[index]['city'],
                           
                                    ),
                                  ),
                        
                        
                        
                                );}),
                    ),
                    
                    
                                      ]),
                    ),)
                  
                  //  Text('${Usercreatecontact}'),
                );
    });
      },
      
      icon: Icon(Icons.arrow_drop_down)),


    
           hintText:cityValue == ''? 
           
           'Select  city':cityValue,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
         
       ),
       ),),
     ),



SizedBox(height: 20,),
Padding(
  padding: const EdgeInsets.only(left: 30,right: 30),
  child:   TextField(
  
  maxLines: 5,
  
    decoration: InputDecoration(
  
  
  
      hintText: 'Description',
      border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    )),),
),
    SizedBox(height: 30,),
    InkWell(
     onTap: ()async{

getcreateUsercontact();
    showsAlertDialogBox();
   getshowcontactListData(id);
    if(isalertBoxVisible){
    await  showDialog(
       context: context,
       builder: (context) {
                    
       return   AlertDialog(
                           contentPadding: EdgeInsets.symmetric(horizontal: 24.0), // Adjust the padding

                  title: Text('Messages'),
                  content: 
                  
                  Text('${Usercreatecontact}'),
                );    });
    }
    // if(Usercreatecontact/){
    Navigator.push(context, MaterialPageRoute(builder:(context) => contactPage(),));
    
     },
      child: Container(
        height: 50,
        width: 130,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(colors: [
    Colors.purple,
    Colors.orange,
    
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
        )
        ),
        


        child: Align(
         alignment: Alignment.center,
          child: Text('Save',
            style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            ),
            ),
        ),),
    ),
      Container(height: 100,)
      ]),
    ));
  }
}