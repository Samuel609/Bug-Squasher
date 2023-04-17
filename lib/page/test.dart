import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:digital_business_card/database/dbHelper.dart';

import '../database/business_card.dart';

class test extends StatefulWidget {
   const test({super.key});

  @override
  State<test> createState() => _testState();
  
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    final _emailcontroller = TextEditingController();
    final _jobcontroller = TextEditingController();
    final _companycontroller = TextEditingController();
    final Business_card? business_card;
    return Scaffold(
      body: Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          

          
          Container(
            child: TextField(
              controller: _emailcontroller,
            ),
            padding: EdgeInsets.all(32),
          ),
          Container(
            child: TextField(
              controller: _jobcontroller,
            ),
            padding: EdgeInsets.all(32),
          ),
          Container(
            child: TextField(
              controller: _companycontroller,
            ),
            padding: EdgeInsets.all(32),
          ),

          Container(
            width: 200,
            child: TextButton(child: 
            Text("click"),
            onPressed: () async {
             // final workArea = workAreaController.value.text;
              final email = _emailcontroller.text;
              // final phoneNO = workAreaController.value.text;
              final jobType = _jobcontroller.text;
              final company = _companycontroller.text;

              if(email.isEmpty){
                return;
              }

              final Business_card model = Business_card(id: 1, email: email, jobType: jobType, company: company);
              
                await dbHelper.addCard(model);
                print(await dbHelper.getAllCard());
                Navigator.pushNamed(context, '/a');
                
            },)
          ),
        ],
      )),
    );
  }
}