import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_portfolio/sections/about.dart';
import 'package:personal_portfolio/sections/contact.dart';
import 'package:personal_portfolio/sections/projects.dart';
import 'package:personal_portfolio/sections/skills.dart';
import 'package:personal_portfolio/theme/dark.dart';
import 'package:personal_portfolio/theme/light.dart';
import 'package:url_launcher/url_launcher.dart';

//declare sections
enum Sections { About, Projects, Skills, Contact }

// Declare GlobalKey to change selected section
GlobalKey<_HomeState> selected_section = GlobalKey<_HomeState>();
String theme = 'light';


// Navigation colors with defaults
late Color about_nav_color;
late Color projects_nav_color;
late Color skills_nav_color;
late Color contact_nav_color;

//idk why the theme not worked as expected
//so i'm getting the right colors manually
late Color text_color;
late Color primary_color;
late Color card_color;


//main function
Future<void> openUrl(String url_string) async {
  final Uri url = Uri.parse(url_string);
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

void main() {
  runApp(Home(key: selected_section)); // Pass GlobalKey to Home
}

class Home extends StatefulWidget {
  //this page will hold the whole app
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {
  String _selected_section = Sections.About.name;
  ThemeMode _themeMode = ThemeMode.light; // Default theme is light



  @override
  void initState() {
    super.initState();
    if(_themeMode == ThemeMode.light) {
      text_color = const Color(0xff1c1c1c);
      primary_color = const Color(0xff6750c5);
      card_color = const Color(0xfff3f3f3);
    }else{
      text_color = const Color(0xffd3d3d3);
      primary_color = const Color(0xff9a78ef);
      card_color = const Color(0xff444444);
    }
    // Initialize navigation colors
    about_nav_color = primary_color;
    projects_nav_color = text_color;
    skills_nav_color = text_color;
    contact_nav_color = text_color;
  }

  Widget getSectionWidget() {
    if (_selected_section == Sections.About.name) {
      return About();
    } else if (_selected_section == Sections.Projects.name) {
      return Projects();
    } else if (_selected_section == Sections.Skills.name) {
      return Skills();
    } else if (_selected_section == Sections.Contact.name) {
      return Contact();
    } else {
      return About();
    }
  }

  void toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
        theme = 'dark';
        //update colors
        text_color = const Color(0xffd3d3d3);
        primary_color = const Color(0xff9a78ef);
        card_color = const Color(0xff444444);
      } else {
        _themeMode = ThemeMode.light;
        theme = 'light';
        //update colors
        text_color = const Color(0xff1c1c1c);
        primary_color = const Color(0xff6750c5);
        card_color = const Color(0xfff3f3f3);
      }

      // Update navigation colors when theme changes
      about_nav_color = text_color;
      projects_nav_color = text_color;
      skills_nav_color = text_color;
      contact_nav_color = text_color;
      if (_selected_section == Sections.About.name) {
        about_nav_color = primary_color;
      } else if (_selected_section == Sections.Projects.name) {
        projects_nav_color = primary_color;
      } else if (_selected_section == Sections.Skills.name) {
        skills_nav_color = primary_color;
      } else if (_selected_section == Sections.Contact.name) {
        contact_nav_color = primary_color;
      }
    });
  }

  void navigate_to(String section) {
    setState(() {
      // Update navigation colors when theme changes
      about_nav_color = text_color;
      projects_nav_color = text_color;
      skills_nav_color = text_color;
      contact_nav_color = text_color;
      if (_selected_section == Sections.About.name) {
        about_nav_color = primary_color;
      } else if (_selected_section == Sections.Projects.name) {
        projects_nav_color = primary_color;
      } else if (_selected_section == Sections.Skills.name) {
        skills_nav_color = primary_color;
      } else if (_selected_section == Sections.Contact.name) {
        contact_nav_color = primary_color;
      }

      _selected_section = section;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 150),
              Row(
                children: [
                  Section(color: about_nav_color, name: Sections.About.name, action: () {
                    navigate_to(Sections.About.name);
                  }),
                  Section(color: projects_nav_color, name: Sections.Projects.name, action: () {
                    navigate_to(Sections.Projects.name);
                  }),
                  Section(color: skills_nav_color, name: Sections.Skills.name, action: () {
                    navigate_to(Sections.Skills.name);
                  }),
                  Section(color: contact_nav_color, name: Sections.Contact.name, action: () {
                    navigate_to(Sections.Contact.name);
                  }),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    iconSize: 25,
                    icon: SvgPicture.asset(
                      _themeMode == ThemeMode.light?'assets/icons/dark_mode.svg':'assets/icons/light.svg',
                      width: 23.0,
                      height: 23.0,
                      color: text_color,
                    ),
                    tooltip: 'Dark/Light mode',
                    onPressed: toggleTheme,
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton.icon(
                    onPressed: () async {
                      String url = "https://drive.google.com/file/d/1nJEOp0E15tc-a1A7wO9YCq3rszUTYA7r/view?usp=sharing";
                      await openUrl(url);
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/cv.svg',
                      width: 16.0,
                      height: 16.0,
                      color: text_color,
                    ),
                    label: Text(
                      "Show cv",
                      style: TextStyle(
                        color: text_color,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: card_color,
                      side: BorderSide.none,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: getSectionWidget(),
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  Section({super.key, required this.name, required this.action, required this.color});
  String name;
  Color color;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        action();  // Trigger action from Home
        selected_section.currentState?.navigate_to(name);  // Call the method of the Home class to navigate
      },
      child: Text(
        name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        foregroundColor: Theme.of(context).colorScheme.surface,
        side: BorderSide.none,
      ),
    );
  }
}
