class Album{

 Album({
  required this.id,
  required this.name,
  required this.band,
  this.imageurl,
  required this.genre,
  required this.year});

final int id;
final String name;
final String band;
final String? imageurl;
final List<String> genre;
final String year;


}



// List<Album> Albums = [
//   Album(id: 1, name: 'Passion`s price', band: 'Diva Destruction', genre: ['pop','gothic rock'],imageurl: 'assets/images/7.jpg', year: '1999'),
//   Album(id: 2, name: 'Secret of the runes', band: 'Therion', genre: ['symphonic metal',],imageurl: 'assets/images/4.jpg', year: '2001'),
//    Album(id: 3, name: 'Free the witch', band: 'Greenlung', genre: ['stoner metal'],imageurl: 'assets/images/8.jpg', year: '2018'),
//    Album(id: 4, name: 'Über den Sternen', band: 'Empyrium', genre: ['doom metal','dark folk'],imageurl: 'assets/images/9.jpg', year: '2021'),
//    Album(id: 5, name: 'Widow`s weeds', band: 'Tristania', genre: ['gothic metal','symphonic metal'],imageurl: 'assets/images/6.jpg', year: '1998'),
//    Album(id: 6, name: 'Folkesange', band: 'Myrkir', genre: ['black metal','folk metal'],imageurl: 'assets/images/10.jpg', year: '2020'),
//    Album(id: 7, name: 'Close', band: 'Messa', genre: ['doom metal'],imageurl: 'assets/images/11.webp', year: '2022'),
//    Album(id: 8, name: 'Wolfheart', band: 'Moonspell', genre: ['gothic metal','doom metal'],imageurl: 'assets/images/12.jpg', year: '1995'),
  
// ];