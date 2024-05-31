CREATE DATABASE LibraryDatabase2;
USE LibraryDatabase2;

CREATE TABLE BOOKS (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(50),
    Author VARCHAR(50),
    YearPublished INT,
    Genre VARCHAR(50),
    CopiesAvailable INT NOT NULL DEFAULT (0)
);


CREATE TABLE USERS(
	UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Adress VARCHAR(255)
    );
    
ALTER TABLE USERS CHANGE Adress Address VARCHAR(255);

    
CREATE TABLE LOANS(
	LoanID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    UserID INT,
    Active BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (BookID) REFERENCES BOOKS(BookID),
    FOREIGN KEY (UserID) REFERENCES USERS(UserID)
    );
    


    
