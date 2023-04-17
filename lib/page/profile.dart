import 'package:flutter/material.dart';
import 'package:digital_business_card/page/cons.dart';



class Profile_page extends StatefulWidget {
  const Profile_page({super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
          
        //   actions: [
            
        //     IconButton(onPressed: (){}, icon: Icon(Icons.qr_code))
        //   ],
        // ),
        body: Column(
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: blue, size: MediaQuery.of(context).size.width*.045,),),
                )
                
                
              ],
            ),
            Center(
              child: Text(
                'Business cards',
                style: TextStyle(fontWeight: FontWeight.bold,color: blue, fontSize: MediaQuery.of(context).size.height*.055),)
              ),

              Card(
                elevation: 20,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  height: MediaQuery.of(context).size.height*.3,
                  width: MediaQuery.of(context).size.width*.9,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Icon(Icons.person,
                          size: MediaQuery.of(context).size.height*.2,),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Abebe Kebede', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.055),),
                          RichText(text: 
                          const TextSpan(
                            text: 'Work Area: ', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: 'Engineering', style: TextStyle(color: Colors.grey))
                            ]
                          )),
                          RichText(text: 
                          const TextSpan(
                            text: 'Email: ', style: TextStyle(fontWeight: FontWeight.bold, ),
                            children: <TextSpan>[
                              TextSpan(text: 'test@gmail.com', style: TextStyle(color: Colors.grey))
                            ]
                          )),
                          RichText(text: 
                          const TextSpan(
                            text: 'Phone NO: ', style: TextStyle(fontWeight: FontWeight.bold, ),
                            children: <TextSpan>[
                              TextSpan(text: '0912345678', style: TextStyle(color: Colors.grey))
                            ]
                          )),
                          RichText(text: 
                          const TextSpan(
                            text: 'Job Type: ', style: TextStyle(fontWeight: FontWeight.bold, ),
                            children: <TextSpan>[
                              TextSpan(text: 'CEO', style: TextStyle(color: Colors.grey))
                            ]
                          )),
                          RichText(text: 
                          const TextSpan(
                            text: 'company: ', style: TextStyle(fontWeight: FontWeight.bold, ),
                            children: <TextSpan>[
                              TextSpan(text: 'ABC .PLC', style: TextStyle(color: Colors.grey))
                            ]
                          )),
                          Row(
                            children: [
                              ElevatedButton(onPressed: (){
                                Navigator.pushNamed(context, "/edit");
                              },
                              style: ElevatedButton.styleFrom(
                                primary: blue,
                                
                              )
                              , child: Text("EDIT", style: TextStyle(fontSize: MediaQuery.of(context).size.width*.055),) ),
                              SizedBox(width: 10,),

                              IconButton(onPressed: (){
                                Navigator.pushNamed(context, '/setup');
                              }, icon: Icon(Icons.qr_code, color: blue,size: MediaQuery.of(context).size.width*.075,))
                              
                            ],
                          )
                          
                        ],
                      )
                      
                    ],
                  ),
                ),
              )

          ],
        ),
      ),
    );
  }
}