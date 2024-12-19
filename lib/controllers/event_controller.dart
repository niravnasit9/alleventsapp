import 'package:get/get.dart';
import '../models/details_model.dart';
import '../services/api_service.dart';
import '../models/category_model.dart';

class EventController extends GetxController {
  var events = <Event_Details_Model>[].obs;
  var categories = <AllCategory>[].obs;
  var selectedCategory = 'All'.obs;
  var isGridView = true.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    isLoading(true);
    try {
      var categoryData = await ApiService.getCategories();
      categories.assignAll(categoryData);

      if (categories.isNotEmpty) {
        fetchEvents(categories.first.data.toString());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void fetchEvents(String apiUrl) async {
    isLoading(true);
    try {
      var eventData = await ApiService.getEvents(apiUrl);
      events.assignAll(eventData);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void toggleView() {
    isGridView.value = !isGridView.value;
  }

  void updateCategory(AllCategory category) {
    selectedCategory.value = category.category!;
    fetchEvents(category.data!);
  }
}
