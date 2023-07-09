import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydrip/app_colours.dart';
import 'package:mydrip/screens/explore_contra.dart';
import 'package:mydrip/screens/recommendations.dart';
import '../data_classes/contra_data.dart';

class Contraceptives extends StatefulWidget {
  const Contraceptives({Key? key}) : super(key: key);

  @override
  State<Contraceptives> createState() => _ContraceptivesState();
}

class _ContraceptivesState extends State<Contraceptives> {


  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: Hero(
          tag: "contraceptive",
          child: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.white
            ),
            backgroundColor: AppColors().appPurple,
            title: Text(
              'Contraceptives',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: Column(
          children: [

            SizedBox(height: height*.02),
            Image.asset(
              'assets/Contraception.png',
              height: width*.8,
              width: width*.8,
            ),

            SizedBox(height: height*.1),

            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecommendContra()),
                );
              },
              child: Container(
                height: height*.08,
                width: width*.9,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors().appPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Recommendation',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(height: height*.02),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExploreContra()),
                );
              },
              child: Container(
                height: height*.08,
                width: width*.9,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: AppColors().appPurple,
                      width: 1.5
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Explore Options',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColors().appPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}
