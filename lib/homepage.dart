import 'package:flutter/material.dart';
import 'package:iedc_web/sections/upevetemp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iedc_web/sections/incubation.dart';
import 'package:iedc_web/sections/collaboration_section.dart';
import 'package:iedc_web/sections/contact_section.dart';
import 'package:iedc_web/sections/ideabox_section.dart';
import 'package:iedc_web/sections/newsletter_section.dart';
import 'package:iedc_web/sections/video_hero.dart';
import 'package:iedc_web/sections/custom_footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0.0;

  // 🔹 Helper function to launch links
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, _opacity),
        leadingWidth: 300,
        leading: SizedBox(
          width: 100,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/IEDC  LOGO.png', ),
                
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "IEDC",
                    style: TextStyle(
                      color: Color.fromRGBO(15, 72, 106, 1.0),
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),

                  Text(
                    "Innovation and Entreprenuership ",
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    "Development Centre, BMCE",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              )
            ],
          ),
        ),
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  'HOME',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewsletterSection()),
                  );
                },
                child: const Text(
                  'EUREKA',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CollaborationSection()),
                  );
                },
                child: const Text(
                  'COLLABORATION',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const IdeaBoxSection()),
                  );
                },
                child: const Text(
                  'IDEABOX',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Incubation()));
                },
                child: const Text(
                  'INCUBATION',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactSection()),
                  );
                },
                child: const Text(
                  'CONTACT US',
                  style: TextStyle(
                    color: Color.fromRGBO(15, 72, 106, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.axis == Axis.vertical) {
            double offset = scrollNotification.metrics.pixels;
            setState(() {
              _opacity = (offset / 200).clamp(0, 1); // fade-in after 200px
            });
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero section with video
            const VideoHero(
  videoPath: "https://res.cloudinary.com/df2tpx1ld/video/upload/v1757951989/IMG_8344_symvha.mp4",
),


              // Black section with heading
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                height: 612,
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    const Text(
                      "Upcoming Events",
                      style: TextStyle(
                        color: Colors.amber,
                        fontFamily: "Anton",
                        fontSize: 50,
                        
                      ),
                    ),
                    const SizedBox(height: 30),
                     Upevetemp(),
                    const SizedBox(height: 30,),
                   
                  ],
                ),
              ),
 Row(mainAxisAlignment: MainAxisAlignment.center,
   children: [
     TextButton(
                          onPressed: () async {
                            await _launchUrl(
                              "https://whatsapp.com/channel/0029Vb6yfNNI7BeJhuSzYL1y",
                            );
                          },
                          child: const Text(
                            "Click to know more about Events",
                            style: TextStyle(color: Colors.amber,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.amber, ),
                          ),
                        ),
   ],
 ),
              // Vision Section
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Left side: Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "OUR VISION",
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: "Anton",
                              fontStyle: FontStyle.italic,
                              
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "To foster a culture of innovation and entrepreneurship among students, empowering them to become changemakers who create sustainable and impactful solutions for society. By providing the right guidance, mentorship, and resources, IEDC nurtures creative confidence and transforms ideas into reality. It encourages risk-taking, problem-solving, and collaboration, equipping students with the skills needed to thrive in a rapidly evolving world. The centre also bridges the gap between academia and industry, ensuring that innovations address real-world challenges. Ultimately, the vision is to inspire students to think beyond boundaries, lead with purpose, and contribute meaningfully to the nation’s growth. In this journey, IEDC organizes hands-on workshops, hackathons, and networking sessions that connect aspiring innovators with professionals and investors. By fostering a supportive ecosystem, it ensures that every student feels empowered to pursue their entrepreneurial dreams with confidence.",
                            style: TextStyle(
                                fontFamily: "Roboto",fontSize: 16, height: 1.5, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    // Right side: Image
                    Expanded(
                      child: Image.asset(
                        "assets/vision.jpg",
                        height: 350,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              // About IEDC Section
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Left side: Image
                    Expanded(
                      child: Image.asset(
                        "assets/iv.jpg",
                        height: 350,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 30),
                    // Right side: Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "ABOUT IEDC",
                            style: TextStyle(
                              fontFamily: "Anton",
                              fontSize: 32,
                              fontStyle: FontStyle.italic,
                              
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "The Innovation and Entrepreneurship Development Centre (IEDC) of BMCE serves as a dynamic platform for students to transform their creative ideas into impactful prototypes and successful startups. Through workshops, hackathons, mentoring sessions, and other initiatives, IEDC nurtures innovation, fosters entrepreneurial thinking, and empowers students to become future-ready innovators and leaders. \n\nIt encourages students from all disciplines to explore real-world problems, experiment with solutions, and gain hands-on experience in building sustainable ventures. By connecting young minds with industry experts, investors, and alumni entrepreneurs, IEDC creates a supportive ecosystem where ideas can grow into scalable businesses. Ultimately, it aims to build a culture of creativity, leadership, and self-reliance among students.",
                            style: TextStyle(
                                fontFamily: "Roboto",fontSize: 16, height: 1.5, color: Colors.white),
                          ),
                        
                        ],
                      ),
                    ),
                  ],
                ),
              ),
               Container(
               
                color: Colors.amber,
                height: 250,
                width: double.infinity,
                
                child: Column(
                  children: [
                    SizedBox(height: 12,),
                    Text("At IEDC BMCE", style: TextStyle(color: Color.fromRGBO(15, 72, 106, 1.0), fontFamily: "Caveat Brush",
                    fontSize: 40), ),
                    SizedBox(height:20 ,),
                    Row(
                      children: [
                         SizedBox(width: 50,),
                        Column(
                          children: [
                            Text("300+",style: TextStyle(color: Color.fromRGBO(15, 72, 106, 1.0),
                            fontSize: 70, height: 1.0,fontWeight: FontWeight.bold)),
                            Text("Members",style: TextStyle(color: Color.fromRGBO(15, 72, 106, 1.0),
                            fontSize: 20, height: 1.0)),
                          ],
                        ),
                        SizedBox(width: 428,),
                        Column(
                          children: [
                            Text("20+",style: TextStyle(color: Color.fromRGBO(15, 72, 106, 1.0),
                            fontSize: 70,height: 1.0,fontWeight: FontWeight.bold)),
                            Text("Events",style: TextStyle(color: Color.fromRGBO(15, 72, 106, 1.0),
                            fontSize: 20,height: 1.0)),
                          ],
                        ),
                         SizedBox(width: 428,),
                        Column(
                          children: [
                            Text("25+",style: TextStyle(color: Color.fromRGBO(15, 72, 106, 1.0),
                            fontSize: 70,height: 1.0,fontWeight: FontWeight.bold)),
                            Text("Startups",style: TextStyle(color: Color.fromRGBO(15, 72, 106, 1.0),
                            fontSize: 20,height: 1.0)),
                          ],
                        ),
                         SizedBox(width: 50,),
                      ],
                    ),
                  ],
                ),
              
                
                
              ),
              Stack(
  children: <Widget>[
    // The full-width background image
    Container(
      height: 450,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/IMG_8412.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    // The semi-transparent overlay and content
    Container(
      height: 450,
      color: Colors.black.withOpacity(0.7), // Adjust opacity as needed
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
             Text(
                    "NODAL OFFICER'S MESSAGE",
                    style: TextStyle(
                      color: Colors.amber,
                      fontFamily: "Anton",
                      fontSize: 40,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  SizedBox(height: 16),
            Row(
              children: <Widget>[
                SizedBox(width: 30),
                // The text section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     
                      Text(
                        '"At the Innovation and Entrepreneurship Development Cell (IEDC) of Baselios Mathews II College of Engineering, we strive to ignite young minds with creativity, innovation, and entrepreneurial drive. Our vision is to equip students with the skills, confidence, and opportunities to transform ideas into meaningful solutions that impact society. I encourage every student to actively engage with IEDC initiatives and be part of this journey of innovation and growth."',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 40,),
                // The image section
                Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/manojsir.JPG'),
                    ),
                    Text("Prof. Manoj Kumar", style: TextStyle(fontSize: 22,color: Colors.amber,
                    fontWeight: FontWeight.bold),),
                    Text("Nodal Officer, IEDC BMCE", style: TextStyle(fontSize: 14,color: Colors.white,
                    ),)
                  ],
                ),
                SizedBox(width: 30,),
              ],
            ),
          ],
        ),
      ),
    ),
  ],
),

 
              // Footer Section
              const CustomFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
