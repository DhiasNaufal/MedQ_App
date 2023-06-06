// import 'package:get/get.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class SubjectController extends GetxController {
//   final storage = FirebaseStorage.instance;
//   RxList pdfUrls = [].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchPDFUrls();
//   }

//   void fetchPDFUrls() async {
//     final ListResult result = await storage.ref().listAll();
//     final List<String> urls = [];

//     for (final Reference ref in result.items) {
//       final String url = await ref.getDownloadURL();
//       urls.add(url);
//     }

//     pdfUrls.value = urls;
//   }
// }
