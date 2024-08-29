export class User {
  constructor() {
    this.books = [];
  }

  borrow(book, library) {
    if (!library.getBooks().includes(book)) return false;

    library.removeBook(book);
    this.books.push(book);
    return true;
  }

  hasBook(book) {
    return this.books.includes(book);
  }

  return(book, library) {
    if (!this.hasBook(book)) return false;

    const returnBookIndex = this.books.indexOf(book);
    this.books.splice(returnBookIndex, 1);
    library.addBook(book);
    return true;
  }

  getBookNames() {
    return this.books.map((book) => book.name);
  }
}
