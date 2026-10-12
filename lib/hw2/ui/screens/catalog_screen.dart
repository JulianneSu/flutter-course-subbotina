import 'package:flutter/material.dart';
import 'package:flutter_application_1/hw2/domein/entities/album.dart';
import 'package:flutter_application_1/hw2/ui/widgets/card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {

  List<Album> Albums = [
  Album(id: 1, name: 'Passion`s price', band: 'Diva Destruction', genre: ['pop','gothic rock'],imageurl: 'assets/images/7.jpg', year: '1999'),
  Album(id: 2, name: 'Secret of the runes', band: 'Therion', genre: ['symphonic metal',],imageurl: 'assets/images/4.jpg', year: '2001'),
   Album(id: 3, name: 'Free the witch', band: 'Greenlung', genre: ['stoner metal'],imageurl: 'assets/images/8.jpg', year: '2018'),
   Album(id: 4, name: 'Über den Sternen', band: 'Empyrium', genre: ['doom metal','dark folk'],imageurl: 'assets/images/9.jpg', year: '2021'),
   Album(id: 5, name: 'Widow`s weeds', band: 'Tristania', genre: ['gothic metal','symphonic metal'],imageurl: 'assets/images/6.jpg', year: '1998'),
   Album(id: 6, name: 'Folkesange', band: 'Myrkir', genre: ['black metal','folk metal'],imageurl: 'assets/images/10.jpg', year: '2020'),
   Album(id: 7, name: 'Close', band: 'Messa', genre: ['doom metal'],imageurl: 'assets/images/11.webp', year: '2022'),
   Album(id: 8, name: 'Wolfheart', band: 'Moonspell', genre: ['gothic metal','doom metal'],imageurl: 'assets/images/12.jpg', year: '1995'),
  
];
  bool likedOnly = false;
  final Set<int> likedAlbumsId = <int>{};
  List<Album> likedAlbums = [];



  
  

  void _toggleLike(int albumId) {
    setState(() {
      if (likedAlbumsId.contains(albumId)) {
        likedAlbumsId.remove(albumId);
        // likedAlbums.add(album);   // снять лайк
      } else {
        likedAlbumsId.add(albumId); 
        // likedAlbums.remove(album);     // поставить лайк
      }
    });
  }
void showLiked() {
  setState(() {
    likedOnly = !likedOnly;
  });
}


  @override
  Widget build(BuildContext context) {
    
     final visibleAlbums = likedOnly
      ? Albums.where((a) => likedAlbumsId.contains(a.id)).toList()
      : Albums;

    return   Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Альбомы', style: TextStyle(fontWeight: FontWeight(900), fontSize: 40 ,), ),) ,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             
              children: 
              [
              // Text('Альбомы', style: TextStyle(fontWeight: FontWeight(900), fontSize: 40 ,), ),      
              // Text('Всего альбомов', style: TextStyle(color: Colors.grey, fontSize: 26 ,), ),
               Text('В избранном: ${likedAlbumsId.length} из ${Albums.length} ', style: TextStyle(color: Colors.grey, fontSize: 26 ,), ),
              Spacer(),
              ElevatedButton(onPressed: showLiked, //child: Text('Избранное')

              style: ElevatedButton.styleFrom(
    backgroundColor: likedOnly ? Colors.white : Color.fromARGB(255, 255, 198, 198) ,
    foregroundColor: likedOnly ?  Colors.black : Color.fromARGB(255, 94, 30, 30) ),
             child: Text(
    likedOnly ? 'Показать все' : 'Избранное',
              ))
              ]          
              
            ),
           Expanded( child: ListView.builder(
            itemCount: visibleAlbums.length,
            itemBuilder: (context, index){
              
              final album = visibleAlbums[index];    
              return
              // likedOnly 
              // ?
              //  CardWidget(card: likedAlbums[index], 
              // isLiked: likedAlbumsId.contains(Albums[index].id),  
              // onLikeTap: () => _toggleLike(Albums[index].id, Albums[index]),
              // ) 
              // :
           
              CardWidget(card: album, 
              isLiked: likedAlbumsId.contains(album.id),  
              onLikeTap: () => _toggleLike(album.id)
              ) ;
              
            }
    
         )) ],
          ))

        
        )
      ;

      
  }

   
}


