class Tile{
  String image;
  String title;
  String subTitle;

  Tile({
   required this.image,
    required this.title,
    required this.subTitle
});

}

List objects = [
  Tile(image: 'images/assets/anya.jpeg', title: 'Anya', subTitle: 'spy x family'),
  Tile(image: 'images/assets/eren.jpeg', title: 'Eren', subTitle: 'Attack on Titan'),
  Tile(image: 'images/assets/itachi.jpeg', title: 'Itachi', subTitle: 'Naruto'),
  Tile(image: 'images/assets/naruto.jpeg', title: 'Naruto', subTitle: 'Naruto'),
  Tile(image: 'images/assets/sasuke.jpeg', title: 'Sasuke', subTitle: 'Naruto'),
  Tile(image: 'images/assets/levi.jpeg', title: 'Levi', subTitle: 'Attack on Titan'),
  Tile(image: 'images/assets/mikasa.jpeg', title: 'Mikasa', subTitle: 'Attack on Titan'),


];
