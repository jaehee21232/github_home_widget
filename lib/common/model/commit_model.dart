class GithubCommit {
  String? sha;
  String? nodeId;
  Commit? commit;
  String? url;
  String? htmlUrl;
  String? commentsUrl;
  Author? author;
  Author? committer;
  List<Parents>? parents;

  GithubCommit(
      {this.sha,
      this.nodeId,
      this.commit,
      this.url,
      this.htmlUrl,
      this.commentsUrl,
      this.author,
      this.committer,
      this.parents});

  GithubCommit.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    nodeId = json['node_id'];
    commit =
        json['commit'] != null ? new Commit.fromJson(json['commit']) : null;
    url = json['url'];
    htmlUrl = json['html_url'];
    commentsUrl = json['comments_url'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    committer = json['committer'] != null
        ? new Author.fromJson(json['committer'])
        : null;
    if (json['parents'] != null) {
      parents = <Parents>[];
      json['parents'].forEach((v) {
        parents!.add(new Parents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sha'] = this.sha;
    data['node_id'] = this.nodeId;
    if (this.commit != null) {
      data['commit'] = this.commit!.toJson();
    }
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['comments_url'] = this.commentsUrl;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.committer != null) {
      data['committer'] = this.committer!.toJson();
    }
    if (this.parents != null) {
      data['parents'] = this.parents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Commit {
  Author? author;
  Author? committer;
  String? message;
  Tree? tree;
  String? url;
  int? commentCount;
  Verification? verification;

  Commit(
      {this.author,
      this.committer,
      this.message,
      this.tree,
      this.url,
      this.commentCount,
      this.verification});

  Commit.fromJson(Map<String, dynamic> json) {
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    committer = json['committer'] != null
        ? new Author.fromJson(json['committer'])
        : null;
    message = json['message'];
    tree = json['tree'] != null ? new Tree.fromJson(json['tree']) : null;
    url = json['url'];
    commentCount = json['comment_count'];
    verification = json['verification'] != null
        ? new Verification.fromJson(json['verification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.committer != null) {
      data['committer'] = this.committer!.toJson();
    }
    data['message'] = this.message;
    if (this.tree != null) {
      data['tree'] = this.tree!.toJson();
    }
    data['url'] = this.url;
    data['comment_count'] = this.commentCount;
    if (this.verification != null) {
      data['verification'] = this.verification!.toJson();
    }
    return data;
  }
}

class Commit_Author {
  String? name;
  String? email;
  String? date;

  Commit_Author({this.name, this.email, this.date});

  Commit_Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['date'] = this.date;
    return data;
  }
}

class Tree {
  String? sha;
  String? url;

  Tree({this.sha, this.url});

  Tree.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sha'] = this.sha;
    data['url'] = this.url;
    return data;
  }
}

class Verification {
  bool? verified;
  String? reason;
  Null? signature;
  Null? payload;

  Verification({this.verified, this.reason, this.signature, this.payload});

  Verification.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    reason = json['reason'];
    signature = json['signature'];
    payload = json['payload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verified'] = this.verified;
    data['reason'] = this.reason;
    data['signature'] = this.signature;
    data['payload'] = this.payload;
    return data;
  }
}

class Author {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  Author(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin});

  Author.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['avatar_url'] = this.avatarUrl;
    data['gravatar_id'] = this.gravatarId;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['followers_url'] = this.followersUrl;
    data['following_url'] = this.followingUrl;
    data['gists_url'] = this.gistsUrl;
    data['starred_url'] = this.starredUrl;
    data['subscriptions_url'] = this.subscriptionsUrl;
    data['organizations_url'] = this.organizationsUrl;
    data['repos_url'] = this.reposUrl;
    data['events_url'] = this.eventsUrl;
    data['received_events_url'] = this.receivedEventsUrl;
    data['type'] = this.type;
    data['site_admin'] = this.siteAdmin;
    return data;
  }
}

class Parents {
  String? sha;
  String? url;
  String? htmlUrl;

  Parents({this.sha, this.url, this.htmlUrl});

  Parents.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    url = json['url'];
    htmlUrl = json['html_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sha'] = this.sha;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    return data;
  }
}
