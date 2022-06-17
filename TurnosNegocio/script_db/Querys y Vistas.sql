Use turnosApp
go

Select * from Tipos_Documentos
go
Select * from Personas
go
Select * from Obras_Sociales
go
Select * from Especialidades
go
Select * from Profesionales_X_Especialidad   
go
Select * from Estados_Turnos
go
Select * from Turnos   -----------
go
Select * from Perfiles_Usuarios
go
Select * from Perfil_X_Persona   
go


/* VISTA PACIENTES */
Create View VW_Pacientes AS
	Select p.Apellidos, p.Nombres, p.FechaNacimiento, p.Sexo, p.IdTipoDocumento,
	p.IdObraSocial, p.FechaAlta, pp.IdPerfilUsuario
	from Personas p
	inner join Perfil_X_Persona pp on p.Id = pp.IdPersona
	Where pp.IdPerfilUsuario = 3
go


/* VISTA PROFESIONALES */
create View VW_Profesionales AS
	Select p.Apellidos, p.Nombres, p.FechaNacimiento, p.Sexo, p.IdTipoDocumento,
	p.IdObraSocial, p.FechaAlta, pp.IdPerfilUsuario, pxe.CostoConsulta
	from Personas p
	inner join Perfil_X_Persona pp on p.Id = pp.IdPersona
	inner join Profesionales_X_Especialidad pxe on p.id = pxe.IdPersona
	Where pp.IdPerfilUsuario = 4
go


/* VISTA ADMINS */
Create View VW_Admins AS
	Select p.Apellidos, p.Nombres, p.FechaNacimiento, p.Sexo, p.IdTipoDocumento,
	p.IdObraSocial, p.FechaAlta, pp.IdPerfilUsuario
	from Personas p
	inner join Perfil_X_Persona pp on p.Id = pp.IdPersona
	Where pp.IdPerfilUsuario = 1
go


/* VISTA GESTORES */
Create View VW_Gestores AS
	Select p.Apellidos, p.Nombres, p.FechaNacimiento, p.Sexo, p.IdTipoDocumento,
	p.IdObraSocial, p.FechaAlta, pp.IdPerfilUsuario
	from Personas p
	inner join Perfil_X_Persona pp on p.Id = pp.IdPersona
	Where pp.IdPerfilUsuario = 2
go



Select * from VW_Pacientes  
go

Select * from VW_Profesionales  
go

Select * from VW_Admins  
go

Select * from VW_Gestores  
go