USE LibraryDatabase2;


CALL AddBook('1984', 'Orwell',1949,'Historic',5);
CALL AddBook('Book2', 'Author2',1939,'Uno',3);
CALL AddBook('Book3', 'Author3',1989,'Pop',10);


CALL AddUser('John', 'Doe', '1990-01-01', 'john.doe@example.com', '123-456-7890', '123 Main St');

CALL LoanBook(12, 1);



SELECT * FROM BookList;
SELECT * FROM UserList;
SELECT * FROM ActiveLoansForUser;


CALL ReturnBook(12,1);
CALL RemoveFeeBooks(11,3)