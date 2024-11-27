import 'package:craftmyplate/screens/event_screen.dart';
import 'package:craftmyplate/utils/constant.dart';
import 'package:craftmyplate/widgets/image_stack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/bulkfoodtab.dart';
import '../widgets/catering_service_tab.dart';

class WeddingScreen extends StatelessWidget {
  final String url;
  final String title;
  const WeddingScreen({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // For "Bulk Food Delivery" and "Catering Service" tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200), // AppBar height
          child: AppBar(
            title: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Stack(
              children: [
                // Background Image
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      scale: 30.0,
                      image: AssetImage(
                        url, // Replace with actual image URL
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Gradient Overlay for better text visibility
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                // AppBar Content
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Back Button
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () {
                              Get.offAll(() => EventScreen(),
                                  transition: Transition.fadeIn,
                                  duration: const Duration(milliseconds: 1000));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              splashBorderRadius: BorderRadius.circular(12.0),
              labelColor: primaryColor,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.transparent,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              indicator: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Tab(text: "Bulk Food Delivery"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Tab(text: "Catering Service"),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            BulkFoodDeliveryTab(),
            CateringServiceTab(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  ImageStackWidget(),
                  SizedBox(width: 8),
                  Text(
                    "3 Platters",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontFamily: 'LexendFont'),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  children: [
                    Text(
                      "View Cart",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'LexendFont'),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
