import 'package:bodyo_test/IngredientRow.dart';
import 'package:bodyo_test/InstructionRow.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
        margin: EdgeInsets.only(bottom: 35),
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                  color: Color(0xFFF0F0F0),
                ),
                height: 49.0,
                margin: EdgeInsets.symmetric(horizontal: 45),
                child: TabBar(
                  indicatorPadding: EdgeInsets.all(3),
                  tabs: [
                    Tab(
                      child: Text(
                        "Instructions",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Ingredients",
                      ),
                    ),
                  ],
                  labelColor: Color(0xFF20CAD1),
                  unselectedLabelColor: Colors.black,
                  indicator: RectangularIndicator(
                    color: Colors.white,
                    bottomLeftRadius: 100,
                    bottomRightRadius: 100,
                    topLeftRadius: 100,
                    topRightRadius: 100,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            InstructionRow(
                                index: "1",
                                text:
                                "In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth."),
                            InstructionRow(
                                index: "2",
                                text:
                                "Heat a lightly oiled griddle or frying pan over medium-high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot."),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25, bottom: 25, left: 45),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            IngredientRow(text: "1 ½ cups all-purpose flour"),
                            IngredientRow(
                                text: "3 tablespoons butter, melted"),
                            IngredientRow(
                                text: "3 ½ teaspoons baking powder"),
                            IngredientRow(text: "1 ¼ cups milk"),
                            IngredientRow(text: "1 tablespoon white sugar"),
                            IngredientRow(text: "1 teaspoon salt"),
                            IngredientRow(text: "1 egg"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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
                height: 150.0,
                color: Colors.white,
              ),
              blendMode: BlendMode.dstATop,
            ),
          ),
        ],
      ),
    );
  }
}
