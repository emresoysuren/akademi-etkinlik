extension LinkType on String {
  LinkTypes linkType() {
    if (toLowerCase().contains("tiktok.com")) {
      return LinkTypes.tiktok;
    }
    if (toLowerCase().contains("discord.com")) {
      return LinkTypes.discord;
    }
    if (toLowerCase().contains("facebook.com")) {
      return LinkTypes.facebook;
    }
    if (toLowerCase().contains("youtube.com")) {
      return LinkTypes.youtube;
    }
    if (toLowerCase().contains("twitch.com")) {
      return LinkTypes.twitch;
    }
    if (toLowerCase().contains("instagram.com")) {
      return LinkTypes.instagram;
    }
    if (toLowerCase().contains("twitter.com")) {
      return LinkTypes.twitter;
    }
    if (toLowerCase().contains("zoom.com")) {
      return LinkTypes.zoom;
    }
    if (toLowerCase().contains("slack.com")) {
      return LinkTypes.slack;
    }
    return LinkTypes.other;
  }
}

enum LinkTypes {
  other,
  tiktok,
  discord,
  facebook,
  youtube,
  twitch,
  instagram,
  twitter,
  zoom,
  slack,
}
