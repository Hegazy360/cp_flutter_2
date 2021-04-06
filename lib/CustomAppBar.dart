import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.white,
          ),
          child: IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          )),
      actions: [
        Container(
            width: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.article_outlined,
                color: Colors.black,
              ),
            ))
      ],
      elevation: 0,
      expandedHeight: 350.0,
      toolbarHeight: 60,
      floating: false,
      pinned: true,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(0),
          centerTitle: true,
          title: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.transparent, Colors.white],
                    ).createShader(bounds);
                  },
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                  ),
                  blendMode: BlendMode.dstATop,
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 17),
                    child: Text("Colorful pancakes",
                        style: TextStyle(
                            color: Color(0xFF161531),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700)),
                  )),
            ],
          ),
          background: Image.asset(
            "assets/images/pancakes.png",
            fit: BoxFit.cover,
          )),
    );
  }
}