import 'package:alleventsapp/auth_screens/login.dart';
import 'package:alleventsapp/event_screens/event_card_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/event_controller.dart';
import 'bottom_sheet/category_bottom_sheet.dart';
import 'event_screens/event_card_grid.dart';
import 'event_screens/event_details_screen.dart';

class MainPage extends StatelessWidget {
  final EventController controller = Get.put(EventController());

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.offAll(const LoginScreen()),icon: const Icon(Icons.arrow_back),),
        title: const Text("Events",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: Colors.black));
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () => showCategoryBottomSheet(context, controller),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(style: BorderStyle.solid),
                      ),
                      height: 50,
                      width: 150,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              capitalize(controller.selectedCategory.value),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const Icon(Icons.keyboard_arrow_down_sharp),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: IconButton(
                    icon: Icon(
                      size: 35,
                      controller.isGridView.value
                          ? Icons.list
                          : Icons.grid_view,
                    ),
                    onPressed: controller.toggleView,
                  ),
                ),
              ],
            ),
            Expanded(
              child: controller.events.isEmpty
                  ? const Center(child: CircularProgressIndicator(color: Colors.black,))
                  : controller.isGridView.value
                      ?
              GridView.builder(
                          padding: const EdgeInsets.all(8.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 3.0,
                            mainAxisSpacing: 3.0,
                            childAspectRatio: 1.25,
                          ),
                          itemCount: controller.events.length,
                          itemBuilder: (context, index) {
                            final event = controller.events[index];
                            return Event_Detail_Card_Grid(event: event);
                          },
                        )
                      : ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: controller.events.length,
                itemBuilder: (context, index) {
                  final event = controller.events[index];
                  return EventDetailCardList(event: event);
                },
              )

            ),
          ],
        );
      }),
    );
  }
}
