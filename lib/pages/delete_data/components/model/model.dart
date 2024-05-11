class AlbumDeleteModel {
  final int id;
  final String title;

  const AlbumDeleteModel({required this.id, required this.title});

  factory AlbumDeleteModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
      } =>
        AlbumDeleteModel(
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
