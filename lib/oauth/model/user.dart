class UserList {
  bool ok;
  List<User> users;

  UserList.fromMap(Map json)
      : this.ok = json['ok'],
        this.users = new List.empty(growable: true) {
    List<Map> members = (json['members'] as List).cast();

    for (int i = 0; i < members.length; ++i) {
      users.add(new User.fromMap(members[i]));
    }
  }
}

class User {
  Profile profile;
  String id;
  String name;
  bool isBot;
  bool deleted;

  User.fromMap(Map json)
      : this.profile = new Profile.fromMap(json['profile']),
        this.id = json['id'],
        this.name = json['name'],
        this.isBot = json['is_bot'],
        this.deleted = json['deleted'];
}

class Profile {
  String statusText;
  String realName;
  // String email;
  String image192;
  String image512;

  Profile.fromMap(Map json)
      : this.statusText = json['status_text'],
        this.realName = json['real_name'],
        // this.email = json['email'],
        this.image192 = json['image_192'],
        this.image512 = json['image_512'];
}
