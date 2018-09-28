class UserList {
  bool ok;
  List<User> users;

  UserList.fromMap(Map json) {
    ok = json['ok'];
    users = new List<User>();

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

  User.fromMap(Map json) {
    profile = new Profile.fromMap(json['profile']);
    id = json['id'];
    name = json['name'];
    isBot = json['is_bot'];
    deleted = json['deleted'];
  }
}

class Profile {
  String statusText;
  String realName;
  String email;
  String image192;
  String image512;

  Profile.fromMap(Map json) {
    statusText = json['status_text'];
    realName = json['real_name'];
    email = json['email'];
    image192 = json['image_192'];
    image512 = json['image_512'];
  }
}
