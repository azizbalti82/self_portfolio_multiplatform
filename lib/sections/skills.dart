import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        width: 800, // Global fixed width for all sections
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Languages',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 10,),
            Wrap(
              spacing: 2, // Horizontal space between items
              runSpacing: 2, // Vertical space between rows
              alignment: WrapAlignment.start, // Align items at the start
              children: [
                skillCard(name:'python',icon:'assets/icons/skills/python.svg',),
                skillCard(name:'java',icon:'assets/icons/skills/java.svg',),
                skillCard(name:'kotlin',icon:'assets/icons/skills/kotlin.svg',),
                skillCard(name:'dart',icon:'assets/icons/skills/dart.svg',),
                skillCard(name:'javaScript',icon:'assets/icons/skills/js.svg',),
                skillCard(name:'sql',icon:'assets/icons/skills/sql.svg',),
                skillCard(name:'html',icon:'assets/icons/skills/html.svg',),
              ],
            ),

            SizedBox(height: 60,),
            Text(
              'Mobile dev',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: 10,),
            Wrap(
              spacing: 2, // Horizontal space between items
              runSpacing: 2, // Vertical space between rows
              alignment: WrapAlignment.start, // Align items at the start
              children: [
                skillCard(name:'android studio',icon:'assets/icons/skills/android_studio.svg',),
                skillCard(name:'flutter',icon:'assets/icons/skills/flutter.svg',),
                skillCard(name:'jetpack',icon:'assets/icons/skills/jetpack.png',),
                skillCard(name:'xml',icon:'assets/icons/skills/xml.svg',),
                skillCard(name:'android sdk',icon:'assets/icons/skills/android.png',),
              ],
            ),

            SizedBox(height: 60,),

            Text(
              'Web scraping',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: 10,),
            Wrap(
              spacing: 2, // Horizontal space between items
              runSpacing: 2, // Vertical space between rows
              alignment: WrapAlignment.start, // Align items at the start
              children: [
                skillCard(name:'scrapy',icon:'assets/icons/skills/scrapy.png',),
                skillCard(name:'selenium',icon:'assets/icons/skills/selenium.png',),
              ],
            ),

            SizedBox(height: 60,),

            Text(
              'Backend',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: 10,),
            Wrap(
              spacing: 2, // Horizontal space between items
              runSpacing: 2, // Vertical space between rows
              alignment: WrapAlignment.start, // Align items at the start
              children: [
                skillCard(name:'node.js',icon:'assets/icons/skills/node_js.svg',),
                skillCard(name:'RESTful',icon:'assets/icons/skills/restful.png',),
                skillCard(name:'mySql',icon:'assets/icons/skills/mysql.svg',),
                skillCard(name:'MongoDB',icon:'assets/icons/skills/mongo.svg',),
                skillCard(name:'postman',icon:'assets/icons/skills/postman.svg',),
                skillCard(name:'firebase',icon:'assets/icons/skills/firebase.svg',),
              ],
            ),

            SizedBox(height: 60,),

            Text(
              'Features',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: 10,),
            Wrap(
              spacing: 2, // Horizontal space between items
              runSpacing: 2, // Vertical space between rows
              alignment: WrapAlignment.start, // Align items at the start
              children: [
                skillCard(name:'git',icon:'assets/icons/skills/git.svg',),
                skillCard(name:'anaconda',icon:'assets/icons/skills/anaconda.svg',),
                skillCard(name:'linux',icon:'assets/icons/skills/linux.svg',),
              ],
            ),

            SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}


class skillCard extends StatelessWidget {
  skillCard({required this.name,required this.icon});
  String name;
  String icon;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Card (
          color: Theme.of(context).colorScheme.surfaceContainer,
          elevation: 0,
          child: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),child: Row(
            children: [
              (icon.endsWith('svg'))? 
              SvgPicture.asset(
                icon,
                width: 30.0,
                height: 30.0,
              ) : Image.asset(icon,width: 30,height: 30,)
              
              ,
              SizedBox(width: 10,),
              Text(name)
            ],
          ),
          )
      ),
    );
  }
}