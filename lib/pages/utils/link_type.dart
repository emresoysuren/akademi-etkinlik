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
    return LinkTypes.other;
  }
}

enum LinkTypes {
  other,
  tiktok,
  discord,
  youtube,
  twitch,
  instagram,
  facebook,
}
