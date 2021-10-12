import 'package:get/get.dart';
import 'package:mini_project/model/karya.dart';
import 'package:mini_project/services/remote_api.dart';

class KaryaController extends GetxController {
  var isLoading = true.obs;
  //bentuknya list/array bukan objek
  RxList<Karya> karyaList = <Karya>[].obs;
  final service = new RemoteApi();
  @override
  void onInit() {
    getKaryaCtrl();
    super.onInit();
  }

  void getKaryaCtrl() async {
    try {
      isLoading(true);
      var result = await service.getKarya();
      karyaList.addAll(result);
      
    } finally {
      isLoading(false);
    }
  }
}
