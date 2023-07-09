
class ForumData{
  String questionTitle;
  String questionDescription;
  DateTime dateTime;
  List<String> answers;
  int forumLikes;

  ForumData({
    required this.questionTitle,
    required this.questionDescription,
    required this.dateTime,
    required this.answers,
    required this.forumLikes,
  });
}