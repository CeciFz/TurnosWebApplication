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

Create Table Especialidades(
	Id int not null primary key identity(1,1),
	Descripcion varchar(100) not null,
	Activo bit not null default(1)
)
go

create table Ingresos(
Id int not null primary key identity (1,1),
Usuario varchar (50) unique null,
Pass varchar (50) null,
TipoUser int null,
)




go
Create Table Profesionales_X_Especialidad(
	IdUsuario bigint not null Foreign Key References Usuarios(Id),
	IdEspecialidad int not null Foreign Key References Especialidades(Id),
	Habilitado bit not null default(1),
	primary key (IdUsuario,IdEspecialidad)
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

