class ArticleTitle {
  final String normalized;
  final String displayTitle;

  const ArticleTitle({required this.normalized, required this.displayTitle});
}

class Summary {
  final ArticleTitle title;
  final String extract;

  const Summary({required this.title, required this.extract});

  factory Summary.fromJson(Map<String, dynamic> json) {
    final normalizedTitle = json['title'];
    final displayTitle = json['displaytitle'];
    final extract = json['extract'];

    if (normalizedTitle is! String ||
        displayTitle is! String ||
        extract is! String) {
      throw const FormatException(
        'Article summary must contain string title, displaytitle, and extract fields.',
      );
    }

    return Summary(
      title: ArticleTitle(
        normalized: normalizedTitle,
        displayTitle: displayTitle,
      ),
      extract: extract,
    );
  }
}
