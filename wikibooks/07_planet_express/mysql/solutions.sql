-- 1. Who received a 1.5kg package?
SELECT Client.Name
  FROM Client INNER JOIN Package ON Package.Recipient = Client.AccountNumber
  WHERE Package.Weight = 1.5

-- 2. What is the total weight of all the packages that he sent?
SELECT SUM(weight) AS 'Total Weight' FROM Package WHERE Sender = (
  SELECT Client.Name
    FROM Client INNER JOIN Package ON Package.Recipient = Client.AccountNumber
    WHERE Package.Weight = 1.5);

-- 3. Which pilots transported those packages?
SELECT Employee.Name
  FROM Employee
  JOIN Shipment ON Shipment.Manager = Employee.EmployeeID
  JOIN Package ON Package.Shipment = Shipment.ShipmentID
  WHERE Shipment.ShipmentID IN (
    SELECT p.Shipment
      FROM Client AS c
      JOIN Package as p
      ON c.AccountNumber = p.Sender
      WHERE c.AccountNumber = (
        SELECT Client.AccountNumber
        FROM Client JOIN Package
        ON Client.AccountNumber = Package.Recipient
        WHERE Package.weight = 1.5
     )
  )
  GROUP BY (Employee.Name);
