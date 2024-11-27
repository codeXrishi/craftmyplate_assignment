import 'package:craftmyplate/controllers/auth_controller.dart';
import 'package:craftmyplate/models/event_model.dart';
import 'package:craftmyplate/screens/wedding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EventScreen extends StatelessWidget {
  EventScreen({super.key});

  final List<Event> events = [
    Event(title: "House Party", imageUrl: 'assets/House Party.png'),
    Event(title: "Farmhouse Party", imageUrl: 'assets/Farmhouse Party.png'),
    Event(title: "Kitty Party", imageUrl: 'assets/Kitty Party.png'),
    Event(title: "Birthday", imageUrl: 'assets/Birthday Party.png'),
    Event(title: "Pooja", imageUrl: 'assets/Pooja.png'),
    Event(title: "Cocktail Party", imageUrl: 'assets/Cocktail Party.png'),
    Event(title: "Office Party", imageUrl: 'assets/Office Party.png'),
    Event(title: "Get Together", imageUrl: 'assets/Get together.png'),
    Event(title: "House Warming", imageUrl: 'assets/House Warming.png'),
    Event(title: "Haldi", imageUrl: 'assets/Haldi.png'),
    Event(title: "Wedding", imageUrl: 'assets/Wedding.png'),
    Event(title: "Reception", imageUrl: 'assets/Reception.png'),
    Event(title: "Engagement", imageUrl: 'assets/Engagement.png'),
    Event(title: "Workshop", imageUrl: 'assets/Workshop.png'),
  ];

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    final screenWidth = MediaQuery.of(context).size.width;

    final int crossAxisCount = screenWidth < 360
        ? 2 // Small devices (very compact phones)
        : screenWidth < 600
            ? 3 // Medium-sized devices
            : 4;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        actions: [
          IconButton(
              onPressed: () {
                authController.signOut();
              },
              icon: const Icon(Iconsax.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Dynamic Columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.85, // Adjust card height-to-width ratio
          ),
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return EventCard(
              event: event,
              onTap: () {
                Get.to(
                  () => WeddingScreen(title: event.title, url: event.imageUrl),
                  transition: Transition.fadeIn,
                  duration: const Duration(microseconds: 2000),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;
  const EventCard({super.key, required this.event, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // Rounded corners
        child: Stack(
          children: [
            // Event Image
            Image.asset(
              event.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            // Gradient Overlay for Text Readability
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),

            // Event Title
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  event.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
