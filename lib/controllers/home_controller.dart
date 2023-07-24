
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentNavIndex=0.obs;

}/*
  var box = GetStorage();
  var isLoading = false;
  List<Slider> carouselData = [];

  @override
  void onInit() {
    fetchCarousel();
    if (box.read('carouselData') != null)
      carouselData.assignAll(box.read('carouselData'));
    super.onInit();
  }

  void fetchCarousel() async {
    try {
      isLoading = true;
      update();

      List<Slider> _data = await RemoteService.fetchCarouselData();
      if (_data != null) {
        carouselData.assignAll(_data);
        box.write('carouselData', _data);
      }
    } finally {
      isLoading = false;
      update();
      print('data fetch done');
    }
  }
}
*/
