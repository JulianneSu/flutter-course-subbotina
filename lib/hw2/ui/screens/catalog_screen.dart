import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/hw2/bloc/album_bloc.dart';
import 'package:flutter_application_1/hw2/bloc/album_state.dart';
import 'package:flutter_application_1/hw2/domein/entities/album.dart';
import 'package:flutter_application_1/hw2/ui/screens/login_screen.dart';
import 'package:flutter_application_1/hw2/ui/widgets/card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/hw2/bloc/album_bloc.dart';
import 'package:flutter_application_1/hw2/bloc/album_state.dart';
import 'package:flutter_application_1/hw2/bloc/album_event.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Album> Albums = [];

  final textController = TextEditingController();

  final String url = 'https://6ad4be6948476c0785d939f0.mockapi.io/albums';
  bool isLoading = false;
  String? error;
  
  bool albumCreated = true;
  //отправить данные на сервер
  Future<void> _createAlbum(Album album) async {
    final res = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(album.toJson()),
    );
    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('Статус ${res.statusCode}');
    }
    final json = jsonDecode(utf8.decode(res.bodyBytes));
    // return Album.fromJson(json);
    print('Статус ${res.statusCode}');
  }

  void tapCreate() {
    setState(() => albumCreated = false);
  }

  void tapCloseCreate() {
    setState(() => albumCreated = true);
  }

  String? _nameError;

  void addAlbum() {
    if (textController.text.isNotEmpty) {
      final al = Album(
        id: '',
        name: textController.text,
        band: 'Группа',

        genre: ['жанр'],
        year: 'год',
      );
      createAlbum(al);
      // Albums.insert(0, al);
      textController.clear();
      setState(() => albumCreated = true);
    } else {
      setState(() => _nameError = 'Название не может быть пустым');
      return;
    }
    setState(() => _nameError = null);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   load();
  // }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  
  bool likedOnly = false;
  final Set<String> likedAlbumsId = <String>{};
  List<Album> likedAlbums = [];

  void _toggleLike(String albumId) {
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

  //import to firestore
  final db = FirebaseFirestore.instance;
  Future<void> createAlbum(Album al) async {
    try {
      await db.collection('albums').add(al.toJson());
    } catch (e) {
      print(e);
    }
  }

  int _streamKey = 0; // счётчик для пересоздания StreamBuilder

  void _refresh() {
    setState(() {
      _streamKey++; // новая key → StreamBuilder пересоздаётся → новый snapshots()
      error = null;
    });
  }

  final _albumsStream = FirebaseFirestore.instance
      .collection('albums')
      .snapshots();


  @override
  Widget build(BuildContext context) {
    // final visibleAlbums = likedOnly
    //     ? Albums.where((a) => likedAlbumsId.contains(a.id)).toList()
    //     : Albums;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Альбомы',
          style: TextStyle(fontWeight: FontWeight(900), fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ElevatedButton(onPressed: _importFromMockApi, child: Text('import!')),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                spacing: 20,
                children: [
                  if (error != null) ...[
                    Expanded(child: Text('Ошибка: $error')),

                    ElevatedButton(
                      // !!
                      onPressed: _refresh,
                      child: const Text('Обновить'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 198, 198),
                        foregroundColor: Color.fromARGB(255, 94, 30, 30),
                      ),
                    ),
                  ],
                  if (isLoading)
                    Text('Загрузка...')
                  else ...[
                    // Text('Альбомы', style: TextStyle(fontWeight: FontWeight(900), fontSize: 40 ,), ),
                    // Text('Всего альбомов', style: TextStyle(color: Colors.grey, fontSize: 26 ,), ),
                    // Text(
                    //   'В избранном: ${likedAlbumsId.length} из ${Albums.length} ',
                    //   style: TextStyle(color: Colors.grey, fontSize: 18),
                    // ),
                    // Spacer(),
                    InkWell(
                      onTap: tapCreate,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        maxRadius: 18,
                        child: Icon(Icons.add),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: showLiked, //child: Text('Избранное')

                      style: ElevatedButton.styleFrom(
                        backgroundColor: likedOnly
                            ? Colors.white
                            : Color.fromARGB(255, 255, 198, 198),
                        foregroundColor: likedOnly
                            ? Colors.black
                            : Color.fromARGB(255, 94, 30, 30),
                      ),
                      child: Text(
                        likedOnly
                            ? 'Показать все'
                            : 'Избранное (${likedAlbumsId.length})',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),

                    Spacer(),
                    InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();

                        // if (!mounted) return;
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(builder: (_) => LoginScreen()),
                        // );
                      }, //child: Text('Избранное')

                      child: CircleAvatar(
                        maxRadius: 18,
                        backgroundColor: Color.fromARGB(255, 255, 198, 198),
                        foregroundColor: Color.fromARGB(255, 94, 30, 30),

                        child: Icon(Icons.logout, size: 17),
                      ),
                    ),
                  ],
                ],
              ),

            
                if (!albumCreated)
                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Название альбома',
                            errorText: _nameError,
                          ),
                          controller: textController,
                        ),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: addAlbum,
                        child: Text('Добавить'),
                      ),
                      InkWell(
                        onTap: tapCloseCreate,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          maxRadius: 18,
                          child: Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
              Expanded(
child: BlocBuilder<AlbumBloc, AlbumState>(builder: 
(context, state) {
if(state is AlbumLoadInProgress)
{
    return Center(
                        child: CircularProgressIndicator(color: Colors.red),
                      );
}
if (state is AlbumLoadFailure)
{
  return   Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 12,
                          children: [
                            Text(state.message),
                            ElevatedButton(
                              onPressed: (){context.read<AlbumBloc>().add(AlbumLoadRequested());},
                              child: const Text('Обновить'),
                            ),
                          ],
                        ),
                      );
}

//                 child: StreamBuilder(
//                   stream: _albumsStream,
//                   key: ValueKey(
//                     _streamKey,
//                   ), // ← при изменении key поток перезапускается
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(
//                         child: CircularProgressIndicator(color: Colors.red),
//                       );
//                     }
//                     if (snapshot.hasError) {
//                       return Center(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           spacing: 12,
//                           children: [
//                             Text('Ошибка загрузки: ${snapshot.error}'),
//                             ElevatedButton(
//                               onPressed: _refresh,
//                               child: const Text('Обновить'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }

//                     if (!snapshot.hasData) {
//                       return Center(child: Text('Данные не найдены :('));
//                     }

                    final albums = (state as AlbumLoadSuccess).albums;
                    final visible = likedOnly
                        ? albums
                              .where((a) => likedAlbumsId.contains(a.id))
                              .toList()
                        : albums;
if(albums.isEmpty)     return Center(child: Text('Данные не найдены :('));
                    if (visible.isEmpty) {                      
                      return const Center(
                        child: Text('Нет избранных альбомов'),
                      );
                    }

                    return ListView.builder(
                      // itemExtent: 220,
                      itemCount: visible.length,
                      itemBuilder: (context, index) {
                        final album = visible[index];

                        // likedOnly
                        // ?
                        //  CardWidget(card: likedAlbums[index],
                        // isLiked: likedAlbumsId.contains(Albums[index].id),
                        // onLikeTap: () => _toggleLike(Albums[index].id, Albums[index]),
                        // )
                        // :
                        return CardWidget(
                          card: album,
                          isLiked: likedAlbumsId.contains(album.id),
                          onLikeTap: () => _toggleLike(album.id),
                        );
                      },
                    );
                //   },
                // ),

}
),


              
              ),
            ],
          ),
        ),
      ),
    );
  }
}
