import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';

bool _isFlipbookRegistered = false;

class NewsletterSection extends StatelessWidget {
  const NewsletterSection({super.key});

  @override
  Widget build(BuildContext context) {
    const String viewID = 'newsletter-flipbook';

    if (!_isFlipbookRegistered) {
      ui.platformViewRegistry.registerViewFactory(viewID, (int viewId) {
        final iframe = html.IFrameElement()
          ..src = 'https://online.fliphtml5.com/vaxbbp/iipw/'
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '600px';
        return iframe;
      });
      _isFlipbookRegistered = true;
    }

    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
       backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.black)),
        title: Text("Eureka",style: TextStyle(color: Color.fromRGBO(15, 72, 106, 1.0),fontWeight: FontWeight.bold)),
        actions: [
          TextButton(onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsletterSection()));
          },
           child: Text('EUREKA',style: TextStyle(color: Colors.black),)),

           TextButton(onPressed:() {},
           child: Text('COLLABORATION',style: TextStyle(color: Colors.black),)),

           TextButton(onPressed:() {},
           child: Text('IDEABOX',style: TextStyle(color: Colors.black),)),

           TextButton(onPressed:() {},
           child: Text('TEAM',style: TextStyle(color: Colors.black),)),

           TextButton(onPressed:() {},
           child: Text('CONTACT US',style: TextStyle(color: Colors.black),)),
        ],
      ),
      body: SingleChildScrollView( // ✅ Added scroll view
  child: Padding(
    padding: const EdgeInsets.all(40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 600,
          child: HtmlElementView(viewType: viewID),
        ),
      ],
    ),
  ),
),

    );
  }
}
