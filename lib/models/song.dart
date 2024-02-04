/// Represents a musical composition with relevant details.
class Song {
  /// The title of the song.
  final String title;

  /// The file path to the image associated with the song.
  final String filePath;

  /// The singer or artist who performed the song.
  final String singer;

  /// The file path to the audio file of the song.
  final String audioPath;

  /// Constructs a [Song] with the provided details.
  ///
  /// [title]: The title of the song.
  /// [singer]: The singer or artist who performed the song.
  /// [filePath]: The file path to the image associated with the song.
  /// [audioPath]: The file path to the audio file of the song.
  Song({
    required this.title,
    required this.singer,
    required this.filePath,
    required this.audioPath,
  });
}
