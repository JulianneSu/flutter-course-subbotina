import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/hw2/domein/entities/album.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
AlbumBloc() : super(AlbumLoadInProgress()) {
on<AlbumLoadRequested>(_onLoadRequested);
}


Future<void> _onLoadRequested(
AlbumLoadRequested event, Emitter<AlbumState> emit) async
{
emit(AlbumLoadInProgress());

try{
   await emit.forEach(
        FirebaseFirestore.instance
            .collection('albums')
            .orderBy('createdAt')
            .snapshots(),
        onData: (snapshot) =>
            AlbumLoadSuccess(snapshot.docs.map(Album.fromFirestore).toList()),
        onError: (error, stackTrace) => AlbumLoadFailure('Ошибка: $error'),
      );
}
catch(e) {
     emit(AlbumLoadFailure('Ошибка: $e'));
}

// await emit.forEach(
// FirebaseFirestore.instance
// .collection('albums')
// .snapshots(),
// onData: (snapshot) => AlbumLoadSuccess(
// snapshot.docs.map(Album.fromFirestore).toList()),
// onError: (error, stackTrace) =>
// AlbumLoadFailure('Не удалось загрузить каталог'),
// );


}
}