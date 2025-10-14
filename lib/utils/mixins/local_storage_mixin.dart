




import '../../res/constants/imports.dart';

mixin LocalStorageMixin {

  void storeDataLocally(key, data) {
    storageBox.write(key, data);
  }

  Future<dynamic>? getLocalData(key) async {
    final data = await storageBox.read(key);
    debugPrint("$key: $data");
    return data;
  }



  void removeLocalData() {
    storageBox.erase();
    //Get.find<>()= UserModel();
  }

  void removeSpecificLocalData(key) {
    storageBox.remove(key);
    //Get.find<>()= UserModel();
  }
}
