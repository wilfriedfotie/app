import 'package:LASYLAB/core/components/images.dart';
import 'package:LASYLAB/feature/courses/presentation/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../components/fancy_button.dart';
import '../../../../core/components/styling.dart';
import '../../../../core/gap.dart';
import '../../../../views/fees_welcome.dart';

class ChooseStrongTopics extends StatefulWidget {
  static String routeName = "/chooseStrongTopics";

  const ChooseStrongTopics({Key? key}) : super(key: key);

  @override
  State<ChooseStrongTopics> createState() => _ChooseStrongTopicsState();
}

class _ChooseStrongTopicsState extends State<ChooseStrongTopics> {
  int totalItems = 3, currentItem = 1;

  bool isPricePage = false;


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: HexColor("#AFAFAF"), size: 40),
        ),
        title: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: screenSize.width * 0.9,
          height: 9,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: LinearProgressIndicator(
              value: currentItem / totalItems,
              valueColor: AlwaysStoppedAnimation<Color>(
                AppTheme.primaryColor,
              ),
              backgroundColor: HexColor("#E5E5E5"),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          gapH18,
          SvgPicture.asset(Images.masquotte),
          gapH18,
          if (currentItem == 1) _ItemOne(),
          if (currentItem == 2) _ItemTwo(),
          if (currentItem == 3 && !isPricePage) ...[
            Text(
              "C'est parti",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            gapH64,
            Container(
              alignment: Alignment.center,
              child: FancyButton(
                horzPadding: 50,
                onPressed: () {
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
                child: Center(
                  child: Text("Essayer lasylab",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.whiteColor)),
                ),
              ),
            ),
            gapH18,
            Container(
              alignment: Alignment.center,
              child: FancyButton(
                horzPadding: 50,
                color: AppTheme.secondaryLightBg,
                onPressed: () {
                  setState(() {
                    isPricePage = !isPricePage;
                  });
                },
                child: Center(
                  child: Text("Paye ton abonnment",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.whiteColor)),
                ),
              ),
            ),
          ],
          if (currentItem == 3 && isPricePage) WelcomeFees(),
          gapH64,
          Visibility(
            visible: currentItem <= 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 70),
              child: FancyButton(
                size: 18,
                onPressed: () {
                  if (currentItem < totalItems) {
                    setState(() {
                      currentItem++;
                    });
                  }
                },
                child: Center(
                    child: Text(
                  'Continuer',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.whiteColor),
                )),
                color: AppTheme.primaryColor,
              ),
            ),
          ),
          if (currentItem == 3 && !isPricePage) gapH64,
          if (currentItem == 3)
            Text(
              "Pour plus infos appel ou écris au 677518862",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          gapH64
        ],
      ),
    );
  }
}

class _ItemOne extends StatefulWidget {
  const _ItemOne({super.key});

  @override
  State<_ItemOne> createState() => _ItemOneState();
}

class _ItemOneState extends State<_ItemOne> {
  List<String> courses = [
    "mathématique",
    "science",
    "francais",
    "philosophie",
    "physique"
  ];

  List<String> selectedCourse = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Dans quelle matiere rencontres tu des difficultés ?',
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        gapH14,
        Wrap(
          children: courses
              .map((e) => Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: FancyButton(
                      size: 18,
                      duration: const Duration(milliseconds: 160),
                      onPressed: () {
                        if (selectedCourse.contains(e)) {
                          selectedCourse.remove(e);
                        } else {
                          selectedCourse.add(e);
                        }
                        setState(() {});
                      },
                      child: Center(
                          child: Text(
                        e,
                        style: TextStyle(fontSize: 22),
                      )),
                      color: selectedCourse.contains(e)
                          ? AppTheme.secondaryLightBg
                          : AppTheme.whiteColor,
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _ItemTwo extends StatefulWidget {
  const _ItemTwo({super.key});

  @override
  State<_ItemTwo> createState() => _ItemTwoState();
}

class _ItemTwoState extends State<_ItemTwo> {
  List<String> targetsList = [
    "Augmenter mes notes",
    "Réussir mon examen",
    "Comprendre les notions compliquées",
    "Améliorer mon niveau"
  ];
  List<String> selectedTargetsList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Quel est  ton objectif cette année scolaire ?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        gapH14,
        Wrap(
          children: targetsList
              .map((e) => Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: FancyButton(
                      size: 18,
                      duration: const Duration(milliseconds: 160),
                      onPressed: () {
                        if (selectedTargetsList.contains(e)) {
                          selectedTargetsList.remove(e);
                        } else {
                          selectedTargetsList.add(e);
                        }
                        setState(() {});
                      },
                      child: Center(
                          child: Text(
                        e,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22),
                      )),
                      color: selectedTargetsList.contains(e)
                          ? AppTheme.secondaryLightBg
                          : AppTheme.whiteColor,
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
