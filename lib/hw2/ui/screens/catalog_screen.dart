import 'package:flutter/material.dart';
import 'package:flutter_application_1/hw2/domein/entities/album.dart';
import 'package:flutter_application_1/hw2/ui/widgets/card.dart';
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
  // String? data;

  //принять данные с сервера
  Future<void> load() async {
    var response;
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        print('Ошибка ${response.statusCode}');

        throw Exception('Ошибка ${response.statusCode}');
      }
      final json = jsonDecode(response.body) as List;

      // for (final i in json) {
      //   final al = Album.fromJson(i);
      //   Albums.add(al);

      final parsed = json
          .map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList();

      setState(() {
        Albums = parsed;
      });
      // setState(() => Albums = json.map((e) => Album.fromJson(e)).toList());
    } catch (e) {
      setState(() => error = e.toString());
      print(e.toString());
    } finally {
      setState(() => isLoading = false);
    }

    print(response);
  }

  bool albumCreated = true;
  //отправить данные на сервер
  Future<void> createAlbum(Album album) async {
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
        id: 8,
        name: textController.text,
        band: 'Группа',

        genre: ['жанр'],
        year: 'год',
      );
      createAlbum(al);
      Albums.insert(0, al);
      textController.clear();
      setState(() => albumCreated = true);
    }
    else
    {
    setState(() => _nameError = 'Название не может быть пустым');
    return;
  }
    setState(() => _nameError = null);
    
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void disposeController() {
    textController.dispose();
    super.dispose();
  }

  // if (isLoading) {
  //   return const CircularProgressIndicator();
  // }
  // if (error != null) {
  //   return Text('error occured :(');

  // }}

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

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Альбомы',
          style: TextStyle(fontWeight: FontWeight(900), fontSize: 40),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                if (isLoading)
                  const CircularProgressIndicator(color: Colors.red)
                else if (error != null) ...[
                  Expanded(child: Text('Ошибка: $error')),

                  ElevatedButton(
                    onPressed: load, // ← без скобок
                    child: const Text('Обновить'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 198, 198),
                      foregroundColor: Color.fromARGB(255, 94, 30, 30),
                    ),
                  ),
                ] else if (Albums.isEmpty)
                  Text('Данные не найдены :( ')
                else ...[
                  // Text('Альбомы', style: TextStyle(fontWeight: FontWeight(900), fontSize: 40 ,), ),
                  // Text('Всего альбомов', style: TextStyle(color: Colors.grey, fontSize: 26 ,), ),
                  Text(
                    'В избранном: ${likedAlbumsId.length} из ${Albums.length} ',
                    style: TextStyle(color: Colors.grey, fontSize: 26),
                  ),
                  Spacer(),
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
                    child: Text(likedOnly ? 'Показать все' : 'Избранное'),
                  ),
                ],
              ],
            ),

            if (Albums.isNotEmpty)
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
              child: ListView.builder(
                // itemExtent: 220,
                itemCount: visibleAlbums.length,
                itemBuilder: (context, index) {
                  final album = visibleAlbums[index];
                  return
                  // likedOnly
                  // ?
                  //  CardWidget(card: likedAlbums[index],
                  // isLiked: likedAlbumsId.contains(Albums[index].id),
                  // onLikeTap: () => _toggleLike(Albums[index].id, Albums[index]),
                  // )
                  // :
                  CardWidget(
                    card: album,
                    isLiked: likedAlbumsId.contains(album.id),
                    onLikeTap: () => _toggleLike(album.id),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
