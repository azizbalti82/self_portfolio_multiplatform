import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/project.dart';
import '../main.dart';

class Projects extends StatefulWidget {
  //this page will hold the whole app
  const Projects({super.key});
  @override
  State<Projects> createState() => Projects_state();
}

class Projects_state extends State<Projects> {
  String selected_filter = 'all';
  //functions
  void filter(String filter){
    setState(() {
      selected_filter = filter;
    });
  }
  Widget filterButton(String type) {
    if (type.toLowerCase() != selected_filter){
      return OutlinedButton(
        onPressed: () {
          setState(() {
            selected_filter = type.toLowerCase();
          });
        },
        child: Text(type,style: TextStyle(
            fontSize: 13
        ),), // Removed the const, as `type` is a variable
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Adjust the radius
          ),
        ),
      );
    }else {
      return OutlinedButton(
        onPressed: () {
          setState(() {
            selected_filter = type.toLowerCase();
          });
        },
        child: Text(type,style: TextStyle(
            fontSize: 13
        ),), // Removed the const, as `type` is a variable
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          foregroundColor: Theme.of(context).colorScheme.surface,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Adjust the radius
          ),
        ),
      );
    }
  }

  //widget code
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child:Container(
          width: 800,
          margin: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'My recent projects',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),Text(
                          '   (${projects.length})',
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        )
                      ],
                    )
                    ,
                    SizedBox(height: 30),
                    Wrap(
                      spacing: 2, // Horizontal space between items
                      runSpacing: 2, // Vertical space between rows
                      alignment: WrapAlignment.start, // Align items at the start
                      children: [
                        filterButton('All'),
                        SizedBox(width: 5),
                        filterButton('Mobile'),
                        SizedBox(width: 5),
                        filterButton('Web'),
                        SizedBox(width: 5),
                        filterButton('Desktop'),
                        SizedBox(width: 5),
                        filterButton('machine learning'),
                        SizedBox(width: 5),
                        filterButton('api'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 50), // Add space between title and projects
              Container (
                width: 1000,
                child:projects
                    .where((project) => selected_filter == 'all' || project['types'].contains(selected_filter))
                    .toList()
                    .isEmpty
                    ? Container(
                      margin:EdgeInsets.symmetric(vertical: 50),
                      child:Center(
                          child: Text("There is no projects yet")
                      ) ,
                    ) :Wrap(
                  spacing: 35, // Horizontal space between items
                  runSpacing: 25, // Vertical space between rows
                  alignment: WrapAlignment.start, // Align items at the start
                  children: projects
                      .where((project) => selected_filter == 'all' || project['types'].contains(selected_filter))
                      .map((project) {
                    return ProjectCard(
                      title: project['title'],
                      types: project['types'],
                      image: project['image'],
                      url: project['url'],
                      in_progress: project['in_progress'],
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        )
    );
  }
}


class ProjectCard extends StatelessWidget {
  ProjectCard({required this.title, required this.types, required this.url,required this.image,required this.in_progress});
  final List<String> types;
  final String title;
  final String image;
  final String url;
  final bool in_progress;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 11,
      child: Container(
        width: 170,
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensures the card size adapts to content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    (in_progress) ? Text(
                      "ongoing",
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant
                      ),
                    ) : Text('')
                  ],
                ),

                SizedBox(height: 5),
                tag(types:types),
                SizedBox(height: 5),
              ],
            ),
            // Image widget with constraints
            Container(// Match the width of the image
               // Match the height of the image
              margin: EdgeInsets.symmetric(vertical: 7),
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface, // Border color
                  width: 0.4,         // Border width
                ),
                borderRadius: BorderRadius.circular(8.0), // Optional: For rounded borders
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0), // Match with border radius if used
                child: Image.asset(
                  image,
                  fit: BoxFit.contain, // Ensures the image fits within bounds
                ),
              ),
            ),
            (url.isNotEmpty) ? OutlinedButton.icon(
              onPressed: () async {
                await openUrl(url);
              },
              icon: SvgPicture.asset(
                'assets/icons/share.svg',
                width: 17.0,
                height: 17.0,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              label: const Text('open github',style: TextStyle(
                fontSize: 14
              ),),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ) : OutlinedButton(
              onPressed: () async {
                await openUrl(url);
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text("unavailable link",style: TextStyle(
                  fontSize: 14
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
class tag extends StatelessWidget {
  tag({required this.types});
  List<String> types;

  @override
  Widget build(BuildContext context) {
    List<Widget> tags = [];

    for(String type in types){
      Color c = (type == 'mobile') ? Color.fromRGBO(60, 70, 60, 1.0)  // Dark greenish tone
          : (type == 'web') ? Color.fromRGBO(50, 60, 75, 1.0)   // Dark blueish tone
          : (type == 'machine learning') ? Color.fromRGBO(85, 60, 70, 1.0)  // Dark reddish tone
          : (type == 'desktop') ? Color.fromRGBO(80, 60, 55, 1.0)  // Dark brownish tone
          : (type == 'api') ? Color.fromRGBO(90, 60, 90, 1.0)   // Dark purplish tone
          : Color.fromRGBO(85, 60, 55, 1.0);  // Default dark tone

      if(theme == 'light'){
        c = (type == 'mobile') ? Color.fromRGBO(216, 244, 217, 1.0)
            : (type == 'web') ? Color.fromRGBO(212, 227, 243, 1.0)
            : (type == 'machine learning') ? Color.fromRGBO(251, 213, 223, 1.0)
            : (type == 'desktop') ? Color.fromRGBO(243, 221, 209, 1.0)
            : (type == 'api') ? Color.fromRGBO(241, 209, 243, 1.0)
            : Color.fromRGBO(239, 214, 200, 1.0);
      }

      Widget tag = Card.filled(
          color: c,
          child:Padding(
            padding: EdgeInsets.all(5),
            child: Text(type,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          )
      );
      tags.add(tag);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tags,
    );
  }
}