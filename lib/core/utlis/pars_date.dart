class ParsDate {
  // calculate time ago form release news
  static String calculateRemandingDate(DateTime current) {
    Duration diff = DateTime.now().difference(current);
    if (diff.inDays == 0) {
      if (diff.inHours == 0) {
        if (diff.inMinutes == 0) {
          return "now";
        } else {
          return "few minutes ago";
        }
      } else {
        return "${diff.inHours} hours";
      }
    } else if (diff.inDays == 1) {
      return "1 day ago";
    } else {
      return "${diff.inDays} days ago";
    }
  }
}
