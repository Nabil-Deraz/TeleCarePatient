class ProfileDataModel {
  final String title;
  final String description;
  final String imageUrl;
  final String? route;

  ProfileDataModel(
      {required this.title,
      required this.description,
      required this.imageUrl,
      this.route});
}
