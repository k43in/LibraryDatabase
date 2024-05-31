USE LibraryDatabase2;


CREATE VIEW BookList AS
SELECT BookID, Title, Author, YearPublished, Genre, CopiesAvailable 
FROM BOOKS;


CREATE VIEW UserList AS
SELECT UserID, FirstName, LastName
FROM USERS;

CREATE VIEW ActiveLoansForUser AS
SELECT U.UserID,
		L.LoanID,
		L.BookID,
		L.Active,
		B.Title
FROM USERS U
JOIN LOANS L ON U.UserID = L.UserID
JOIN BOOKS B ON L.BookID = B.BookID
WHERE L.Active = TRUE;

	