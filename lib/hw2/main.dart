
import 'package:flutter/material.dart';

void main() {
  runApp(const Lab1App());
}

class Lab1App extends StatelessWidget {
  const Lab1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Альбомы', style: TextStyle(fontWeight: FontWeight(900), fontSize: 40 ,), ),) ,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             
              children: 
              [
              // Text('Альбомы', style: TextStyle(fontWeight: FontWeight(900), fontSize: 40 ,), ),      
              Text('Добавлено 8 альбомов', style: TextStyle(color: Colors.grey, fontSize: 30 ,), ),
              ]
            ),
           Expanded( child: ListView(
            children: [

                  Container(
                      // height: 240,
            padding:  EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
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
                Container(
                 width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                     color: Colors.amber,
                     borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/7.jpg', fit: BoxFit.cover),
          
                ),
               
                Positioned( 
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite, color: Colors.red,)
                )
                )
              ]
            ),
          
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisSize: MainAxisSize.min,  
            spacing: 10,
            children: [
              Text('Diva Destruction', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight(900),
              )),
              Text('Passion`s Price • 1999', style: TextStyle(
                fontSize: 19,
                color: Colors.grey,)),
                 Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('darkwave',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),)
                ]),
            ],
          ))
          
          ],
          )),///карточка,
                 Container(
                      // height: 240,
            padding:  EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
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
                Container(
                 width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                     color: Colors.amber,
                     borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/4.jpg', fit: BoxFit.cover),
          
                ),
               
                Positioned( 
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite, color: Colors.red,)
                )
                )
              ]
            ),
          
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisSize: MainAxisSize.min,  
            spacing: 10,
            children: [
              Text('Therion', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight(900),
              )),
              Text('Secret of the runes • 2001', style: TextStyle(
                fontSize: 19,
                color: Colors.grey,)),
                 Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('symphonic metal',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),)
                ]),
            ],
          ))
          
          ],
          )),///карточка
                 Container(
                      // height: 240,
            padding:  EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
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
                Container(
                 width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                     color: Colors.amber,
                     borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/8.jpg', fit: BoxFit.cover),
          
                ),
               
                Positioned( 
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite, color: Colors.red,)
                )
                )
              ]
            ),
          
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisSize: MainAxisSize.min,  
            spacing: 10,
            children: [
              Text('Greenlung', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight(900),
              )),
              Text('Free the witch • 2018', style: TextStyle(
                fontSize: 19,
                color: Colors.grey,)),
                 Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('stoner metal',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),)
                ]),
            ],
          ))
          
          ],
          )),///карточка                
                Container(
                      // height: 240,
            padding:  EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                width: 1,
                color:const Color.fromARGB(255, 185, 185, 185),
              
              
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
                Container(
                 width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                     color: Colors.amber,
                     borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/9.jpg', fit: BoxFit.cover),
          
                ),
               
                Positioned( 
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite, color: Colors.red,)
                )
                )
              ]
            ),
          
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisSize: MainAxisSize.min,  
            spacing: 10,
            children: [
              Text('Empyrium', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight(900),
              )),
              Text('Über den Sternen • 2021', style: TextStyle(
                fontSize: 19,
                color: Colors.grey,)),
                 Row(
                  spacing: 10,
                children: [
                   Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('doom metal',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),)
               ,
                  Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('dark folk',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),)
                ]),
            ],
          ))
          
          ],
          )),///карточка
                Container(
                      // height: 240,
            padding:  EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
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
                Container(
                 width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                     color: Colors.amber,
                     borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/6.jpg', fit: BoxFit.cover),
          
                ),
               
                Positioned( 
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite, color: Colors.red,)
                )
                )
              ]
            ),
          
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisSize: MainAxisSize.min,  
            spacing: 10,
            children: [
              Text('Tristania', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight(900),
              )),
              Text('Widow`s weeds • 1998', style: TextStyle(
                fontSize: 19,
                color: Colors.grey,)),
                 Row(
                  spacing: 10,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('gothic metal',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),),
                  Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('symphonic metal',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),)
               
                
                ]),
            ],
          ))
          
          ],
          )),///карточка

                Container(
                      // height: 240,
            padding:  EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
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
                Container(
                 width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                     color: Colors.amber,
                     borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/10.jpg', fit: BoxFit.cover),
          
                ),
               
                Positioned( 
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite, color: Colors.red,)
                )
                )
              ]
            ),
          
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisSize: MainAxisSize.min,  
            spacing: 10,
            children: [
              Text('Myrkir', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight(900),
              )),
              Text('Folkesange • 2020', style: TextStyle(
                fontSize: 19,
                color: Colors.grey,)),
                 Row(
                  spacing: 10,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('folk metal',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),),
                  Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('black metal',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),)
               
                
                ]),
            ],
          ))
          
          ],
          )),///карточка

                Container(
                      // height: 240,
            padding:  EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
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
                Container(
                 width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                     color: Colors.amber,
                     borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/11.jpg', fit: BoxFit.cover),
          
                ),
               
                Positioned( 
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite, color: Colors.red,)
                )
                )
              ]
            ),
          
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisSize: MainAxisSize.min,  
            spacing: 10,
            children: [
              Text('Messa', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight(900),
              )),
              Text('Close • 2022', style: TextStyle(
                fontSize: 19,
                color: Colors.grey,)),
                 Row(
                  spacing: 10,
                children: [
                  
                  Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('doom metal',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),)
               
                
                ]),
            ],
          ))
          
          ],
          )),///карточка

                Container(
                      // height: 240,
            padding:  EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
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
                Container(
                 width: 160,
                  height: 160,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                     color: Colors.amber,
                     borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/12.jpg', fit: BoxFit.cover),
          
                ),
               
                Positioned( 
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite, color: Colors.red,)
                )
                )
              ]
            ),
          
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            mainAxisSize: MainAxisSize.min,  
            spacing: 10,
            children: [
              Text('Moonspell', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight(900),
              )),
              Text('Wolfheart • 1995', style: TextStyle(
                fontSize: 19,
                color: Colors.grey,)),
                 Row(
                  spacing: 10,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('gothic metal',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),),
                  Container(
                    padding: EdgeInsets.fromLTRB(10,6,10,6),
                    child: Text('doom metal',
                    style: TextStyle(
                    fontSize: 15,
                                        color: const Color.fromARGB(255, 94, 30, 30),)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 255, 198, 198),

                  ),)
               
                
                ]),
            ],
          ))
          
          ],
          )),///карточка





            ],
          ))
]
        
        ))
      ));
  }
}

