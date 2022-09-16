class SpecialForYouModel {
  final String title;
  final int numberOfBrands;
  final String imageSource;

  SpecialForYouModel(
      {required this.title,
      required this.numberOfBrands,
      required this.imageSource});
}

List<SpecialForYouModel> specialForYouModelList = [
  SpecialForYouModel(
      title: 'Smartphone', numberOfBrands: 18, imageSource: 'Image Banner 2'),
  SpecialForYouModel(
      title: 'Fashion', numberOfBrands: 24, imageSource: 'Image Banner 3'),
];
