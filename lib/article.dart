import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: InkWell(
        onTap: () {
          _showSnakBar(
            text: 'hamid',
            context: context,
          );
        },
        child: Container(
          width: 111,
          height: 48,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Theme.of(context).colorScheme.primary.withOpacity(.5),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              const SizedBox(
                width: 8,
              ),
              Text(
                '2.1',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                // pinned: true,
                // floating: true,
                title:const Text('Article'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz_rounded),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    child: Text(
                      'Four Things Every Women Needs To Know',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 32, right: 16, top: 0, bottom: 16),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.img.stories.story9
                              .image(width: 48, height: 48, fit: BoxFit.cover),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HamidReza Khoubani',
                                style:
                                    Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text('2n ago'),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.share,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.bookmark,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    ),
                    child: Assets.img.background.singlePost.image(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, top: 32, bottom: 16),
                    child: Text(
                      'A men\'s sexuality is never your mind responsibilty.',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, top: 0, bottom: 16),
                    child: Text(
                      'But In case you are running on a different browser than Chrome (e.g. Edge) and you want to keep web security enabled. You can change the default web renderer in settings in VS Code But In case you are running on a different browser than Chrome (e.g. Edge) and you want to keep web security enabled. You can change the default web renderer in settings But In case you are running on a different browser than Chrome (e.g. Edge) and you want to keep web security enabled. You can change the default web renderer in settings in VS Code But In case you are running on a different browser than Chrome (e.g. Edge) and you want to keep web security enabled. You can change the default web renderer in settings But In case you are running on a different browser than Chrome (e.g. Edge) and you want to keep web security enabled. You can change the default web renderer in settings in VS Code But In case you are running on a different browser than Chrome (e.g. Edge) and you want to keep web security enabled. You can change the default web renderer in settings But In case you are running on a different browser than Chrome (e.g. Edge) and you want to keep web security enabled. You can change the default web renderer in settings in VS Code But In case you are running on a different browser than Chrome (e.g. Edge) and you want to keep web security enabled. You can change the default web renderer in settings in VS Code But In case you are running on a different browser than Chrome (e.g. Edge) and you want to keep web security enabled. You can change the default web renderer in settings in VS Code But In case you are running on a different browser than Chrome (e.g. Edge) and you want to keep web security enabled. You can change the default web renderer in settings in VS Code But In case you are running on a different browser than Chrome (e.g. Edge) and you want to keep web security enabled. You can change the default web renderer in settings in VS Code',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
            width: MediaQuery.of(context).size.width,
            height: 116,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surface.withOpacity(.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )
            ),
          ),),
        ],
      ),
    );
  }

  void _showSnakBar({required String text, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}
