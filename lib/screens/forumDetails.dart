import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydrip/app_colours.dart';
import 'package:mydrip/data_classes/forum_data.dart';

class ForumDetails extends StatelessWidget {
  final ForumData forumData;
  const ForumDetails({Key? key, required this.forumData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Forum',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [

            SizedBox(
              height: height*.025,
            ),

            ListTile(
              title: Text(
                forumData.questionTitle,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                forumData.questionDescription,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),



            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: forumData.answers.map((answer) {
                return ListTile(
                  leading: Container(
                    width: width*.15,
                    height: width*.15,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      color: AppColors().appGrey,
                    ),
                  ),
                  title: Text(
                    answer,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(
              height: height*.1,
            ),

          ],
        ),
      ),
    );
  }
}
