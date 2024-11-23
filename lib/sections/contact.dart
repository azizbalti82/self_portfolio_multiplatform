import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        margin: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        width: 600, // Global fixed width for all sections
        child: Column(
            children: [
              Text(
                "Follow me",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 60,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  socialMediaCard(username:"azizbalti.dev@gmail.com",qr_code:"assets/images/qr_code_email.svg",),
                  SizedBox(width: 17,),
                  socialMediaCard(username:"@aziz-balti",qr_code:"assets/images/qr_code_linkedin.svg",),
                  SizedBox(width: 17,),
                  socialMediaCard(username:"@azizbalti82",qr_code:"assets/images/qr_code_github.svg",),
                ],
              )
            ]
        ),
      ) ,
    );

  }
}


class socialMediaCard extends StatelessWidget {
  socialMediaCard({required this.username,required this.qr_code});
  String username;
  String qr_code;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainer,
      elevation: 4,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0), // SVG corners
            child: SvgPicture.asset(
              qr_code,
              width: 180.0,
              height: 180.0,
            ),
          ),
        ],
      ),
    );
  }
}