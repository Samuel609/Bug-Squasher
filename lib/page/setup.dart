import 'package:digital_business_card/database/business_card.dart';
import 'package:digital_business_card/database/dbHelper.dart';
import 'package:digital_business_card/database/sqlHelper.dart';
import 'package:flutter/material.dart';
import 'package:digital_business_card/page/cons.dart';


class Setup extends StatefulWidget {
  final Business_card? business_card;

  const Setup({
    Key? key,
    this.business_card
    
  }) : super(key : key);

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
   int _val = 0;


  @override
  Widget build(BuildContext context) {
    final TextEditingController workAreaController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoenNOController = TextEditingController();
    final TextEditingController jobTypeController = TextEditingController();
    final TextEditingController companyController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back, color: blue, size: MediaQuery.of(context).size.width*.045,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(onPressed: (){}, 
                    child: Text("SKIP", style: TextStyle(color: blue),)
                    ),
                  )
                  
                  
                ],
              ),
    
              Text('SET UP', style: TextStyle(fontWeight: FontWeight.bold, color: blue, fontSize: MediaQuery.of(context).size.width*.075),),
    
              Container(
                width: MediaQuery.of(context).size.width*.9,
                height: MediaQuery.of(context).size.height*.8,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                      child: Text('Work Area', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.035),),
                    ),
    
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Expanded(
                         child: RadioListTile(
                          activeColor: blue,
                            title: Text('Enggineering'),
                              value: 1, 
                              groupValue: _val,
                              onChanged: (value){
                                setState(() {
                                  _val = value!;
                                });
                              }
                            ),
                       ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: blue,
                              title: Text('Economics'),
                                value: 2, 
                                groupValue: _val,
                                onChanged: (value){
                            setState(() {
                              _val = value!;
                            });
                            }
                           ),
                          ),
                      
                     ],
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Expanded(
                         child: RadioListTile(
                          activeColor: blue,
                            title: Text('tech'),
                              value: 3, 
                              groupValue: _val,
                              onChanged: (value){
                                setState(() {
                                  _val = value!;
                                });
                                 //selected value
                              }
                            ),
                       ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: blue,
                              title: Text('Medicaine'),
                                value: 4, 
                                groupValue: _val,
                                onChanged: (value){
                            setState(() {
                              _val = value!;
                            });
                             //selected value
                             }
                            ),
                          ),
                      
                     ],
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Expanded(
                         child: RadioListTile(
                          activeColor: blue,
                            title: Text('Psychology'),
                              value: 5, 
                              groupValue: _val,
                              onChanged: (value){
                                setState(() {
                                  _val = value!;
                                });
                                 //selected value
                              }
                            ),
                       ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: blue,
                              title: Text('Law'),
                                value: 6, 
                                groupValue: _val,
                                onChanged: (value){
                            setState(() {
                              _val = value!;
                            });
                          }
                         ),
                          ),
                      
                     ],
                   ),
    
                   Padding(
                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                      child: Text('Email:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.035),),
                    ), 
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        
                      ),
                      
                    ),
    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                      child: Text('Phone NO:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.035),),
                    ), 
                    TextFormField(
                      controller: phoenNOController,
                      decoration: InputDecoration(
                        labelText: "Phone NO",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                      child: Text('Job Type:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.035),),
                    ), 
                    TextFormField(
                      controller: jobTypeController,
                      decoration: InputDecoration(
                        labelText: "Jobe Type",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,10,0,0),
                      child: Text('Company:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width*.035),),
                    ), 
                    TextFormField(
                      controller: companyController,
                      decoration: InputDecoration(
                        labelText: "Company",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,left: 280),
                      child: ElevatedButton(onPressed: () async{
                        // final workArea = workAreaController.value.text;
                        // final email = workAreaController.text;
                        // // final phoneNO = workAreaController.value.text;
                        // final jobType = workAreaController.text;
                        // final company = workAreaController.text;

                        // if(email.isEmpty){
                        //   return;
                        // }

                        // final Business_card model = Business_card(id: 2, email: email, jobType: jobType, company: company);
                        
                          // await dbHelper.addCard(model);
                          // print(dbHelper.getAllCard());
                          print('object');
                        
                        // Navigator.pop(context);
                        print('nth');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: blue,
                        
                      ), 
                      child: Text("Submit", style: TextStyle(fontSize: MediaQuery.of(context).size.width*.05),)),
                    )
                ],)
              )
            ],
          ),
      ),
    );
  }
}