use BIOSHOP

insert into Customers (name, surname, email)
values 
('Paulina','Petra','paulinapetra@gmail.com'), 
('Aneta','Duster','anetaduster@gmail.com'),
('Nestor','Roslga','nestoralga@gmail.com'),
('Moad','Bentana','moadben@gmail.com')

insert into Products(ProductName, Price)
values 
('kasza gryczana',3.52 ), 
('kasza jaglana',2.88),
('cuscus',4.14 ),
('kasza peczak',5.12),
('quinoa',6.00),
('bulgur',4.25),
('amarantus',3.99),
('kasza jeczmienna',3.55),
('kasza owsiana',3.69),
('kasza orkiszowa',3.34),
('kasza manna',2.74),
('kasza kukurydziana',3.41)

insert into Suppliers(SupplierName, Address)
values 
('Jan Kowalski','ul. Rumiankowa 34, 62-022 Daszewice' ),
('Adam Nowak','ul. Strychowa 55/1, 62-033 Korygowo'),
('Renata Duda','ul. Kamienna 2, 61-246 Straczki'),
('Zbigniew Kaczka','ul. Statek 8, 55-351 Wagrowo Gorne')

insert into Orders(CustomerId, OrderDate)
values 
(1,'2023-09-20'),
(1,'2023-09-22'),
(1,'2023-09-24'),
(1,'2023-09-26'),
(1,'2023-09-28'),
(1,'2023-09-30'),
(2,'2023-09-20'),
(2,'2023-09-20'),
(2,'2023-09-22'),
(2,'2023-09-30'),
(3,'2023-09-21'),
(3,'2023-09-23'),
(3,'2023-09-25'),
(3,'2023-09-27'),
(3,'2023-09-29'),
(3,'2023-10-01'),
(4,'2023-09-20'),
(4,'2023-09-22'),
(4,'2023-09-23'),
(4,'2023-09-24'),
(4,'2023-09-27'),
(4,'2023-09-28'),
(4,'2023-09-29')

insert into OrderDetails(OrderId, ProductId, Quantity)
values 
(1,1,5),
(1,4,4),
(2,3,1),
(2,5,10),
(2,6,1),
(2,7,6),
(3,9,10),
(4,4,7),
(4,10,1),
(4,11,4),
(4,12,4),
(5,5,17),
(6,1,1),
(7,2,8),
(8,3,2),
(8,6,2),
(8,10,1),
(9,1,3),
(9,2,3),
(10,5,1),
(11,1,5),
(11,2,5),
(12,11,9),
(12,12,8),
(12,7,8),
(13,5,10),
(13,6,10),
(14,10,10),
(14,9,10),
(14,3,15),
(15,5,20),
(16,11,7),
(17,3,6),
(18,6,5),
(19,11,2),
(20,5,1),
(21,7,3),
(22,3,15)

insert into SupplierProducts(SupplierId, ProductId)
values 
(1,3),
(1,5),
(1,6),
(1,7),
(2,11),
(2,12),
(3,1),
(3,2),
(3,4),
(3,8),
(3,9),
(3,10),
(3,11),
(3,12),
(4,3),
(4,6)
  