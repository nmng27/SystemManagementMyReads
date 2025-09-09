class Read {
  final int id;
  final int userId;
  final int bookId;
  final DateTime dateStart;
  final bool isFinished;
  final bool isLiked;

  const Read(
    {
      required this.id,
      required this.bookId,
      required this.userId,
      required this.dateStart,
      required this.isFinished,
      required this.isLiked
    }
  );

}