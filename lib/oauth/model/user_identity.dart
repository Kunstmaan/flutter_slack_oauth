class UserIdentity {
  bool ok;
  User user;
  Team team;

  UserIdentity.fromMap(Map json) {
    ok = json['ok'];
    user = new User.fromMap(json['user']);
    team = new Team.fromMap(json['team']);
  }
}

class User {
  String name;
  String id;

  User.fromMap(Map json) {
    id = json['id'];
    name = json['name'];
  }
}

class Team {
  String id;

  Team.fromMap(Map json) {
    id = json['id'];
  }
}
