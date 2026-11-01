import 'package:flutter_application_1/hw2/domein/entities/album.dart';

sealed class AlbumState {}
class AlbumLoadInProgress extends AlbumState {}
class AlbumLoadSuccess extends AlbumState {
final List<Album> albums;
AlbumLoadSuccess(this.albums);
}
class AlbumLoadFailure extends AlbumState {
final String message;
AlbumLoadFailure(this.message);
}