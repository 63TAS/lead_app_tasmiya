import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lead_project/ContaCtList/CreateContact.dart';
import 'package:flutter_lead_project/ContaCtList/contactList.dart';
import 'package:flutter_lead_project/api/ApiFile.dart';
import 'package:flutter_lead_project/provider/PROVIDER.dart';
import 'package:flutter_lead_project/update/updateProfile.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
    const UserPage({super.key});
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
          //  final ThemeProvider themeProvider;
// final prpvider= Provider.of<ThemeProvider>(context, listen: false);

    // final ThemeProvider  themeProvider;

  int _currentIndex = 0;

//   final List<Widget> pages =[
// HomeScreen(),
// contactScreen(),
// profileScreen(),
// searchScreen(),

//   ];
 
 
  @override
  void initState(){
    super.initState();
    // final  provider = Provider.of<ThemeProvider>(context, listen: false);

  getProfileData();
  }
  
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    // create: (context) => ThemeProvider(),
    // builder: (context, child) {
           
    //      final provider= Provider.of<ThemeProvider>(context, listen: false);
  

     return   Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                Colors.pink,
             Colors.yellow,
             
              ],
              begin: Alignment.bottomCenter,
        end: Alignment.topLeft,
              ),
              ),
              
              child: Column(
                children: [
                  Row(
                    children: [
                     SizedBox(height: 150,),
                     
                     IconButton(onPressed: (){
        
                     }, icon: 
                      Icon(Icons.menu,
                    color: Colors.white, 
                      ) ),
                      SizedBox(width:
                       10,),
          
                      Text('Profile',
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                    fontSize:25,
                      ),
                      
                      ),SizedBox(width: 70,),
                          
                           IconButton(
                        onPressed: (){
        
        Navigator.push(context,
         MaterialPageRoute(builder:(context) =>
      UpadetMydata(
      leadsProfileData: leadsProfileData,
       FirstName:'first_name' ,
       LastName:'last_name',
       gender: 'gender',
        imageUrl: 'https://i.pinimg.com/236x/50/d5/5f/50d55f99c3e5d33ce921fba9cf8c127f.jpg',
      ),));
                           }, icon: Icon(Icons.edit,
                           color: Colors.white,
                           )) ,      
                                  
                                  Text('Update your profile',style: TextStyle(color: Colors.white),),
        
                                           ],
                  ),
               
               CircleAvatar(radius: 50,
               backgroundImage: NetworkImage('https://i.pinimg.com/236x/50/d5/5f/50d55f99c3e5d33ce921fba9cf8c127f.jpg'),
               ),
                ],
              ),
           
            ),
          
            Container(
              height: MediaQuery.of(context).size.height,
              width:410,
              // MediaQuery.of(context).size.width,
              child: Card(
               shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   SizedBox(height: 40,),
        
            Row(
              children: [
                Text('Account Info',
           style: TextStyle(fontWeight: FontWeight.bold,
           fontSize: 22,
           ),
           ),
         
         SizedBox(width: 100,),
          ElevatedButton(onPressed: (){

          },
// provider.toggletheme,          
           child: Text('change theme',
          style: TextStyle(color: Colors.purple,
          fontWeight: FontWeight.bold,
          ),
          ))
          
          
              ],
            ),
         SizedBox(height: 20,),
        
        FutureBuilder(
      future: getProfileData(),
      builder: (context, snapshot) {
         if(snapshot.connectionState == ConnectionState.waiting){
        return CircularProgressIndicator();
        }else if(snapshot.hasError){
      return Text('Error :${snapshot.hasError}');
        }else if(snapshot.hasData){
      final leadsProfileData = snapshot.data;
      return Expanded(
      child: ListView.builder(
        itemCount: leadsProfileData!.length,
        itemBuilder: (context, index){
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Full Name',
      style: TextStyle(fontWeight: FontWeight.bold,
      fontSize: 17,
      ),
      ),
      //  full nMAE ARE HERE
      SizedBox(height: 20,),
        
      Text('FirstName'),
      Row(
      children: [
        Text('${leadsProfileData[index]['first_name']}',
        style: TextStyle(),
        ),
       SizedBox(width: 185,),
         Text('Gender -${leadsProfileData[index]['gender']}',
      style: TextStyle(fontWeight: FontWeight.bold,
      fontSize: 17,
      ),
      ),
      
      ],
      ),
      
      
      SizedBox(height: 18),
          Text('LastName',
         style: TextStyle(fontWeight: FontWeight.bold, 
          ),
          ),
        
        
        
         Text('${leadsProfileData[index]['last_name']}',
      
      ),
        SizedBox(height: 20,),
             Text('NickName',
             style: TextStyle(fontWeight: FontWeight.bold, 
          ),
             
             ),
        
       
      Text('${leadsProfileData[index]['nick_name']}'),
        SizedBox(height: 20,),
        Text('emailId',
        style: TextStyle(fontWeight: FontWeight.bold, 
          ),
        ),
         
       Text('${leadsProfileData[index]['email']}'),
        
         SizedBox(height: 20,),
        Text('User mobile Number',
        style: TextStyle(fontWeight: FontWeight.bold, 
          ),
        ),
        Text('${leadsProfileData[index]['mobile_number']}'),
         
        
      ],
      );
      },
      ),
      );
        }else{
      return Text('sorry ');
        }
      },
      )
        
        
        
             ]),),
            ),
        
          
          
          ]),
        ),
      
      
      bottomNavigationBar: BottomNavigationBar(
         
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
             
              icon: IconButton(onPressed: (){
        
              },
              icon: Icon(Icons.home),
              ), 
              label: 'Home',
            ),
      
       BottomNavigationBarItem(
              icon: IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => createcontactPage(),));
        
              },
              icon: Icon(Icons.add_circle_rounded),
              ),
              // con(Icons.add_circle_rounded),
              label: 'create contact',
            ),
            BottomNavigationBarItem(
             
              icon: IconButton(
                onPressed:(){
        
        Navigator.push(context, MaterialPageRoute(builder:(context) => contactPage(),));
        // createcontactPage();
                },
               icon: Icon(Icons.person)),
              label: 'Profile',
            ),])
            );
            
    
  }
}