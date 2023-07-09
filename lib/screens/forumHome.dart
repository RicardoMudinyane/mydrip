import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydrip/screens/forumDetails.dart';
import 'package:provider/provider.dart';

import '../app_colours.dart';
import '../provider_handler.dart';

class ForumHome extends StatelessWidget {
  ForumHome({Key? key}) : super(key: key);

   final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
        width: 1.5,
        color: AppColors().appPinkLight
    ),
  );

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ProviderHandler>(
        builder: (ctx, value, child){
          return Container(
            width: width,
            height: height,
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width*.1,
                      vertical: height*.05
                  ),
                  child: Text(
                    'Learn, Answer and Explore',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),

                TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.text,
                  style:  GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search something ...',
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      size: 22,
                      color: AppColors().appGrey,
                    ),
                    border: border,
                    enabledBorder: border,
                    filled: true,
                    contentPadding: const EdgeInsets.all(16),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: height*.05),

                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: value.forumData.map((forum){
                    return Container(
                      width: width*.9,
                      height: height*.2,
                      padding: EdgeInsets.only(
                        top: width*.05,
                        left: width*.02,
                        right: width*.02,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12.withOpacity(.05),
                                blurRadius: 15,
                                spreadRadius: 1
                            )
                          ],
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  forum.questionTitle,
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  forum.questionDescription,
                                  maxLines: 2,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis
                                    ),
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ForumDetails(
                                      forumData: forum)),
                                );
                              },
                              child: Text(
                                'Join Forum',
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text(
          'Ask a question',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12
          ),
        ),
        icon: const Icon(
          Icons.question_mark_rounded,
          color: Colors.white,
        ),
        backgroundColor: AppColors().appPinkLight,
      ),
    );
  }
}
