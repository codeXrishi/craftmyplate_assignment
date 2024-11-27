import 'package:craftmyplate/utils/constant.dart';
import 'package:craftmyplate/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BulkFoodDeliveryTab extends StatelessWidget {
  const BulkFoodDeliveryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length:
          4, // For the nested tabs: ALL (8), Breakfast, Lunch & Dinner, Snacks
      child: Column(
        children: [
          TabBar(
            labelColor: secondaryColor,
            unselectedLabelColor: Colors.black,
            indicatorColor: secondaryColor,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: "ALL (8)"),
              Tab(text: "Breakfast"),
              Tab(text: "Lunch & Dinner"),
              Tab(text: "Snacks"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                FoodListView(),
                FoodListView(),
                Center(child: Text("Lunch & Dinner")),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.close_circle,
                        size: 100.0,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'No Platters Available',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'LexendFont',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
