
import 'package:flutter/material.dart';
import 'package:flutter_application_1/hw2/domein/entities/album.dart';

// void main() {
//   runApp(const Lab1App());
// }



class CardWidget extends StatelessWidget {
  final Album card;
  final VoidCallback onLikeTap;
  final bool isLiked;

  const CardWidget({super.key, required this.card, required this.onLikeTap, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return 
//card
                  Container(
                      // height: 240,
            padding:  EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                width: 1,
                color: const Color.fromARGB(255, 185, 185, 185),
              
              
              )
            ),
          child: Row(
//panel
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                if (card.imageurl == null)
                  Container(
                 width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                     color: const Color.fromARGB(255, 201, 201, 201),
                     borderRadius: BorderRadius.circular(12),
                  ),
                  
                  child: Image.asset('assets/images/placeholder.png', fit: BoxFit.cover),
          
                )
              else 
                Container(
                 width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                     color: const Color.fromARGB(255, 201, 201, 201),
                     borderRadius: BorderRadius.circular(12),
                  ),
                  
                  child: Image.asset('${card.imageurl}', fit: BoxFit.cover),
          
                ),
               
                Positioned( 
                  top: 10,
                  right: 10,


                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                //     child: Icon(Icons.favorite, color: Colors.red,)
                // )
                child: IconButton(
                  // child: CircleAvatar(
            
                icon: Icon( 
                isLiked
                            ? Icons.favorite         
                            : Icons.favorite_border,  
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                  onPressed: () { onLikeTap();
                  print('like');},
                )
                  )



                )
              ]
            ),
          
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisSize: MainAxisSize.min,  
            spacing: 10,
            children: [
              Text(card.band, style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight(900),
              )),
              Text('${card.name} • ${card.year}', style: TextStyle(
                fontSize: 19,
                color: Colors.grey,)),
                Row(
  children: card.genre.map((g) => Padding(
    padding: const EdgeInsets.only(right: 6),
    child: Container(
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 255, 198, 198),
      ),
      child: Text(g, style: const TextStyle(fontSize: 15, color: Color.fromARGB(255, 94, 30, 30))),
    ),
  )).toList(),
)
            ],
          ))
          
          ],
          )
          );///карточка,
//card
          

      
  }
}

