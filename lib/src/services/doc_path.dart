class DocPath {
  static String jobs(String uid) {
    return 'users/$uid/jobs';
  }

  static String job(String uid, String jobId) {
    return 'users/$uid/jobs/$jobId';
  }

  static String entries(String uid) {
    return 'users/$uid/entries';
  }

  static String entry(String uid, String entryId) {
    return 'users/$uid/entries/$entryId';
  }
}
