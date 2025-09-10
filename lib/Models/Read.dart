class Read {
  final int id;
  final int userId;
  final int bookId;
  final DateTime dateStart;
  bool isFinished;
  bool isLiked;

  Read({
    required this.id,
    required this.bookId,
    required this.userId,
    required this.dateStart,
    this.isFinished = false,
    this.isLiked = false,
  });
}
