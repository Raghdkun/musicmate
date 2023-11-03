import 'dart:async';


import 'package:musicmate/core/utilities/file_handling.dart/metadata.dart';

StreamController<List<Track>> allTracksStream = StreamController.broadcast();
StreamController<List<Album>> allAlbumsStream = StreamController.broadcast();
StreamController<List<Artist>> allArtistsStream = StreamController.broadcast();
StreamController<List<Genre>> allGenresStream = StreamController.broadcast();

List<Track> currentTrackListSort = [];

Map<String, List<Track>> allTracks = {
  TrackSortTypes().alphabetical: [],
};

class TrackSortTypes {
  String alphabetical = "alphabetical";
}

List<Album> currentAlbumListSort = [];

Map<String, List<Album>> allAlbums = {
  AlbumSortTypes().alphabetical: [],
};

class AlbumSortTypes {
  String alphabetical = "alphabetical";
}

List<Artist> currentArtistListSort = [];

Map<String, List<Artist>> allArtists = {
  ArtistSortTypes().alphabetical: [],
};

class ArtistSortTypes {
  String alphabetical = "alphabetical";
}


List<Genre> currentGenreListSort = [];

Map<String, List<Genre>> allGenres = {
  GenreSortTypes().alphabetical: [],
};

class GenreSortTypes {
  String alphabetical = "alphabetical";
}