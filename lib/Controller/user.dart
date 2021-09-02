import 'package:app/Api/user.dart';
import 'package:get/get.dart';
class UserController extends GetxController {
  List getUser = [].obs;

  APIUser services = APIUser();
  var postLoading = true.obs;

  @override
  void onInit() {
    listUser();
    super.onInit();
  }

  listUser() async {
    try {
      postLoading.value = true;
      var result = await services.getAllUser();
      if (result != null) {
        getUser.assignAll(result);
      } else {
        print("null");
      }
    } finally {
      postLoading.value = false;
    }
  }
}
