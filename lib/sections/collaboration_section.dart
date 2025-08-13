import 'package:flutter/material.dart';

class CollaborationSection extends StatelessWidget {
  const CollaborationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
backgroundColor: Colors.black,
appBar: AppBar(
       backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white)),
        title: Text("Collaborative Platform",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
      
      ),
body: 
Center(
  child: Text("Coming Soon", style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 60,fontStyle: FontStyle.italic),)),
    );
  }
}
