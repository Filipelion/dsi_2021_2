// class PairController {
//   final _pairService = Get.find<PairService>();
//   final _pair = Pair().obs;
//   final _pairs = <Pair>[].obs;

//   Pair get pair => _pair.value;
//   set pair(Pair value) => _pair.value = value;

//   List<Pair> get pairs => _pairs.value;
//   set pairs(List<Pair> value) => _pairs.value = value;

//   @override
//   void onInit() {
//     super.onInit();
//     _pairService.getAll().then((value) => _pairs.value = value);
//   }

//   void create() async {
//     await _pairService.create(pair);
//     _pairs.add(pair);
//     Get.back();
//   }

//   void update() async {
//     await _pairService.update(pair);
//     Get.back();
//   }

//   void delete(Pair pair) async {
//     await _pairService.delete(pair);
//     _pairs.remove(pair);
//   }
// }
