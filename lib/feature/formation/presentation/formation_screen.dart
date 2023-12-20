import 'package:LASYLAB/core/components/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/components/images.dart';
import '../model/mocks/fake_formations.dart';

class FormationScreen extends StatefulWidget {
  static const routeName = "/formation";

  const FormationScreen({super.key});

  @override
  State<FormationScreen> createState() => _FormationScreenState();
}

class _FormationScreenState extends State<FormationScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 2,
        backgroundColor: Colors.white,
        leadingWidth: screenSize.width * .3,
        leading: Padding(
          padding: EdgeInsets.only(left: screenSize.width * .05),
          child: Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/profil");
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(Images.star),
                ),
              ),
              Text(
                "2",
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset(Images.app_ruby),
              ),
              Text(
                "2",
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("/profil");
              },
              child: CircleAvatar(
                child: Image.asset("assets/images/avatar.png"),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 32),
        children: [
          Text(
            'APPRENDRE LES METIERS DU FUTURS',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 22, top: 10),
            padding: EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppTheme.formationCardColor,
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              'Cours , vidéos apprendre mieux en prenant differemment',
              textAlign: TextAlign.center,
            ),
          ),
          Wrap(
            children: [
              ...['Developpeur web', 'Infographie'].map((e) => Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                margin: EdgeInsets.only(right:8, bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color:AppTheme.borderColor, width: 1 )),child: Text(e, style: Theme.of(context).textTheme.bodyLarge,),))
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 48,
                crossAxisCount: 2,
                childAspectRatio:
                MediaQuery.of(context).size.aspectRatio + .35),
            itemCount: 17,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {

                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(maxHeight: 100),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(17)),
                        child: Image.asset(Images.formation),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        fakeFormations[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Row(
                        children: [
                        ...List.generate((fakeFormations[index].rating).toInt(), (index) =>  Icon(Icons.star,
                              size: 16,
                              color: AppTheme.warningColor)) ,
                          const SizedBox(width: 6),
                          Text(
                            '${fakeFormations[index].rating} / 5',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                             ,
                          ),
                        ],
                      ),
                      Text('${fakeFormations[index].price} F', style: TextStyle(fontWeight: FontWeight.bold),),
                    ]),
              );
            },
          ),
        ],
      ),
    );
  }
}
