import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_lead_project/Userpage.dart';
import 'package:flutter_lead_project/api/ApiFile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class UpadetMydata extends StatefulWidget {

  final List< dynamic> leadsProfileData;
  final String FirstName;
  final String LastName;
  final String gender;
  final String imageUrl;
       const UpadetMydata({
        super.key, 
       required this.leadsProfileData, 
        required this.FirstName, 
  required this.LastName,
   required this.gender, 
   required this.imageUrl});
 @override
  State<UpadetMydata> createState() => _UpadetMydataState();
}


class _UpadetMydataState extends State<UpadetMydata> {
 TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();
 TextEditingController gendercontroller= TextEditingController();
 TextEditingController fathernamecontroller= TextEditingController();
 TextEditingController mothernamecontroller= TextEditingController();
 TextEditingController dobcontroller= TextEditingController();
 TextEditingController martialcontroller= TextEditingController();
 TextEditingController currentaddresscontroller= TextEditingController();


TextEditingController datecontroller = TextEditingController();
DateTime ?selectdate;
void _selectedDate()async{
  DateTime? picked = await showDatePicker(
    context: context, 
    initialDate: selectdate ?? DateTime.now(),
     firstDate: DateTime(2000), 
     lastDate: DateTime(2023, 12, 11)
     ); 

if(picked != null){
  setState(() {
  //selectdate =DateTime.now()
    // selectdate = picked;
    datecontroller.text = picked.toString();
  }
  );
}


}


String ?_selectedDropdownValue;
  List<String> _dropdownItems = ['Male', 'Female'];


bool showchoosenImages = false;
void submitupdateData(){
  Map<String, dynamic> updateData = {
'first_name' : firstNamecontroller.text,
'last_name':lastNamecontroller.text,
'gender':gendercontroller.text,
    //here 
  };
upadatreProfile;
print('updateData:${updateData}');
}
 
bool? image;
XFile?   xImage;
Future<void> getImage(ImageSource source)async{
try{
final image = await ImagePicker().pickImage(
  source: source);
if(image== null){
  // File file=File(
  //   [] , image!.path);

print('Image selected canclled');
} else{
  setState(() {
xImage=image;
print(xImage);

  });
}
}catch(error){
  print(error);
  rethrow;
}

}


 
  @override
  Widget build(BuildContext context) {
   
   
    return Scaffold(
body: SingleChildScrollView(
  child:   Column(children: [
  SizedBox(height: 20,),
  
Container(
 height: 80,
 width: 396,

  decoration: BoxDecoration(gradient: LinearGradient(colors: [

    Colors.purple,
    Colors.purple,
    Colors.orange,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
    )),
  child: Row(children: [
IconButton(
  onPressed: (){
// setState(() {
//   if(upadatreProfile != null){
    
//   }
// });
// Navigator.pop(context, getUpdateProfile(
//   'first_name', 
// 'last_name', 
// 'gender', 
// 'father_name',
// 'mother_name',
//  'dob', 
// 'marital_status', 'current_address',
//  xImage));


Navigator.push(context, MaterialPageRoute(
  builder:(context) => UserPage(),));
}, icon: Icon(Icons.arrow_back,
color: Colors.white,
)),
SizedBox(width:90,),
Text('Update Profile',
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
await getImage(ImageSource.camera);
}, icon: Icon(Icons.camera_alt,

),
),
Text('General Informtion',
style: TextStyle(fontWeight: FontWeight.bold,
fontSize: 22,
),
)

],),

Row(
  children: [
        // if(xImage != null)
       xImage !=null?
        CircleAvatar(
          radius: 50,
       backgroundImage: 
      FileImage(File(xImage!.path )
           )
                      // NetworkImage('${widget.imageUrl}')

        ):CircleAvatar(
          radius: 50,
       backgroundImage: 
          
                              NetworkImage('${widget.imageUrl}')
 ,
        ),
 SizedBox(width: 80,),
 Container(
  decoration: BoxDecoration(border: Border.all()),
  child: Row(children: [
  IconButton(
    onPressed: (){


  }, icon: Icon(Icons.image),
  
  ),
  Text('upload image',
  style: TextStyle(fontWeight: FontWeight.bold,
fontSize: 18,
),

  ),
  IconButton(onPressed: ()async{
 await   getImage(ImageSource.gallery);

  }, icon: Icon(Icons.upload))
 ]
 ),),
 
 
 
  ],
),



SizedBox(height: 30,),

  TextField(
   controller: firstNamecontroller,
    decoration: InputDecoration(
    // 'Upadet your First Name',
    hintText: '${widget.leadsProfileData[0]['first_name']}',
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),
    ),
    ),),

  SizedBox(height: 20,),
   TextField(
   controller: lastNamecontroller,
    decoration: InputDecoration(
    hintText: '${widget.leadsProfileData[0]['last_name']}',
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),
    ),
    ),),
 
    
   
SizedBox(height: 20,),
   TextField(
   controller: gendercontroller,
    decoration: InputDecoration(
       prefixIcon: Padding(
      padding: const EdgeInsets.only(left: 30),
      child: DropdownButton<String>(
                      value: _selectedDropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 10,
                      onChanged: ( newValue) {
                        setState(() {
                          _selectedDropdownValue = newValue;
                        });
                      },
                      items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
    ),
   
   
    // hintText: '${widget.leadsProfileData[0]['gender']}',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    ),),
    SizedBox(height: 20,),

 TextField(
  
  controller: fathernamecontroller,
    decoration: InputDecoration(
    hintText: 'Upadet your father name',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    ),),
   SizedBox(height: 20,),
 
 TextField(
  
  controller: mothernamecontroller,
    decoration: InputDecoration(
    hintText: 'Upadet your mother name',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    ),),
   SizedBox(height: 20,),
 
 TextField(
  
  controller: datecontroller,
    readOnly: true,
    onTap: _selectedDate,
    decoration: InputDecoration(
    hintText: 'Upadet your DOB',
    suffixIcon: Icon(Icons.calendar_today),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    ),),
   SizedBox(height: 20,),
 TextField(
  
  controller: martialcontroller,
    decoration: InputDecoration(
    hintText: 'Upadet your martail status',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    ),),

   SizedBox(height: 20,),


    TextField(
  
  controller: currentaddresscontroller,
    decoration: InputDecoration(
    hintText: 'Upadet your currentaddress',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    ),),
  SizedBox(height: 40,),
ElevatedButton(
  onPressed: (){
  getUpdateProfile(
    firstNamecontroller.text,
    lastNamecontroller.text,
    gendercontroller.text,
 fathernamecontroller,
 mothernamecontroller,
 dobcontroller,
 martialcontroller,
 currentaddresscontroller,
//  getImage(),
xImage,
);

// submitupdateData();
Navigator.push(context, MaterialPageRoute(builder:(context) =>
 UserPage(),));

}, child: Text('Submit your update',
style: TextStyle(color: Colors.pink),
))

  ]),
),

    );
  }
}