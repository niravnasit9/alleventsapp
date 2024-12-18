import 'package:flutter/material.dart';
import '../controllers/event_controller.dart';

void showCategoryBottomSheet(BuildContext context, EventController controller) {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 380,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                        text: 'Choose Your Preferred ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Category',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            capitalize(category.category ?? ''),
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            controller.updateCategory(category);
                            Navigator.pop(context);
                          },
                        ),
                        if (index < controller.categories.length - 1)
                          const Divider(color: Colors.black, thickness: 1),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
