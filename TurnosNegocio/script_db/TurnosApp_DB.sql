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

create Table Personas(
	Id bigint not null primary key identity(1,1),
	Apellidos varchar(100) not null,
	Nombres varchar(100) not null,
	FechaNacimiento date not null Check (FechaNacimiento <= getdate()),
	Sexo char not null Check (Sexo in ('M', 'F', 'O')),
	IdTipoDocumento smallint not null Foreign Key References Tipos_Documentos(Id),
	NroDocumento bigint not null unique,
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

Create Table Profesionales_X_Especialidad(
	Id int not null identity(1,1) unique,
	IdPersona bigint not null Foreign Key References Personas(Id),
	IdEspecialidad int not null Foreign Key References Especialidades(Id),
	CostoConsulta money null check (CostoConsulta >= 0),
	Habilitado bit not null default(1),
	primary key (IdPersona,IdEspecialidad)
)
go

Create Table Estados_Turnos(
	Id smallint not null primary key identity(1,1),
	Descripcion varchar(50) not null,
	Activo bit not null default(1)
)
go

Create Table Turnos(
	Id bigint not null primary key identity(1,1),
	Fecha date not null Check (Fecha >= getdate()),
	Hora time not null,     
	IdProfesional bigint not null,
	IdPaciente bigint not null Foreign Key References Personas(Id),
	Observaciones varchar(MAX) null,
	IdEstado smallint not null Foreign Key References Estados_Turnos(Id)
)

Create Table Perfiles_Usuarios(
	Id smallint not null primary key identity(1,1),
	Descripcion varchar(50) not null,
	Activo bit not null default(1)
)
go

Create Table Perfil_X_Persona(
	IdPersona bigint not null Foreign Key References Personas(Id),
	IdPerfilUsuario smallint not null Foreign Key References Perfiles_Usuarios(Id),
	Activo bit not null default(1), 
	primary key (IdPersona,IdPerfilUsuario)
)
go



