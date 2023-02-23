class UsersDetails {
  String? displayName;
  String? email;
  String? photoURL;

  UsersDetails({
    this.displayName,
    this.email,
    this.photoURL,
  });
  UsersDetails.fromJSON(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    photoURL = json['photoURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['emaiil'] = this.email;
    data['photoURL'] = this.photoURL;

    return data;
  }
}
