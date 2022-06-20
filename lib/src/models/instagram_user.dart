class IUser {
  String? uid;
  String? nickname;
  String? thumbsnail;
  String? description;
  IUser({
    this.uid,
    this.nickname,
    this.thumbsnail,
    this.description,
  });

  factory IUser.fromJson(Map<String, dynamic> json) {
    return IUser(
      uid: json['uid'] == null ? '' : json['uid'] as String,
      nickname: json['nickname'] == null ? '' : json['nickname'] as String,
      thumbsnail:
          json['thumbsnail'] == null ? '' : json['thumbsnail'] as String,
      description:
          json['description'] == null ? '' : json['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nickname': nickname,
      'thumbsnail': thumbsnail,
      'description': description,
    };
  }
}
