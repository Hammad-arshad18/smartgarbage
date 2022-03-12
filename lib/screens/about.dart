import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  Widget Team(
      {required name,
      required image,
      required email,
      required title,
      required context}) {
    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 90.0,
            child: Image(
              image: AssetImage(image),
              height: 100.0,
              width: 90.0,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  name,
                ),
                Text(
                  title,
                ),
                Text(
                  email,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(143, 148, 251, 1.0),
        title: Text(
          "smart garbage management".toUpperCase(),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Text(
                "About us".toUpperCase(),
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                  text:
                      'Piles of rubbish are one of the major problems faced by most people in Pakistan. '
                      'Attention should be given to the abandoned garbage both in public city areas or in places outside of town,'
                      ' such as the countryside or suburban roads. The Smart Garbage Management for sustainable city life is an automatic '
                      'garbage detection system based on image processing. It’s one of the mainly needed systems in our country. This system '
                      'represents the development of a smart garbage system to remove piles of rubbish. The system is able to detect the garbage/garbage '
                      'through the camera & also classifies the recyclable & non-Recyclable things like plastic bottles & generates alerts to Android App.'
                      ' The Web Admin panel uses a live detection of garbage/garbage by opening the camera module. The purposed method is a very efficient'
                      ' way of removing piles of rubbish from streets & different places.\n',
                  children: [
                    TextSpan(
                      text: 'Introduction\n'.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                      ),
                    ),
                    const TextSpan(
                      text:
                          'One of the biggest problems that municipalities around Pakistan have to deal with is waste management. Everyday waste leaves the homes of citizens and then arrives in the designated waste collection areas, which in turn have to be transported by waste workers to waste collection and treatment centers. Unfortunately, in this process, various problems arise which have an impact on the environment and on people’s quality of life, In Pakistan, there are a lot of things that need to solve to make Pakistan a well-developing country. This is one of the major problems that need to be solved. This makes Pakistan dirty & unhealthy for our health because that thing creates a lot of diseases which make people ill. As Countries are going smart day by day there is a need to develop the intelligent & most efficient way to solve this problem. For this problem, this system enables Pakistan to become neat & clean. The System detects garbage through cameras & generates alerts to the system. The department of Refinement sends the team to the particular area & cleans the whole garbage/garbage from that area. '
                          'This makes us safe from many of the major diseases like Malaria & Dengue caused by mosquitos.\n',
                    ),
                    TextSpan(
                      text: 'Problem Statement\n'.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                      ),
                    ),
                    const TextSpan(
                      text:
                          'Piles of garbage in Pakistan is the major issue which causes many major problems like pollution & diseases like Dengue, Malaria that causes from mosquitoes. Everyday waste leaves from home & in Pakistan, most of the time peoples throw trash in the corner of the street which mainly cause of piles of garbage. There’s a need to fill this lack in our country to make our country neat & clean.\n',
                    ),
                    TextSpan(
                      text: 'Goal\n'.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0,
                      ),
                    ),
                    const TextSpan(
                      text:
                          'Smart Garbage Management for sustainable city life is a system used to detect garbage from the streets & generates an alert to the system.  To Makes our cities clean there’s a dire need for this project. This project is better than others because the previous project that was done only detects some piece of garbage or sensors is applied in the lid of the dustbins.'
                          ' but there didn’t exist such a system that could help detect the whole accumulation of garbage.\n',
                    ),
                    const TextSpan(text: 'Hammad')
                  ],
                  style: const TextStyle(
                    color: Colors.black,
                  )),
              textAlign: TextAlign.justify,
            ),
          ),
          const Divider(
            thickness: 2.0,
            indent: 28.0,
            endIndent: 28.0,
          ),
          //  Our Team Section
          Center(
            child: Text(
              'our team'.toUpperCase(),
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Team(
            name: 'Hammad Arshad',
            image: 'assets/images/hammad.jpg',
            email: '18101001-072@uskt.edu.pk',
            title: 'Software Engineer',
            context: context,
          ),
          Team(
            name: 'Abdul Wahab',
            image: 'assets/images/Wahab.jpeg',
            email: '18101001-086@uskt.edu.pk',
            title: 'Software Engineer',
            context: context,
          ),
          Team(
            name: 'Seher Jamil',
            image: 'assets/images/seher.jpeg',
            email: '18101001-074@uskt.edu.pk',
            title: 'Software Engineer',
            context: context,
          ),
        ],
      ),
    );
  }
}
