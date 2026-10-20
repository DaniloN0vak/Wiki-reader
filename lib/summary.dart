class Summary {
    final String title;
    final String extract;

    Summary({
        required this.title,
        required this.extract
    });

    factory Summary.fromJson(Map<String, dynamic> json){
        return Summary(title: json['title'] as String,
            extract: json['extract'] as String
        );
    }
}