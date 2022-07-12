﻿Use turnosApp
go
SET DATEFORMAT 'DMY'
go

/* TIPOS DE DOCUMENTOS */
SET IDENTITY_INSERT [dbo].[Tipos_Documentos] ON 
INSERT [dbo].[Tipos_Documentos] ([Id], [Descripcion]) VALUES (1, N'Documento único')
INSERT [dbo].[Tipos_Documentos] ([Id], [Descripcion]) VALUES (2, N'Libreta cívica')
INSERT [dbo].[Tipos_Documentos] ([Id], [Descripcion]) VALUES (3, N'Libreta de enrolamiento')
INSERT [dbo].[Tipos_Documentos] ([Id], [Descripcion]) VALUES (4, N'Pasaporte')
INSERT [dbo].[Tipos_Documentos] ([Id], [Descripcion]) VALUES (5, N'Carnet de extranjería')
INSERT [dbo].[Tipos_Documentos] ([Id], [Descripcion]) VALUES (6, N'Otros')
SET IDENTITY_INSERT [dbo].[Tipos_Documentos] OFF


/* OBRAS SOCIALES */
SET IDENTITY_INSERT [dbo].[Obras_Sociales] ON 
INSERT [dbo].[Obras_Sociales]  (Id, Descripcion) VALUES (1, 'Pami')
INSERT [dbo].[Obras_Sociales]  (Id, Descripcion ) VALUES (2, 'Galeno')
INSERT [dbo].[Obras_Sociales]  (Id, Descripcion ) VALUES (3, 'Osde')
INSERT [dbo].[Obras_Sociales]  (Id, Descripcion ) VALUES (4, 'Osba')
INSERT [dbo].[Obras_Sociales] (Id, Descripcion ) VALUES (5, 'Swiss Medical')
INSERT [dbo].[Obras_Sociales]  (Id, Descripcion ) VALUES (6, 'Uthgra')
INSERT [dbo].[Obras_Sociales]  (Id, Descripcion ) VALUES (7, 'Osdepym')
INSERT [dbo].[Obras_Sociales]  (Id, Descripcion ) VALUES (8, 'Ioma')
INSERT [dbo].[Obras_Sociales]  (Id, Descripcion ) VALUES (9, 'Accord')
INSERT [dbo].[Obras_Sociales]  (Id, Descripcion ) VALUES (10, 'Medicus')
SET IDENTITY_INSERT [dbo].[Obras_Sociales] OFF

/* USUARIOS */

