class ArticleTitle {
  final String normalized;
  final String displayTitle;

  const ArticleTitle({required this.normalized, required this.displayTitle});
}

class ArticleImage {
  final String source;

  const ArticleImage({required this.source});
}

class Summary {
  final ArticleTitle title;
  final String extract;
  final String? description;
  final ArticleImage? originalImage;

  const Summary({
    required this.title,
    required this.extract,
    this.description,
    this.originalImage,
  });

  bool get hasImage => originalImage != null;

  factory Summary.fromJson(Map<String, dynamic> json) {
    final normalizedTitle = json['title'];
    final displayTitle = json['displaytitle'];
    final extract = json['extract'];
    final description = json['description'];
    final originalImage = json['originalimage'];

    if (normalizedTitle is! String ||
        displayTitle is! String ||
        extract is! String ||
        (description != null && description is! String) ||
        (originalImage != null && originalImage is! Map)) {
      throw const FormatException(
        'Article summary contains invalid title, extract, description, or image fields.',
      );
    }

    final imageSource = originalImage?['source'];
    if (originalImage != null && imageSource is! String) {
      throw const FormatException(
        'Article summary image must contain a string source field.',
      );
    }

    return Summary(
      title: ArticleTitle(
        normalized: normalizedTitle,
        displayTitle: displayTitle,
      ),
      extract: extract,
      description: description as String?,
      originalImage: originalImage == null
          ? null
          : ArticleImage(source: imageSource as String),
    );
  }

  factory Summary.fromMediaWikiJson(Map<String, dynamic> json) {
    final title = json['title'];
    final extract = json['extract'];

    if (title is! String || extract is! String || extract.isEmpty) {
      throw const FormatException(
        'Minecraft Wiki article must contain a title and non-empty extract.',
      );
    }

    return Summary(
      title: ArticleTitle(normalized: title, displayTitle: title),
      extract: extract,
    );
  }
}
