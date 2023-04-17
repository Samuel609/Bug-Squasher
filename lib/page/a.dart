import 'package:digital_business_card/database/business_card.dart';
import 'package:digital_business_card/database/dbHelper.dart';
import 'package:flutter/material.dart';

class a extends StatefulWidget {
  const a({super.key});

  @override
  State<a> createState() => _aState();
}

class _aState extends State<a> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Business_card>?>(
      future: dbHelper.getAllCard(),
      builder: (context, AsyncSnapshot<List<Business_card>?> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        }else if (snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()),);
        }else if (snapshot.hasData){
          if(snapshot.data != null){
            return SafeArea(
              child: Scaffold(
                  body: Center(
                    child: Text("c"),
                  ),
                ),
            );
            
          }
        }
        return Scaffold(
          body: Center(child: Text("a")),
        );
      }
    );
  }
}