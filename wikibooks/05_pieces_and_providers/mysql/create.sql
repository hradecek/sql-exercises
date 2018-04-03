 -- CREATE TABLE Pieces (
 --   Code INTEGER PRIMARY KEY NOT NULL,
 --   Name VARCHAR(255) NOT NULL
 -- );
CREATE TABLE Providers (
  Code VARCHAR(40),
  PRIMARY KEY NOT NULL,
  Name VARCHAR(255) NOT NULL
);

CREATE TABLE Provides (
  Piece INTEGER,
  FOREIGN KEY (Piece) REFERENCES Pieces(Code),
  Provider VARCHAR(40),
  FOREIGN KEY (Provider) REFERENCES Providers(Code),
  Price INTEGER NOT NULL,
  PRIMARY KEY(Piece, Provider)
) ENGINE=InnoDB;
