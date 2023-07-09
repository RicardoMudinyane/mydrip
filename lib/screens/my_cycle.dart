import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colours.dart';
import 'contraceptives.dart';

class MyCycle extends StatelessWidget {
  const MyCycle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){

            },
            child: Container(
                height: height*.12,
                width: width*.9,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: AppColors().appPink,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Track Your Cycle\n',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'Get Started',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Positioned(
                        right: -10,
                        top: -15,
                        child: Image.asset(
                          'assets/period.png',
                          height: height*.12,
                          width: height*.12,
                        )
                    )
                  ],
                )
            ),
          ),

          SizedBox(height: height*.02),
          const Divider(
            height: 5,
            color: Colors.transparent,
          ),
          SizedBox(height: height*.02),

          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Contraceptives()),
              );
            },
            child:  Hero(
              tag: 'contraceptive',
              child: Container(
                  height: height*.12,
                  width: width*.9,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: AppColors().appPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Contraceptives\n',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Get Started',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.white30,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Positioned(
                          right: -10,
                          top: -15,
                          child: Image.asset(
                            'assets/contraceptive.png',
                            height: height*.12,
                            width: height*.12,
                          )
                      )
                    ],
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
