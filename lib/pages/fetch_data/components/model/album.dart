class AlbumModelFetch {
  final int userId;
  final int id;
  final String title;

  const AlbumModelFetch({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumModelFetch.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
      } =>
        AlbumModelFetch(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
