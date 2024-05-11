class UpdateAlbumModel {
  final int id;
  final String title;

  const UpdateAlbumModel({required this.id, required this.title});

  factory UpdateAlbumModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
      } =>
        UpdateAlbumModel(
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
