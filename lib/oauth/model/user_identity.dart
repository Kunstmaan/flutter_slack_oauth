class UserIdentity {
  bool ok;
  User user;
  Team team;

  UserIdentity.fromMap(Map json) : this.ok = json['ok'],
    this.user = new User.fromMap(json['user']),
    this.team = new Team.fromMap(json['team']);
}

class User {
  String name;
  String id;

  User.fromMap(Map json)
      : this.id = json['id'],
        this.name = json['name'];
}

class Team {
  String id;
  Team.fromMap(Map json) : this.id = json['id'];
}
