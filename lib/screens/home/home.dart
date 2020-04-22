import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:nightlife/const/const.dart';
import 'package:nightlife/models/categories.dart';
import 'package:nightlife/repositories/repositories.dart';
import 'package:nightlife/screens/app_state.dart';
import 'package:nightlife/screens/home/widgets/home_page_background.dart';
import 'package:nightlife/screens/home/widgets/widgets.dart';
import 'package:nightlife/models/models.dart';
import 'package:nightlife/services/auth.dart';
import 'package:nightlife/services/db.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Club>>.value(
      // TODO: Change this to the DB Service that gets all Clubs
//      value: DatabaseService(),
      value: null,
      child: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Scaffold(
          backgroundColor: AppColors.BACKGROUND_COLOR,
          body: Stack(
            children: <Widget>[
              HomePageBackground(
                  screenHeight: MediaQuery.of(context).size.height),
              SafeArea(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              AppText().homeScreenTopText,
                              style: fadedTextStyle,
                            ),
                            Spacer(),
                            // TODO: MAKE IN A FLATBUTTON.ICON
                            Icon(
                              Icons.person_outline,
                              color: AppColors.WHITE60_TEXT_COLOR,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          AppText().homeScreenWelcomeText,
                          style: whiteHeadingTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Consumer<AppState>(
                          builder: (context, appState, _) =>
                              SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                for (final category in categories)
                                  CategoryWidget(category: category)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 0.0),
                        child: FutureBuilder(
                            future: Future.wait([
                              Worker().fetchClubs(http.Client()),
                              Worker().fetchImages(http.Client()),
                            ]),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                    child: ListViewForClubs(
                                  clubs: snapshot.data[0],
                                  clubsImages: snapshot.data[1],
                                ));
                              }
                              return Text("${snapshot.error}");
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
