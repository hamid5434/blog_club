

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_list.dart';
import 'data.dart';
import 'gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StoryData> list = AppDatabase.stories;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                    Assets.img.icons.notification.image(width: 30,height: 35)
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
              const SizedBox(
                height: 16,
              ),
              const CategoryList(),
              PostList(),
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
          physics: const BouncingScrollPhysics(),
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 32),
          itemBuilder: (context, index) {
            StoryData item = list[index];
            return Container(
              margin: const EdgeInsets.only(top: 2, bottom: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      item.isViewed
                          ? _profile_view_viewed(
                          imageFileName: item.imageFileName,
                          context: context)
                          : _profile_view_normal(
                          imageFileName: item.imageFileName),
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
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
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
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: _ProfileWidget(imageFileName: imageFileName),
      ),
    );
  }

  Widget _profile_view_viewed(
      {required String imageFileName, required BuildContext context}) {
    return SizedBox(
      width: 70,
      height: 70,
      child: DottedBorder(
        radius: const Radius.circular(24),
        strokeWidth: 2.5,
        color: Theme.of(context).textTheme.bodyText2!.color!,
        borderType: BorderType.RRect,
        dashPattern: [5, 3],
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

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PostData> posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                onPressed: () {},
                child: Text('More'),
              ),
            ],
          ),
        ),
        ListView.builder(
            itemCount: posts.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              PostData post = posts[index];
              return Container(
                height: 149,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1a5282ff),
                        blurRadius: 10,
                      )
                    ]),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/img/posts/small/${post.imageFileName}',
                        width: 149,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.caption,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                color: Theme.of(context).primaryColorDark,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              post.title,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  CupertinoIcons.hand_thumbsup,
                                  size: 16,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  post.likes,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  CupertinoIcons.clock,
                                  size: 16,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  post.time,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      post.isBookmarked
                                          ? CupertinoIcons.bookmark_fill
                                          : CupertinoIcons.bookmark,
                                      size: 16,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
        const SizedBox(
          height: 64,
        ),
      ],
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: const Color(0x009b8487).withOpacity(.3),
                  blurRadius: 20,
                )
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    title: 'Home',
                    ActiveIconFileName: 'Home.png',
                    iconFileName: 'Home.png',
                  ),
                  BottomNavigationItem(
                    title: 'Article',
                    ActiveIconFileName: 'Articles.png',
                    iconFileName: 'Articles.png',
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  BottomNavigationItem(
                    title: 'Search',
                    ActiveIconFileName: 'Search.png',
                    iconFileName: 'Search.png',
                  ),
                  BottomNavigationItem(
                    title: 'Menu',
                    ActiveIconFileName: 'Menu.png',
                    iconFileName: 'Menu.png',
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: const Color(0xff376aed),
                    borderRadius: BorderRadius.circular(32.5),
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Assets.img.icons.plus.image()
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String ActiveIconFileName;
  final String title;

  const BottomNavigationItem({
    Key? key,
    required this.iconFileName,
    required this.ActiveIconFileName,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileName'),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}
