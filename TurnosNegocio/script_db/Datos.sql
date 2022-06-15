Use turnosApp
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


/* PERSONAS */

SET IDENTITY_INSERT [dbo].[Personas] ON 
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (1,'Maldonado','Alex',N'24/03/1994' ,'M',1,30459252)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (2,'Longo','Enrico',N'09/08/1997' ,'M',1,39459251)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (3,'Paredes','Helen',N'29/03/1988' ,'F',1,39459183)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (4,'González','Paolo',N'06/10/2002' ,'F',1,39259109)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (5,'Salazar','Angela',N'05/01/1968' ,'M',1,39459199)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (6,'Rizzo','Yarela',N'17/10/1956' ,'F',1,39449105)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (7,'Palma','Marco',N'29/12/1971' ,'F',1,39453671)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (8,'Cavallo','Joakin',N'12/10/1967' ,'F',1,59459101)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (9,'Costantini','Gianluca',N'22/05/1966' ,'F',1,33459099)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (10,'Ceccarelli','Angelo',N'10/09/1961' ,'M',1,39459192)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (11,'Henríquez','Alessandra',N'15/07/1993' ,'M',1,39459167)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (12,'Olivares','Giancarlo',N'05/11/1956' ,'F',1,39459165)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (13,'Proietti','Andy',N'15/04/2009' ,'M',1,39459163)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (14,'Costa','Lara',N'17/07/1975' ,'F',1,39459161)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (15,'Espinoza','Daniela',N'03/07/1966' ,'M',1,39459159)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (16,'Mele','Miriam',N'25/07/1993' ,'F',1,39459157)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (17,'Sánchez','Martinna',N'08/10/1989' ,'F',1,39459155)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (18,'Morales','Cristiano',N'06/06/1994' ,'F',5,7855446043)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (19,'Pérez','Mattia',N'01/04/1966' ,'F',5,6455544751)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (20,'Silva','Anna',N'13/07/1982' ,'M',1,39459149)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (21,'García','Genaro',N'10/09/1958' ,'M',1,39459147)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (22,'Montanari','Davor',N'03/06/2006' ,'F',1,39459145)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (23,'Alvarado','Felipe',N'13/04/1960' ,'F',1,39459255)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (24,'Lombardo','Melany',N'07/12/2005' ,'M',1,39459252)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (25,'Herrera','Dastin',N'14/12/1948' ,'F',3,39459249)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (26,'Bernardi','Alice',N'21/02/1945' ,'M',2,39459246)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (27,'Proietti','Beatrice',N'10/03/2009' ,'F',1,39459243)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (28,'Araya','Violeta',N'10/04/1948' ,'F',2,39459240)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (29,'Morales','Gianni',N'15/12/1946' ,'F',2,5670018)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (30,'Sanna','Mario',N'10/02/1981' ,'F',1,39459129)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (31,'De Angelis','Sarah',N'01/01/1947' ,'M',1,39459127)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (32,'Giordano','Leonor',N'01/03/1956' ,'M',1,39459125)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (33,'Silvestri','Nicolò',N'15/01/2006' ,'F',4,412459)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (34,'Martínez','Alessio',N'26/01/1984' ,'F',1,39459121)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (35,'Donoso','Beatrice',N'12/12/2006' ,'F',1,39459119)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (36,'Escobar','Francesco',N'08/07/1982' ,'M',1,39459117)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (37,'Silva','Arianna',N'07/09/1976' ,'M',1,39459115)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (38,'Ortega','Valerio',N'10/05/2005' ,'F',1,39459113)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (39,'Bustos','Armando',N'30/01/2010' ,'M',1,39459111)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (40,'Morales','Roger',N'08/10/1963' ,'M',1,39459109)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (41,'Sanhueza','Paola',N'25/12/1976' ,'M',1,39459107)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (42,'Peña','Alfredo',N'04/03/1980' ,'M',1,39459105)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (43,'Peña','Lidia',N'25/05/1951' ,'M',1,39459103)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (44,'García','Margherita',N'31/08/1994' ,'F',1,39459101)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (45,'Figueroa','Flor',N'11/12/1994' ,'M',1,39459099)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (46,'Sandoval','Ema',N'16/09/1954' ,'M',1,39459097)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (47,'Ricciardi','Matilde',N'21/11/1965' ,'F',1,39459095)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (48,'Serra','Giacomo',N'27/06/1950' ,'M',1,39459093)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (49,'Carrasco','Greta',N'06/12/1977' ,'M',1,39459091)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (50,'Basile','Ainara',N'14/01/1976' ,'M',1,39459089)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (51,'Lombardo','Ginevra',N'21/12/1970' ,'M',4,2597623)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (52,'Greco','Alessia',N'14/05/1960' ,'M',1,39459085)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (53,'Henríquez','Junior',N'08/09/2003' ,'M',4,8982671)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (54,'Bravo','Gaia',N'19/12/1984' ,'F',1,39459081)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (55,'Leone','Cindy',N'03/10/1976' ,'M',1,39459079)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (56,'Herrera','Jhonatan',N'02/08/1992' ,'F',1,39459077)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (57,'De Rosa','Camilla',N'01/03/1955' ,'M',1,39459075)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (58,'López','Roberto',N'28/05/1996' ,'M',1,39459073)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (59,'Pino','León',N'24/05/1987' ,'M',1,39459071)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (60,'Valente','Monica',N'19/08/2010' ,'M',1,39459069)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (61,'Castillo','Estrella',N'25/09/1948' ,'F',1,39459067)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (62,'Bustamante','Lara',N'17/12/1978' ,'M',1,39459065)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (63,'Ortega','Mijael',N'24/09/1950' ,'M',1,39459063)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (64,'Rizzi','Alice',N'18/03/1963' ,'F',5,3366521)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (65,'San Martín','Domenico',N'14/03/1969' ,'F',1,39459059)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (66,'Espinoza','Aymara',N'31/01/2005' ,'M',5,3466917)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (67,'Sandoval','Simone',N'13/07/1984' ,'F',1,39459055)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (68,'Pérez','Vicente',N'14/07/1997' ,'M',1,39459053)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (69,'Messina','Ginevra',N'28/03/1996' ,'F',1,39459051)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (70,'García','Jasmín',N'12/09/2007' ,'M',1,39459049)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (71,'Conti','Nicolò',N'10/01/1947' ,'M',3,3985977)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (72,'Giorgi','Alessandro',N'25/10/1997' ,'M',4,1541579)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (73,'Valdés','Maite',N'21/08/1951' ,'M',1,39459043)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (74,'Longo','Ivanna',N'06/01/1997' ,'M',1,39459041)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (75,'Peña','Axcel',N'23/09/1971' ,'M',1,39459039)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (76,'Guzmán','Andrea',N'08/05/1985' ,'F',1,39459037)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (77,'Parra','Blanca',N'27/03/1960' ,'F',1,39459035)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (78,'Arena','Alain',N'20/10/1979' ,'F',1,39459033)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (79,'López','Josue',N'08/04/1996' ,'M',1,39459031)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (80,'Rodríguez','Francia',N'13/11/1987' ,'F',1,39459029)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (81,'Ruiz','Samuele',N'18/07/1960' ,'M',1,39459027)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (82,'Giuliani','Caterina',N'19/11/1960' ,'M',1,39459025)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (83,'Calabrese','Filippo',N'08/11/1984' ,'M',1,39459023)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (84,'Campos','Evans',N'26/06/1993' ,'M',1,39459021)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (85,'Soto','Gabriel',N'17/08/1947' ,'M',3,3945924)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (86,'Silvestri','Luca',N'26/05/1996' ,'F',1,39459017)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (87,'Lagos','Ismael',N'10/11/1952' ,'M',1,39459015)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (88,'Parra','Mayra',N'06/04/1958' ,'F',1,39459013)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (89,'Henríquez','Adiel',N'09/09/1955' ,'F',1,39459011)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (90,'Poblete','Thyare',N'06/03/1954' ,'M',1,39459009)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (91,'Jiménez','Anahy',N'19/05/2008' ,'F',1,39459007)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (92,'Riquelme','Noemi',N'23/12/1950' ,'M',1,39459005)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (93,'Rodríguez','Josepha',N'26/10/1993' ,'M',1,39459003)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (94,'Rizzo','Caroline',N'22/05/2000' ,'M',1,39459001)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (95,'Zúñiga','Mirko',N'09/04/1973' ,'F',5,22458999)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (96,'Ruggiero','Rodolfo',N'14/03/1994' ,'M',1,39458997)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (97,'Fumagalli','Christofer',N'17/03/2002' ,'M',1,39458995)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (98,'Ricciardi','Randy',N'09/02/1973' ,'F',1,39458993)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (99,'Colombo','Yesenia',N'14/01/1983' ,'M',1,39458991)
INSERT [dbo].[Personas] ([Id],[Apellidos],[Nombres],[FechaNacimiento],[Sexo],[IdTipoDocumento],[NroDocumento]) VALUES (100,'Montanari','Nicoletta',N'05/01/1952' ,'M',1,39458989)
SET IDENTITY_INSERT [dbo].[Personas] OFF 


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

/* PERFILES USUARIOS */
SET IDENTITY_INSERT [dbo].[Perfiles_Usuarios] ON 
INSERT [dbo].[Perfiles_Usuarios] ([Id], [Descripcion]) VALUES (1, N'Admin')
INSERT [dbo].[Perfiles_Usuarios] ([Id], [Descripcion]) VALUES (2, N'Gestión')
INSERT [dbo].[Perfiles_Usuarios] ([Id], [Descripcion]) VALUES (3, N'Paciente')
INSERT [dbo].[Perfiles_Usuarios] ([Id], [Descripcion]) VALUES (4, N'Profesional')
SET IDENTITY_INSERT [dbo].[Perfiles_Usuarios] OFF

