class CreateAlbumModel {
  final int id;
  final String title;

  const CreateAlbumModel({required this.id, required this.title});

  factory CreateAlbumModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
      } =>
        CreateAlbumModel(
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