SET IDENTITY_INSERT [dbo].[Usuarios] ON 
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[Telefono],[Mail],[IdObraSocial]) VALUES (1,'Maldonado','Alex',N'24/03/1994' ,'M',1,30459252,11250202,'Maldonado@gmail.com',6)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[Telefono],[Mail],[IdObraSocial]) VALUES (2,'Longo','Enrico',N'09/08/1997' ,'M',1,39459251,11257562,'longo@gmail.com',1)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[Telefono],[Mail],[IdObraSocial]) VALUES (3,'Paredes','Helen',N'29/03/1988' ,'F',1,39459183,11235960,'peredeshelen@gmail.com',10)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (4,'González','Paolo',N'06/10/2002' ,'F',1,39259109,6)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (5,'Salazar','Angela',N'05/01/1968' ,'M',1,39459199,4)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (6,'Rizzo','Yarela',N'17/10/1956' ,'F',1,39449105,2)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (7,'Palma','Marco',N'29/12/1971' ,'F',1,39453671,1)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (8,'Cavallo','Joakin',N'12/10/1967' ,'F',1,59459101,10)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (9,'Costantini','Gianluca',N'22/05/1966' ,'F',1,33459099,9)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (10,'Ceccarelli','Angelo',N'10/09/1961' ,'M',1,39459192,2)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (11,'Henríquez','Alessandra',N'15/07/1993' ,'M',1,39459167,5)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (12,'Olivares','Giancarlo',N'05/11/1956' ,'F',1,39459165,2)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (13,'Proietti','Andy',N'15/04/2009' ,'M',1,39459163,5)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (14,'Costa','Lara',N'17/07/1975' ,'F',1,39459161,4)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (15,'Espinoza','Daniela',N'03/07/1966' ,'M',1,39459159,2)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (16,'Mele','Miriam',N'25/07/1993' ,'F',1,39459157,2)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (17,'Sánchez','Martinna',N'08/10/1989' ,'F',1,39459155,5)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (18,'Morales','Cristiano',N'06/06/1994' ,'F',5,7855446043,8)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (19,'Pérez','Mattia',N'01/04/1966' ,'F',5,6455544751,10)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (20,'Silva','Anna',N'13/07/1982' ,'M',1,39459149,6)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (21,'García','Genaro',N'10/09/1958' ,'M',1,39459147,9)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (22,'Montanari','Davor',N'03/06/2006' ,'F',1,39459145,6)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (23,'Alvarado','Felipe',N'13/04/1960' ,'F',1,39459255,4)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (24,'Lombardo','Melany',N'07/12/2005' ,'M',1,39459252,4)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (25,'Herrera','Dastin',N'14/12/1948' ,'F',3,39459249,1)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (26,'Bernardi','Alice',N'21/02/1945' ,'M',2,39459246,5)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (27,'Proietti','Beatrice',N'10/03/2009' ,'F',1,39459243,10)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (28,'Araya','Violeta',N'10/04/1948' ,'F',2,39459240,9)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (29,'Morales','Gianni',N'15/12/1946' ,'F',2,5670018,8)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (30,'Sanna','Mario',N'10/02/1981' ,'F',1,39459129,1)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (31,'De Angelis','Sarah',N'01/01/1947' ,'M',1,39459127,9)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (32,'Giordano','Leonor',N'01/03/1956' ,'M',1,39459125,5)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (33,'Silvestri','Nicolò',N'15/01/2006' ,'F',4,412459,3)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (34,'Martínez','Alessio',N'26/01/1984' ,'F',1,39459121,4)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (35,'Donoso','Beatrice',N'12/12/2006' ,'F',1,39459119,10)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (36,'Escobar','Francesco',N'08/07/1982' ,'M',1,39459117,1)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (37,'Silva','Arianna',N'07/09/1976' ,'M',1,39459115,4)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (38,'Ortega','Valerio',N'10/05/2005' ,'F',1,39459113,3)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (39,'Bustos','Armando',N'30/01/2010' ,'M',1,39459111,9)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (40,'Morales','Roger',N'08/10/1963' ,'M',1,39459109,8)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (41,'Sanhueza','Paola',N'25/12/1976' ,'M',1,39459107,8)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (42,'Peña','Alfredo',N'04/03/1980' ,'M',1,39459105,3)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (43,'Peña','Lidia',N'25/05/1951' ,'M',1,39459103,6)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (44,'García','Margherita',N'31/08/1994' ,'F',1,39459101,3)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (45,'Figueroa','Flor',N'11/12/1994' ,'M',1,39459099,8)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (46,'Sandoval','Ema',N'16/09/1954' ,'M',1,39459097,10)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (47,'Ricciardi','Matilde',N'21/11/1965' ,'F',1,39459095,10)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (48,'Serra','Giacomo',N'27/06/1950' ,'M',1,39459093,8)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (49,'Carrasco','Greta',N'06/12/1977' ,'M',1,39459091,1)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (50,'Basile','Ainara',N'14/01/1976' ,'M',1,39459089,4)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (51,'Lombardo','Ginevra',N'21/12/1970' ,'M',4,2597623,1)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (52,'Greco','Alessia',N'14/05/1960' ,'M',1,39459085,7)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (53,'Henríquez','Junior',N'08/09/2003' ,'M',4,8982671,2)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (54,'Bravo','Gaia',N'19/12/1984' ,'F',1,39459081,10)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (55,'Leone','Cindy',N'03/10/1976' ,'M',1,39459079,1)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (56,'Herrera','Jhonatan',N'02/08/1992' ,'F',1,39459077,9)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (57,'De Rosa','Camilla',N'01/03/1955' ,'M',1,39459075,2)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (58,'López','Roberto',N'28/05/1996' ,'M',1,39459073,2)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (59,'Pino','León',N'24/05/1987' ,'M',1,39459071,7)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (60,'Valente','Monica',N'19/08/2010' ,'M',1,39459069,10)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (61,'Castillo','Estrella',N'25/09/1948' ,'F',1,39459067,6)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (62,'Bustamante','Lara',N'17/12/1978' ,'M',1,39459065,7)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (63,'Ortega','Mijael',N'24/09/1950' ,'M',1,39459063,7)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (64,'Rizzi','Alice',N'18/03/1963' ,'F',5,3366521,5)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (65,'San Martín','Domenico',N'14/03/1969' ,'F',1,39459059,3)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (66,'Espinoza','Aymara',N'31/01/2005' ,'M',5,3466917,4)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (67,'Sandoval','Simone',N'13/07/1984' ,'F',1,39459055,7)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (68,'Pérez','Vicente',N'14/07/1997' ,'M',1,39459053,6)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (69,'Messina','Ginevra',N'28/03/1996' ,'F',1,39459051,5)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (70,'García','Jasmín',N'12/09/2007' ,'M',1,39459049,6)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (71,'Conti','Nicolò',N'10/01/1947' ,'M',3,3985977,9)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (72,'Giorgi','Alessandro',N'25/10/1997' ,'M',4,1541579,8)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (73,'Valdés','Maite',N'21/08/1951' ,'M',1,39459043,3)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (74,'Longo','Ivanna',N'06/01/1997' ,'M',1,39459041,5)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (75,'Peña','Axcel',N'23/09/1971' ,'M',1,39459039,1)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (76,'Guzmán','Andrea',N'08/05/1985' ,'F',1,39459037,9)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (77,'Parra','Blanca',N'27/03/1960' ,'F',1,39459035,10)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (78,'Arena','Alain',N'20/10/1979' ,'F',1,39459033,7)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (79,'López','Josue',N'08/04/1996' ,'M',1,39459031,8)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (80,'Rodríguez','Francia',N'13/11/1987' ,'F',1,39459029,7)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (81,'Ruiz','Samuele',N'18/07/1960' ,'M',1,39459027,5)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (82,'Giuliani','Caterina',N'19/11/1960' ,'M',1,39459025,2)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (83,'Calabrese','Filippo',N'08/11/1984' ,'M',1,39459023,8)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (84,'Campos','Evans',N'26/06/1993' ,'M',1,39459021,7)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (85,'Soto','Gabriel',N'17/08/1947' ,'M',3,3945924,6)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (86,'Silvestri','Luca',N'26/05/1996' ,'F',1,39459017,4)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (87,'Lagos','Ismael',N'10/11/1952' ,'M',1,39459015,3)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (88,'Parra','Mayra',N'06/04/1958' ,'F',1,39459013,3)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (89,'Henríquez','Adiel',N'09/09/1955' ,'F',1,39459011,3)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (90,'Poblete','Thyare',N'06/03/1954' ,'M',1,39459009,1)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (91,'Jiménez','Anahy',N'19/05/2008' ,'F',1,39459007,4)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (92,'Riquelme','Noemi',N'23/12/1950' ,'M',1,39459005,7)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (93,'Rodríguez','Josepha',N'26/10/1993' ,'M',1,39459003,5)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (94,'Rizzo','Caroline',N'22/05/2000' ,'M',1,39459001,6)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (95,'Zúñiga','Mirko',N'09/04/1973' ,'F',5,22458999,9)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (96,'Ruggiero','Rodolfo',N'14/03/1994' ,'M',1,39458997,7)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (97,'Fumagalli','Christofer',N'17/03/2002' ,'M',1,39458995,2)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (98,'Ricciardi','Randy',N'09/02/1973' ,'F',1,39458993,9)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (99,'Colombo','Yesenia',N'14/01/1983' ,'M',1,39458991,8)
INSERT [dbo].[Usuarios] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento],[IdObraSocial]) VALUES (100,'Montanari','Nicoletta',N'05/01/1952' ,'M',1,39458989,3)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF 



