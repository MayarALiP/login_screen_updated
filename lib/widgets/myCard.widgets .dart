import 'package:flutter/material.dart';
import 'package:login_screen_updated/models/recipes.models.dart';
import 'package:login_screen_updated/utilities/colors.utilities.dart';

class MyCard extends StatelessWidget {
  MyCard({
    required this.recipe,
    super.key,
  });

  Recipes recipe;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
//---------------------------- favoriteIcon-------------------------------------
      const Icon(
        Icons.favorite,
        color: Color(ColorsConst.orangeColor),
      ),

//---------------------------- Decoration---------------------------------------
      Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 40,
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 0,
              offset: const Offset(10, 10))
        ]),

//-----------------------------Card Assembly------------------------------------

        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//------------------------------Meal Type---------------------------------------
                  Text(
                    '${recipe.mealType}',
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),

//------------------------------Meal Description--------------------------------
                  Text(
                    '${recipe.description}',
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(width: 20),

//------------------------------Meal Review-------------------------------------

                  const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(ColorsConst.orangeColor),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(ColorsConst.orangeColor),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(ColorsConst.orangeColor),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(ColorsConst.orangeColor),
                        ),
                        Icon(
                          Icons.star,
                          color: Color(ColorsConst.orangeColor),
                        ),
                      ]),

//-----------------------------------------Meal Calories------------------------
                  const SizedBox(height: 10),

                  Text(
                    '${recipe.calories} calories',
                    style: const TextStyle(color: Colors.grey),
                  ),

//-----------------------------------------Meal prepTime------------------------

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.timer),
                        Text(
                          '${recipe.prepTime} preptime',
                          style: const TextStyle(color: Colors.grey),
                        ),

//----------------------------------------Meal serving--------------------------

                        const Icon(Icons.room_service_rounded),
                        Text(
                          '${recipe.serving} serving',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ]),
                ]),
          ),
        ),
      ),
      Positioned(
        right: 32,
        top: -35,
        child: Image.network(
          recipe.image,
          height: 100,
          width: 100,
        ),
      ),
    ]);
  }
}
