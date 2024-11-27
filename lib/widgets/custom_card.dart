import 'package:craftmyplate/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodListView extends StatelessWidget {
  const FoodListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 2, // Number of cards to display
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          margin: const EdgeInsets.only(bottom: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.asset(
                      "assets/image2.png",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4)),
                      ),
                      child: const Text(
                        "Popular",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "South Breakfast",
                      style: GoogleFonts.lexend(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Text(
                              "Min 10 - Max 120",
                              style: GoogleFonts.lexend(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Starts at ',
                            style: GoogleFonts.lexend(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            children: const <InlineSpan>[
                              TextSpan(
                                  text: '₹299',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "12 Categories & 40 Items",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                        fontFamily: 'LexendFont',
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        3,
                        (index) => const Text(
                          "3 Live Counter\n4 main\n3 Desserts\n3 Desserts \n3 Desserts",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
