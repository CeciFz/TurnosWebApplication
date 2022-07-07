use master
go
Create Database turnosApp
go
/*Drop Database turnosApp
go*/

Use turnosApp
go

Create Table Tipos_Documentos(
	Id smallint not null primary key identity(1,1),
	Descripcion varchar(50) not null,
	Activo bit not null default(1)
)
go

Create Table Obras_Sociales(
	Id int not null primary key identity(1,1),
	Descripcion varchar(100) not null,
	Activo bit not null default(1)
)
go

Create Table Usuarios(
	Id bigint not null primary key identity(1,1),
	Apellidos varchar(100) not null,
	Nombres varchar(100) not null,
	FechaNacimiento date not null Check (FechaNacimiento <= getdate()),
	Sexo char not null Check (Sexo in ('M', 'F', 'O')),
	IdTipoDocumento smallint not null Foreign Key References Tipos_Documentos(Id),
	NroDocumento bigint not null unique,
	Telefono varchar(50) null,
	Mail varchar(100) null,
	IdObraSocial int null Foreign Key References Obras_Sociales(Id),
	FechaAlta date not null default (getdate()),
	Activo bit not null default(1)
)
go

/*
create Table Pacientes(
	Id bigint not null primary key identity(1,1),
	IdObraSocial int null Foreign Key References Obras_Sociales(Id),
	Habilitado bit not null default(1)
)
go

Create Table Profesionales(
	Id bigint not null primary key identity(1,1),
	CostoConsulta money null check (CostoConsulta >= 0),
	Habilitado bit not null default(1)
)
go*/

Create Table Especialidades(
	Id int not null primary key identity(1,1),
	Descripcion varchar(100) not null,
	Activo bit not null default(1)
)
go

Create Table Estados_Turnos(
	Id smallint not null primary key identity(1,1),
	Descripcion varchar(50) not null,
	Activo bit not null default(1)
)
go

Create Table Perfiles_Usuarios(
	Id smallint not null primary key identity(1,1),
	Descripcion varchar(50) not null,
	Activo bit not null default(1)
)
go

Create Table Perfil_X_Usuario(
	IdUsuario bigint not null Foreign Key References Usuarios(Id),
	IdPerfilUsuario smallint not null Foreign Key References Perfiles_Usuarios(Id),
	Activo bit not null default(1), 
	primary key (IdUsuario,IdPerfilUsuario)
)
go

/****************************/

Create Table Horarios(	
	IdHorario bigint not null primary key identity(1,1),
	Día varchar(10) not null Check (Día in ('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo')),
	Hora_Inicio time(0) not null,
	Hora_Fin time(0) not null,
	Frecuencia smallint not null Check (Frecuencia > 0),
	Activo bit not null default(1),
)	

	--drop Table Horarios    ... ¿hacer idprofesional ?   drop Table Profesionales_X_Especialidad  
	--  drop Table Horario_x_Profesional
	
Create Table Profesionales_x_Especialidad(
	IdUsuario bigint not null Foreign Key References Usuarios(Id),
	IdEspecialidad int not null Foreign Key References Especialidades(Id),
	Habilitado bit not null default(1),
	primary key (IdUsuario,IdEspecialidad)
)
go

Create Table Horario_x_Profesional(
	IdProfesional bigint not null,
	IdEspecialidad int not null,
	IdHorario bigint not null Foreign Key References Horarios(IdHorario),
	Habilitado bit not null default(1),
	foreign key (IdProfesional, IdEspecialidad) references Profesionales_x_Especialidad(IdUsuario, IdEspecialidad),
	primary key (IdProfesional,IdEspecialidad,IdHorario)
)
go

--drop Table Turnos
Create Table Turnos(
	IdTurnos bigint not null primary key identity(1,1),
	IdPaciente bigint not null Foreign Key References Usuarios(Id),
	Fecha date not null Check (Fecha >= getdate()),
	Hora time not null,     
	IdProfesional bigint not null,
	IdEspecialidad int not null,
	IdHorario bigint not null,
	Observaciones varchar(MAX) null,
	IdEstado smallint not null Foreign Key References Estados_Turnos(Id),
	foreign key (IdProfesional, IdEspecialidad,IdHorario) 
	references Horario_x_Profesional(IdProfesional, IdEspecialidad,IdHorario)
)

Select IdUsuario, IdEspecialidad, Especialidad from VW_ProfesionalesConEspecialidad


/*
SELECT (CASE DATENAME(dw,'2019-01-08 00:00:00')
     when 'Monday' then 'LUNES'
     when 'Tuesday' then 'MARTES'
     when 'Wednesday' then 'MIERCOLES'
     when 'Thursday' then 'JUEVES'
     when 'Friday' then 'VIERNES'
     when 'Saturday' then 'SABADO'
     when 'Sunday' then 'DOMINGO'
END

SELECT DATENAME(dw,'2019-01-08')

SELECT (case DATEPART(dw,'2019-01-08 00:00:00') 
when 2 then 'Lunes' when 3 then 'Martes' 
when 4 then 'Miércoles' when 5 then 'Jueves' 
when 6 then 'Viernes' when 7 then 'Sábado' 
when 1 then 'Domingo' end) AS nombreDiaSemana;
*/

/*
create table Marcas
(
    ID int primary key not null identity(1,1),
    nombre varchar(100) not null,
    estado bit not null
)

create table Modelos
(
    ID int not null identity(1,1),
    IDMarca int foreign key references Marcas(ID),
    nombre varchar(100) not null,
    primary key(ID, IDMarca)
)

create table Automoviles
(
    IDMarca int not null,
    IDModelo int not null,
    patente varchar(8) not null,
    foreign key (IDMarca, IDModelo) references Modelos(ID, IDMarca),
    primary key(IDMarca, IDModelo, patente)
)
*/