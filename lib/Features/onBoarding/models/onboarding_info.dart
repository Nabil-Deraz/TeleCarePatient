// class OnBoardingInfo{
// final title;
// final description;
// final imageAsset;

// OnBoardingInfo(this.title, this.description,this.imageAsset);

// }
class OnBoardingModel {
  int index;
  String title;
  List<String>? colored;
  String desc;
  String img;

  OnBoardingModel(
      {required this.index,
      required this.title,
      this.colored = const [],
      required this.desc,
      required this.img});
}
