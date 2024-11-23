import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          width: 650, // Global fixed width for all sections
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Intro Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hey"),
                      SizedBox(height: 15),
                      Text(
                        "I'm Aziz Balti,",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Computer science student & Mobile developer.",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 25),
                      OutlinedButton.icon(
                        onPressed: () {
                          selected_section.currentState?.navigate_to(Sections.Projects.name);  // Call the method of the Home class to navigate
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/code.svg',
                          width: 20.0,
                          height: 20.0,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        label: const Text("See Projects"),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Theme.of(context).colorScheme.surface,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 60),
                  Flexible(
                    child: Image.asset(
                      'assets/images/profil.png',
                      width: 260,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),

              // Sections
              _buildSection(
                title: "About Me",
                context: context,
                content:
                "Hello, I'm Aziz, a junior Android developer and computer science student with 6 years of coding experience. \nI love problem-solving, teamwork, and dynamic challenges. \nMy GitHub showcases my projects, reflecting adaptability and technical growth. \nOutside work, I enjoy movies, nature, and cats.",
              ),
              SizedBox(height: 70),
              Text(
                'Professional Experiences',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: 20),
              buildExperience(type:"internship",company:'Poulina group holdings',where: 'Ben arous', when: 'Juin. 2024 - Juil. 2024', content: 'During my summer internship, I worked on developing backend APIs with .NET C# and frontend interfaces with Angular. I also gained experience in designing scalable architectures and solving practical challenges.',),
              SizedBox(height: 70),
              Text(
                'Education',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: 20),
              buildEducation(
                where: "Faculty of Sciences of Sfax (FSS)",
                result:"Bachelor's Degree in Computer Science",
                when:"2022 – 2025",
              ),
              SizedBox(height: 20),
              buildEducation(
                where: "Abou Kacem Chebbi High School",
                result:"Baccalaureate in Computer Science",
                when:"2021 – 2022",
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }



  // Helper Widget for Sections
  Widget _buildSection({required BuildContext context,required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: 20),
        Text(
          content,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          softWrap: true,
        ),
      ],
    );
  }
}


// Helper Widget for Sections
class buildExperience extends StatelessWidget {
  buildExperience({required this.where, required this.when , required this.content, required this.company, required this.type});
  String where;
  String when;
  String content;
  String company;
  String type;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tag(name: type),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/company.svg',
                  width: 20.0,
                  height: 20.0,
                    color:Theme.of(context).colorScheme.onSurface
                ),
                label: Text(company),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Adjust the radius
                  ),
                )
            ),
            SizedBox(width: 10),
        OutlinedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/location.svg',
              width: 20.0,
              height: 20.0,
                color:Theme.of(context).colorScheme.onSurface
            ),
            label: Text(where),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Adjust the radius
              ),
            )
        ),
        SizedBox(width: 10),
        OutlinedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/date.svg',
              width: 20.0,
              height: 20.0,
                color:Theme.of(context).colorScheme.onSurface
            ),
            label: Text(when),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Adjust the radius
              ),
            )
        ),
      ],
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          softWrap: true,
        ),
      ],
    );
  }
}
class buildEducation extends StatelessWidget {
  buildEducation({required this.where, required this.when , required this.result});
  String where;
  String when;
  String result;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Adjust the radius
          side: BorderSide(
            width: 0.3, // Border width
          ),
        ),
      child:Container(margin: EdgeInsets.all(30),width: double.infinity,child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OutlinedButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/location.svg',
                width: 20.0,
                height: 20.0,
                  color:Theme.of(context).colorScheme.onSurface
              ),
              label: Text(where),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                backgroundColor: Theme.of(context).colorScheme.surface,
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Adjust the radius
                ),
              )
          ),
          SizedBox(height: 10),
          OutlinedButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/date.svg',
                width: 20.0,
                height: 20.0,
                  color:Theme.of(context).colorScheme.onSurface
              ),
              label: Text(when),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                backgroundColor: Theme.of(context).colorScheme.surface,
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Adjust the radius
                ),
              )
          ),
          SizedBox(height: 10),
          OutlinedButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/certificate.svg',
                width: 20.0,
                height: 20.0,
                  color:Theme.of(context).colorScheme.onSurface
              ),
              label: Text(result),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                backgroundColor: Theme.of(context).colorScheme.surface,
                foregroundColor: Theme.of(context).colorScheme.onSurface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Adjust the radius
                ),
              )
          ),
        ],
      ),)
    );
  }
}

class tag extends StatelessWidget {
  tag({required this.name});
  String name;

  @override
  Widget build(BuildContext context) {
    Color c = (name == 'internship') ? Color.fromRGBO(56, 74, 57, 1.0) // Dark green
        : (name == 'work') ? Color.fromRGBO(42, 63, 84, 1.0)       // Dark blue
        : (name == 'task') ? Color.fromRGBO(84, 46, 57, 1.0)       // Dark red
        : (name == 'freelance') ? Color.fromRGBO(84, 63, 42, 1.0)  // Dark orange
        : (name == 'certification') ? Color.fromRGBO(73, 42, 84, 1.0) // Dark purple
        : Color.fromRGBO(64, 54, 42, 1.0);
    if(theme=='light'){
      c = (name == 'internship') ? Color.fromRGBO(216, 244, 217, 1.0)
          : (name == 'work') ? Color.fromRGBO(212, 227, 243, 1.0)
          : (name == 'task') ? Color.fromRGBO(251, 213, 223, 1.0)
          : (name == 'freelance') ? Color.fromRGBO(243, 221, 209, 1.0)
          : (name == 'certification') ? Color.fromRGBO(241, 209, 243, 1.0)
          : Color.fromRGBO(239, 214, 200, 1.0);
    }



    return Card.filled(
      color: c,
      child:Padding(padding: EdgeInsets.all(7),child: Text(name,style: TextStyle(
        fontSize: 12,
      ),),)
    );
  }
}