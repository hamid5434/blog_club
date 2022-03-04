import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        return _Category(
            left: realIndex == 0 ? 32 : 8,
            right: realIndex == categories.length - 1 ? 32 :8,
            category: categories[realIndex], context: context);
      },
      options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          viewportFraction: .8,
          aspectRatio: 1.2,
          initialPage: 0,
          disableCenter: true,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          autoPlay: true,
          scrollPhysics:const BouncingScrollPhysics(),
          enlargeStrategy: CenterPageEnlargeStrategy.height),
    );
  }

  Widget _Category(
      {required Category category,
      required BuildContext context,
      required double left,
      required double right}) {
    return Container(
      margin: EdgeInsets.only(left: left,right: right,bottom: 16),
      child: Stack(
        children: [
          Positioned.fill(

            child: Container(

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(32),
              ),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Color(0xff0d253c),
                        Colors.transparent,
                      ])),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 250,
            right: 65,
            left: 48,
            bottom: 18,
            child: Container(
              margin: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 5),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Color(0xaa0d253c),
                ),
              ]),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 32,
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
