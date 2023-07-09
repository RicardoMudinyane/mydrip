import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydrip/data_classes/contra_data.dart';
import 'package:mydrip/provider_handler.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../app_colours.dart';

class ExploreContra extends StatefulWidget {
  const ExploreContra({Key? key}) : super(key: key);

  @override
  State<ExploreContra> createState() => _ExploreContraState();
}

class _ExploreContraState extends State<ExploreContra> {

  ContraData selectedContra = ContraData(
      name: '',
      sideEffects: [],
      howOften: '',
      permanent: false,
      isNeedle: false,
      accuracy: 0
  );
  PanelController controller = PanelController();

  TextStyle question = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors().appPink
  );
  TextStyle answer = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black
  );

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SlidingUpPanel(
        minHeight: 0,
        maxHeight: height*.8,
        backdropEnabled: true,
        renderPanelSheet: false,
        controller: controller,
        panel: Container(
          height: height*.8,
          padding: EdgeInsets.symmetric(
            vertical: height*.02
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0)
            ),
          ),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Name
                  Text(
                      '${selectedContra.name}\n\n',
                      style: question.copyWith(
                          fontSize: 14,
                          color: AppColors().appPurple,
                        decoration: TextDecoration.none
                      )
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Effectiveness\n',
                            style: answer
                        ),
                        TextSpan(
                          text:'${selectedContra.accuracy}%\n\n',
                          style: question
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'How Often\n',
                            style: answer
                        ),
                        TextSpan(
                            text:'${selectedContra.howOften}\n\n',
                            style: question
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),


                  Text(
                      'Side Effects',
                      style: answer.copyWith(
                          decoration: TextDecoration.none
                      )
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: selectedContra.sideEffects.map((effect){
                      return Text(
                          '$effect\n',
                          textAlign: TextAlign.center,
                          style: question.copyWith(
                            decoration: TextDecoration.none
                          )
                      );
                    }).toList(),
                  )
                ],
              ),

              SizedBox(height: height*.05),
              Material(
                child: InkWell(
                  onTap: (){
                    context.read<ProviderHandler>().saveContraception(selectedContra);
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.success(
                        message:
                        "Contraception Added",
                      ),
                    );
                    controller.close();
                  },
                  child: Container(
                    height: height*.08,
                    width: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors().appPurple,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Text(
                      'Add to Calendar',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      body: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(
                color: Colors.white
            ),
            backgroundColor: AppColors().appPurple,
            title: Text(
              'Explore',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          body: Consumer<ProviderHandler>(
            builder: (ctx, value, child){
              return Container(
                width: width,
                height: height,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: width*.025,
                ),
                child: ListView(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: width*.025,
                      spacing: width*.025,
                      children: value.contraceptiveData.map((data){
                        return Container(
                          width: width*.98,
                          height: height*.1,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors().appPinkLight,
                          ),
                          child: ListTile(
                            onTap: (){
                              setState(()=> selectedContra = data);
                              if(controller.isAttached){
                                controller.open();
                              }
                              else{ }
                            },
                            title: Text(
                              data.name,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: AppColors().appGrey,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            subtitle: Text(
                              data.howOften,
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                )
              );
            },
          )
      )
    );
  }
}