/* ESPECIALIDADES */
SET IDENTITY_INSERT [dbo].[Especialidades] ON 
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (1, 'Médica Clínico')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (2, 'Cardiología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (3, 'Gastroenterología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (4, 'Pediatría')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (5, 'Endocrinología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (6, 'Odontología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (7, 'Neurología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (8, 'Neumología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (9, 'Nutrición')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (10, 'Oftalmología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (11, 'Oncología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (12, 'Psiquiatría')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (13, 'Reumatología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (14, 'Urología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (15, 'Proctología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (16, 'Dermatología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (17, 'Cirugía General')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (18, 'Análisis Clínicos')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (19, 'Análisis De Anatomía Patológica')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (20, 'Análisis De Microbiología Y Parasitología')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (21, 'Análisis De Geńetica Médica')
INSERT [dbo].[Especialidades] (Id, Descripcion) VALUES (22, 'Análisis De Medicina Nuclear')
SET IDENTITY_INSERT [dbo].[Especialidades] OFF



INSERT [dbo].[Ingresos] ( [Usuario], [Pass], [TipoUser]) VALUES ('utn','utn',2)
INSERT [dbo].[Ingresos] ( [Usuario], [Pass], [TipoUser]) VALUES ('utn1','utn1',1)



/* ESTADOS TURNOS */
SET IDENTITY_INSERT [dbo].[Estados_Turnos] ON 
INSERT [dbo].[Estados_Turnos] ([Id], [Descripcion]) VALUES (1, N'Asignado')
INSERT [dbo].[Estados_Turnos] ([Id], [Descripcion]) VALUES (2, N'Reprogramado')
INSERT [dbo].[Estados_Turnos] ([Id], [Descripcion]) VALUES (3, N'No asistó')
INSERT [dbo].[Estados_Turnos] ([Id], [Descripcion]) VALUES (4, N'Cancelado')
INSERT [dbo].[Estados_Turnos] ([Id], [Descripcion]) VALUES (5, N'Asistió')
SET IDENTITY_INSERT [dbo].[Estados_Turnos] OFF

/* PERFILES USUARIOS */
SET IDENTITY_INSERT [dbo].[Perfiles_Usuarios] ON 
INSERT [dbo].[Perfiles_Usuarios] ([Id], [Descripcion]) VALUES (1, N'Admin')
INSERT [dbo].[Perfiles_Usuarios] ([Id], [Descripcion]) VALUES (2, N'Gestión')
INSERT [dbo].[Perfiles_Usuarios] ([Id], [Descripcion]) VALUES (3, N'Paciente')
INSERT [dbo].[Perfiles_Usuarios] ([Id], [Descripcion]) VALUES (4, N'Profesional')
SET IDENTITY_INSERT [dbo].[Perfiles_Usuarios] OFF


/* PERFIL POR usuario */
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (1,1)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (4,1)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (78,2)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (6,2)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (60,2)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (92,2)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (50,2)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (34,2)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (56,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (23,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (31,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (96,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (64,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (68,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (16,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (18,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (14,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (95,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (26,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (53,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (81,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (30,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (8,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (63,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (49,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (41,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (38,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (35,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (84,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (91,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (57,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (86,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (85,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (74,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (89,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (44,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (43,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (24,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (28,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (21,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (100,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (7,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (46,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (77,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (72,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (71,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (76,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (45,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (3,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (73,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (48,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (66,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (40,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (5,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (87,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (42,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (9,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (67,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (80,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (82,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (98,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (27,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (99,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (10,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (79,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (62,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (32,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (83,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (36,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (88,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (33,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (61,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (39,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (12,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (59,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (55,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (19,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (70,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (58,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (69,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (52,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (2,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (17,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (93,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (20,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (54,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (75,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (13,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (47,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (51,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (11,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (25,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (29,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (37,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (22,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (90,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (15,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (65,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (97,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (94,4)

INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (1,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (4,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (23,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (24,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (26,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (27,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (28,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (30,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (31,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (32,4)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (6,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (34,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (50,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (60,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (78,3)
INSERT [dbo].[Perfil_X_Usuario] ([IdUsuario], [IdPerfilUsuario]) VALUES (92,3)


/* HORARIOS */
INSERT [dbo].[Horarios] ([Día],[Hora_Inicio],[Hora_Fin],[Frecuencia]) VALUES ('Lunes','8:00','13:00',30)
INSERT [dbo].[Horarios] ([Día],[Hora_Inicio],[Hora_Fin],[Frecuencia]) VALUES ('Miércoles','13:00','18:00',30)
INSERT [dbo].[Horarios] ([Día],[Hora_Inicio],[Hora_Fin],[Frecuencia]) VALUES ('Viernes','10:00','15:00',30)
INSERT [dbo].[Horarios] ([Día],[Hora_Inicio],[Hora_Fin],[Frecuencia]) VALUES ('Viernes','9:00','14:00',30)
INSERT [dbo].[Horarios] ([Día],[Hora_Inicio],[Hora_Fin],[Frecuencia]) VALUES ('Jueves','8:00','12:00',60)
INSERT [dbo].[Horarios] ([Día],[Hora_Inicio],[Hora_Fin],[Frecuencia]) VALUES ('Jueves','14:00','18:00',60)
INSERT [dbo].[Horarios] ([Día],[Hora_Inicio],[Hora_Fin],[Frecuencia]) VALUES ('Lunes','7:00','11:00',30)
INSERT [dbo].[Horarios] ([Día],[Hora_Inicio],[Hora_Fin],[Frecuencia]) VALUES ('Martes','14:00','19:00',30)




/* PROFESIONAL X ESPECIALIDAD */
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (55,3)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (19,17)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (70,11)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (58,14)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (69,9)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (52,8)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (2,13)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (17,15)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (93,16)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (20,6)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (54,2)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (75,5)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (13,12)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (47,7)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (51,4)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (11,1)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (25,10)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (29,18)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (37,19)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (22,20)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (90,21)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (15,22)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (65,1)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (97,6)
INSERT [dbo].[Profesionales_X_Especialidad] ([IdUsuario], [IdEspecialidad]) VALUES (94,2)


/* HORARIO X PROFESIONAL */
INSERT [dbo].[Horario_x_Profesional] ([IdProfesional], [IdEspecialidad],[IdHorario]) VALUES (11,1,1)
INSERT [dbo].[Horario_x_Profesional] ([IdProfesional], [IdEspecialidad],[IdHorario]) VALUES (11,1,2)
INSERT [dbo].[Horario_x_Profesional] ([IdProfesional], [IdEspecialidad],[IdHorario]) VALUES (11,1,3)
INSERT [dbo].[Horario_x_Profesional] ([IdProfesional], [IdEspecialidad],[IdHorario]) VALUES (2,13,4)
INSERT [dbo].[Horario_x_Profesional] ([IdProfesional], [IdEspecialidad],[IdHorario]) VALUES (13,12,5)
INSERT [dbo].[Horario_x_Profesional] ([IdProfesional], [IdEspecialidad],[IdHorario]) VALUES (13,12,6)
INSERT [dbo].[Horario_x_Profesional] ([IdProfesional], [IdEspecialidad],[IdHorario]) VALUES (15,22,7)
INSERT [dbo].[Horario_x_Profesional] ([IdProfesional], [IdEspecialidad],[IdHorario]) VALUES (17,15,8)
INSERT [dbo].[Horario_x_Profesional] ([IdProfesional], [IdEspecialidad],[IdHorario]) VALUES (25,10,8)
INSERT [dbo].[Horario_x_Profesional] ([IdProfesional], [IdEspecialidad],[IdHorario]) VALUES (65,1,8)
INSERT [dbo].[Horario_x_Profesional] ([IdProfesional], [IdEspecialidad],[IdHorario]) VALUES (55,3,8)

Select*from Profesionales_x_Especialidad pe
inner join Especialidades e on e.id = pe.idespecialidad
order by e.Descripcion
/* TURNOS */
/*
SELECT * FROM Horarios
SELECT * FROM TURNOS
SELECT * FROM Profesionales_X_Especialidad
*/