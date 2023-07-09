import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mydrip/data_classes/forum_data.dart';

import 'data_classes/contra_data.dart';

class ProviderHandler extends ChangeNotifier{

  PageController? pageController;
  List<DateTime> monthList = [];
  List<ContraData> contraceptiveData = [
    ContraData(
        name: 'The Pill',
        sideEffects: [
          'Possible small increase in some cancers.',
          'Small reversible increase in DVTs',
          'Stroke',
          'Cardiovascular disease'
        ],
        howOften: 'Daily',
        permanent: false,
        isNeedle: false,
        accuracy: 91
    ),
    ContraData(
        name: 'IUD',
        sideEffects: [
          'Headache.',
          'Acne.',
          'Breast tenderness.',
          'Irregular bleeding',
          ' Mood changes.',
          'Cramping',
          'pelvic pain.',
        ],
        howOften: '5 years',
        permanent: false,
        isNeedle: false,
        accuracy: 99
    ),
    ContraData(
        name: 'Implant',
        sideEffects: [
          'Pain in the back or stomach area.',
          'Changes to your period',
          'Higher risk of noncancerous',
          'Lower sex drive.',
          'Dizziness.',
          'Headaches.',
          'Mild insulin resistance.',
          'Mood swings',
          'depression.',
        ],
        howOften: '3-5 years',
        permanent: false,
        isNeedle: true,
        accuracy: 99
    ),
    ContraData(
        name: 'Injection',
        sideEffects: [
          'Weight gain',
          'Headaches',
          'Mood swings',
          'Breast tenderness',
          'Irregular bleeding'
        ],
        howOften: '2-3 months',
        permanent: false,
        isNeedle: true,
        accuracy: 97
    ),
    ContraData(
        name: 'Emergency pill',
        sideEffects: [
          'Nausea or vomiting.',
          'Dizziness.',
          'Fatigue.',
          'Headache.',
          'Breast tenderness.',
          'Heavier menstrual bleeding.',
          'Lower abdominal pain'
        ],
        howOften: '72 hours',
        permanent: false,
        isNeedle: false,
        accuracy: 95
    ),
    ContraData(
        name: 'Internal condom',
        sideEffects: [
          'None',
        ],
        howOften: 'Everytime',
        permanent: false,
        isNeedle: false,
        accuracy: 95
    ),
    ContraData(
        name: 'Patch',
        sideEffects: [
          'Blood-clotting',
          'Heart attack',
          'Stroke',
          'Liver cancer',
          'Gallbladder disease',
          'High blood pressure',
          'Skin irritation.',
          'Breast tenderness.',
          'Menstrual pain.',
          'Headaches.',
          'Nausea or vomiting.',
          'Abdominal pain.'
        ],
        howOften: '3 Weeks',
        permanent: false,
        isNeedle: false,
        accuracy: 99
    ),
  ];

  List<ForumData> forumData = [
    ForumData(
        questionTitle: 'Sex after morning after pill?',
        questionDescription: 'I took the morning after pill and then had unprotected sex. It is possible that I might be pregnant?',
        dateTime: DateTime.now(),
        answers: [
          'The answer is yes, you may be pregnant. Emergency contraception like '
              'the morning after pill is 85% effective if taken with certain time '
              'limits, that is, pregnancy can be avoided if you take it within '
              '72 hours (3 days) of unsafe sex. What does it mean? Well, it means '
              'that if you engage into sexual intercourse again a few days later, you are unprotected.',
          'I had unprotected sex last week (I don’t remember the exact day, must be thursday or something) '
              'and we did the pull out method. My menstruation normally is on the '
              'first week of the month so I don’t know if I could get pregnant',
          'Hello friend, I am here for you to provide valuable information to '
              'overcome this horrible problem in your life. I am one of the lucky'
              ' women who defeat this difficult situation in my life just one year ago. '
              'This is golden opportunity to help you overcome this horrible problem on '
              'behalf of my personal life experience. It is not easy task to handle this '
              'difficult situation without stress and depression. '

        ],
        forumLikes: 10
    ),
    ForumData(
        questionTitle: 'Effects of antibiotics on birth control methods',
        questionDescription: '...',
        dateTime: DateTime.now(),
        answers: [
          'Hello there, I’m currently taking antibiotics because of a bladder infection… '
              'I didn’t tell my doctor I was on birth control pills, and '
              'today I’ve been told I could get pregnant because antibiotics make '
              'the pills less effective. My boyfriend ejaculated inside of me, but '
              'today it’s too late for me to take the morning-after pill… Don’t know '
              'what to do!!! Freaking out now… What can I do to avoid falling pregnant?',

          'Not every antibiotic drug has the same effects on contraceptives, '
              'so it is important for you to visit your doctor and see which antibiotic '
              'could compromise the effectiveness of the contraceptive you’re using. '
              'Antibiotics can affect the absorption of oral contraceptive; therefore,'
              ' you should use a barrier method such as the condom while on antibiotics.',

          'Hi dear. Till now the only antibiotic proven to impact birth control pills'
              ' is rifampin. This drug is used to treat tuberculosis and other '
              'bacterial infections. If you take this medication while using birth '
              'control pills, it decreases the hormone levels in your birth control '
              'pills. This decrease in hormone levels can affect whether ovulation '
              'is prevented. In other words, your birth control becomes less effective.'
              ' Rifampin also decreases hormone levels in the birth control patch and '
              'vaginal ring. '

        ],
        forumLikes: 19
    ),
  ];

  ContraData? myContraception;

  String userId = 'userid';
  DateTime selectedDate = DateTime.now();

  changeDate(DateTime dateTime){
    selectedDate = dateTime;

    pageController!.animateToPage(
        monthList.indexWhere((date) {
          return DateFormat("MM/yyyy").format(date) == DateFormat("MM/yyyy").format(dateTime);
        }),
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear
    );
    notifyListeners();
  }
  addFirstLastMonths(List<DateTime> data){
    monthList = data;
  }

  saveContraception(ContraData data){
    myContraception = data;
    notifyListeners();
  }
}