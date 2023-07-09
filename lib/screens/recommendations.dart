import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydrip/app_colours.dart';

class RecommendContra extends StatelessWidget {
  const RecommendContra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors().appPurple,
        title: Text(
          'Questionnaire',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color:  Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
            onPressed: ()=> Navigator.pop(context),
            icon: const Icon(
              Icons.clear_rounded,
              color: Colors.white,
            )
        ),
      ),
      body: Container(
        width: width,
        height: height,
        alignment: Alignment.center,

        child: Stack(
          children: [
            Align(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width*.02),
                    alignment: Alignment.center,
                    child: Text(
                      'Do you require a joint contraceptive that also protects you from other STD’s',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width*.02),
                    alignment: Alignment.center,
                    child: Text(
                      'Should it be effective over a long-term, short-term or permanent',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width*.02),
                    alignment: Alignment.center,
                    child: Text(
                      'Consider the convenience and affordability',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width*.02),
                    alignment: Alignment.center,
                    child: Text(
                      'Will you be able to use the contraceptive consistently and effectively',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width*.02),
                    alignment: Alignment.center,
                    child: Text(
                      'Do you require a method that needs less effort',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: AppColors().appPurple,
                    child: Text(
                      'Our Recommended Contraception For you isa \n'
                          'Patch',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: width*.03,
                  bottom: width*.03
                ),
                child: Container(
                  width: width*.35,
                  height: height*.065,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors().appPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Next',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            )
          ],
        )
      ),
    );
  }
}
