import 'package:blog_club/category_list.dart';
import 'package:blog_club/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'common/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blug Club',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StoryData> list = AppDatabase.stories;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Reza!',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 30,
                      height: 30,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Text(
                  "Explore Today's!",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              _list_stories(list: list),
              SizedBox(height: 16,),
              CategoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _list_stories({required list}) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(top: 16),
      //color: Colors.grey,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 32),
          itemBuilder: (context, index) {
            StoryData item = list[index];
            return Container(
              margin: EdgeInsets.only(top: 2,bottom: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      item.isViewed ?
                      _profile_view_viewed(imageFileName: item.imageFileName,context: context):
                      _profile_view_normal(imageFileName: item.imageFileName),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            'assets/img/icons/${item.iconFileName}',
                            width: 25,
                          )),
                    ],
                  ),
                  Text(
                    item.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _ProfileWidget({required String imageFileName}) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(18),
      child: Image.asset('assets/img/stories/${imageFileName}'),
    );
  }

  Widget _profile_view_normal({required String imageFileName}) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 1, horizontal: 4),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade400,
              Colors.blue.shade100,
            ],
            begin: Alignment.topCenter,
          )),
      child: Container(
        padding:const EdgeInsets.all(4),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child:
        _ProfileWidget(imageFileName: imageFileName),
      ),
    );
  }
  Widget _profile_view_viewed({required String imageFileName,required BuildContext context}) {
    return SizedBox(
      width: 70,
      height: 70,
      child: DottedBorder(
        radius: const Radius.circular(24),
        strokeWidth: 2.5,
        color: Theme.of(context).textTheme.bodyText2!.color!,
        borderType: BorderType.RRect,
        dashPattern: [5,3],
        padding: const EdgeInsets.all(6),
        child: Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
          ),
          child: _ProfileWidget(imageFileName: imageFileName),
        ),
      ),
    );
  }
}
