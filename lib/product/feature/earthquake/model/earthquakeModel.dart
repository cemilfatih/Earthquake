class Earthquake {
  String? id;
  String? earthquakeId;
  String? provider;
  String? title;
  String? date;
  String? mag;
  String? depth;

  Earthquake({
    this.id,
    this.earthquakeId,
    this.provider,
    this.title,
    this.date,
    this.mag,
    this.depth,
  });

  Earthquake copyWith({
    String? id,
    String? earthquakeId,
    String? provider,
    String? title,
    String? date,
    String? mag,
    String? depth,
  }) {
    return Earthquake(
      id: id ?? this.id,
      earthquakeId: earthquakeId ?? this.earthquakeId,
      provider: provider ?? this.provider,
      title: title ?? this.title,
      date: date ?? this.date,
      mag: mag ?? this.mag,
      depth: depth ?? this.depth,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'earthquakeId': earthquakeId,
      'provider': provider,
      'title': title,
      'date': date,
      'mag': mag,
      'depth': depth,
    };
  }

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return Earthquake(
      id: json['id'] as String?,
      earthquakeId: json['earthquakeId'] as String?,
      provider: json['provider'] as String?,
      title: json['title'] as String?,
      date: json['date'] as String?,
      mag: json['mag'] as String?,
      depth: json['depth'] as String?,
    );
  }

  @override
  String toString() =>
      "Response(id: $id,earthquakeId: $earthquakeId,provider: $provider,title: $title,date: $date,mag: $mag,depth: $depth)";

  @override
  int get hashCode =>
      Object.hash(id, earthquakeId, provider, title, date, mag, depth);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Earthquake &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              earthquakeId == other.earthquakeId &&
              provider == other.provider &&
              title == other.title &&
              date == other.date &&
              mag == other.mag &&
              depth == other.depth;
}
