void main() {
Books b1 = Books(1, "first book");
Books b2 = Books(2, "second book", borrowed: true);
Books b3 = Books(3, "third book");

Users u1 = Users(01, "ahmed");
Users u2 = Users(02, "Mona");
Users u3 = Users(03, "Omar");


Library l1 = Library([b1,b2,b3], [u1,u2,u3]);

l1.displayInfo();
l1.returnBook(1);
l1.borrowBook(4);
l1.addBook(Books(5, "fifth book", borrowed: true));

l1.addUser(Users(04, "khaled"));

l1.displayInfo();
}

class Books {
  int bookID;
  String title;
  bool borrowed;

  Books(this.bookID, this.title, {this.borrowed = false});

  void displayInfo() {
    print(
        "book id : $bookID ,book title: $title, is book borrowed ? : $borrowed");
  }
}

class Users {
  int id;
  String name;

  Users(this.id, this.name);

  void displayInfo() {
    print("user id : $id ,user name: $name");
  }
}

class Library {
  List books = [];
  List users = [];

  Library(this.books, this.users);

  void addBook(Books b) {
    books.add(b);
    print('Book added: ${b.title}');
  }

  void addUser(Users u) {
    users.add(u);
    print('user add: ${u.name}');
  }

  void borrowBook(int bookid) {
    bool bookfound = false;
    for (int i = 0; i < books.length; i++) {
      if (bookid == books[i].bookID) {
        bookfound = true;
        if (books[i].borrowed) {
          print("Book $bookid is borrowed");
        } else {
          print("Book $bookid is available to be borrowed");
          books[i].borrowed = true;
          print("Book $bookid is now borrowed");
        }
        break;
      }
    }
   print("Book $bookid not found");
  }

  void returnBook(int bookid) {
    bool bookfound = false;
    for (int i = 0; i < books.length; i++) {
      if (bookid == books[i].bookID) {
        bookfound = true;
        if(books[i].borrowed){
        books[i].borrowed = false;
        print("book $bookid returned");
        break;
        }else{
         print("book $bookid is not borrowed"); 
        }
      }
      if (!bookfound) {
        print("Book $bookid not found");
      }
    }
  }

  void displayInfo() {
    print("our users");
    users.forEach((user) {
      user.displayInfo();
    });

    print("our books");
    books.forEach((book) {
      book.displayInfo();
    });
  }
}
