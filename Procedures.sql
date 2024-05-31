USE LibraryDatabase2;


DELIMITER //

CREATE PROCEDURE AddBook(
    p_Title VARCHAR(50),
    p_Author VARCHAR(50),
    p_YearPublished INT,
    p_Genre VARCHAR(50),
    p_CopiesAvailable INT
)
BEGIN
    DECLARE existingCopies INT;

    SELECT CopiesAvailable INTO existingCopies
    FROM BOOKS
    WHERE Title = p_Title AND Author = p_Author;

    IF existingCopies IS NOT NULL THEN
        UPDATE BOOKS
        SET CopiesAvailable = CopiesAvailable + p_CopiesAvailable
        WHERE Title = p_Title AND Author = p_Author;
    ELSE
        INSERT INTO BOOKS (Title, Author, YearPublished, Genre, CopiesAvailable)
        VALUES (p_Title, p_Author, p_YearPublished, p_Genre, p_CopiesAvailable);
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddUser(
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_DateOfBirth DATE,
    IN p_Email VARCHAR(100),
    IN p_PhoneNumber VARCHAR(15),
    IN p_Address VARCHAR(255)
)
BEGIN
	DECLARE checkMaiL VARCHAR(100);
    SELECT Email INTO checkMail
    FROM USERS
    WHERE Email = p_Email;
    
    
    IF checkMail IS NULL THEN
		INSERT INTO USERS (FirstName, LastName, DateOfBirth, Email, PhoneNumber, Address)
		VALUES (p_FirstName, p_LastName, p_DateOfBirth, p_Email, p_PhoneNumber, p_Address);
	ELSE 
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User already exist';
	END IF;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE RemoveBook(
	IN p_BookID int
)
BEGIN
	DELETE FROM LOANS
    WHERE BookID = p_BookID;
    
	DELETE FROM BOOKS
    WHERE BookID = p_BookID;
    
END //
DELIMITER ;


DELIMITER //

CREATE PROCEDURE LoanBook(
    IN p_BookID INT,
    IN p_UserID INT
)
BEGIN
    DECLARE availableCopies INT;

    -- Sprawdź liczbę dostępnych egzemplarzy
    SELECT CopiesAvailable INTO availableCopies
    FROM BOOKS
    WHERE BookID = p_BookID;

    -- Jeśli dostępne egzemplarze są większe od 0, wykonaj wypożyczenie
    IF availableCopies > 0 THEN
        -- Dodaj wpis do tabeli LOANS
        INSERT INTO LOANS (BookID, UserID, Active)
        VALUES (p_BookID, p_UserID, TRUE);

        -- Zmniejsz liczbę dostępnych egzemplarzy o 1
        UPDATE BOOKS
        SET CopiesAvailable = CopiesAvailable - 1
        WHERE BookID = p_BookID;
    ELSE
        -- Jeśli brak dostępnych egzemplarzy, zgłoś błąd
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No available copies for this book';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ReturnBook(
    IN p_BookID INT,
    IN p_UserID INT
)
BEGIN
    DECLARE activeLoanID INT;

    -- Sprawdź, czy istnieje aktywne wypożyczenie
    SELECT LoanID INTO activeLoanID
    FROM LOANS
    WHERE BookID = p_BookID AND UserID = p_UserID AND Active = TRUE
    LIMIT 1;

    -- Jeśli istnieje aktywne wypożyczenie, zaktualizuj status na nieaktywny
    IF activeLoanID IS NOT NULL THEN
        -- Aktualizuj status wypożyczenia na nieaktywny
        UPDATE LOANS
        SET Active = FALSE
        WHERE LoanID = activeLoanID;

        -- Zwiększ liczbę dostępnych egzemplarzy o 1
        UPDATE BOOKS
        SET CopiesAvailable = CopiesAvailable + 1
        WHERE BookID = p_BookID;
    ELSE
        -- Jeśli brak aktywnego wypożyczenia, zgłoś błąd
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No active loan found for this book and user';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE RemoveFeeBooks(
	IN p_BookID int,
    IN p INT
)
BEGIN
	UPDATE BOOKS
    SET CopiesAvailable = CopiesAvailable - p
    WHERE BookID = p_BookID;

END //
DELIMITER ;







    

    
    
    