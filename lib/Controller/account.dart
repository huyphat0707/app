import 'package:app/Api/account.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  var getUser;
  AccountApi services = AccountApi();
  var isLoading = true.obs;
  @override
  void onInit() {
    profileUser();
    super.onInit();
  }

  profileUser() async {
    try {
      isLoading.value = true;
      var result = await services.profile();
      print(result);
      if (result != null) {
        getUser = result.obs;
      } else {
        print("null");
      }
    } finally {
      isLoading.value = false;
    }
  }
}
