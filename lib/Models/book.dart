class Book {
  final int id;
  final int publisherId;
  final String name;
  final int pages;
  final String category;

  const Book(
    {
      required this.id,
      required this.name,
      required this.category,
      required this.pages,
      required this.publisherId
    }
  );
}