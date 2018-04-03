-- 1. Select the name of all the pieces.
SELECT Name FROM Pieces;

-- 2. Select all the providers' data.
SELECT * FROM Providers;

-- 3. Obtain the average price of each piece (show only the piece code and the average price).
SELECT AVG(Price), Piece FROM Provides GROUP BY Piece;

-- 4. Obtain the names of all providers who supply piece 1.
SELECT Providers.Name FROM Provides INNER JOIN Providers ON Providers.Code = Provides.Provider AND Provides.Piece = 1;
SELECT Name FROM Providers WHERE Code IN (
  SELECT Provider FROM Provides WHERE Piece = 1);

-- 5. Select the name of pieces provided by provider with code "HAL".
SELECT Pieces.Name FROM Pieces INNER JOIN Provides ON Proivdes.Piece = Pieces.Code AND Provides.Text = 'HAL';
SELECT Name FROM Pieces WHERE Code IN (
  SELECT Piece FROM Provides WHERE Provider = 'HAL');
SELECT Name FROM Pieces WHERE EXISTS (
  SELECT * FROM Provides WHERE = 'HAL' AND Piece = Pieces.Code);

-- 6. For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price (note that there could be two providers who supply the same piece at the most expensive price).
SELECT Piece.Name, Providers.Name, Provides.Price FROM Provides
  INNER JOIN Pieces ON Pieces.Code = Provides.Piece
  INNER JOIN Providers ON Providers.Code = Provides.Provider
  WHERE Provides.Price = (
    SELECT MAX(Price) FROM Provides WHERE Piece = Prices.Code);

-- 7. Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
INSERT INTO Provides VALUES (1, 'TNBC', 7);

-- 8. Increase all prices by one cent.
UPDATE Provides SET Price = Price + 1;

-- 9. Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
DELETE FROM Provides WHERE Provider = 'RBT' AND Piece = 4;

-- 10. Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces (the provider should still remain in the database).
DELETE FROM Provides WHERE Provider = 'RBT';


