Use turnosApp
go

/* VISTA PACIENTES */
Create View VW_Pacientes AS
	Select u.Apellidos, u.Nombres, u.FechaNacimiento, u.Sexo, u.IdTipoDocumento,u.telefono,u.mail,
	u.IdObraSocial, u.FechaAlta, pu.IdPerfilUsuario
	from Usuarios u
	inner join Perfil_X_Usuario pu on u.Id = pu.IdUsuario
	Where pu.IdPerfilUsuario = 3
go


/* VISTA PROFESIONALES */
Create View VW_Profesionales AS
	Select u.Id, u.Apellidos, u.Nombres, u.FechaNacimiento, u.Sexo, u.IdTipoDocumento,u.telefono,u.mail,
	u.IdObraSocial, u.FechaAlta, pu.IdPerfilUsuario,e.Descripcion, pxe.CostoConsulta
	from Usuarios u
	inner join Perfil_X_Usuario pu on u.Id = pu.IdUsuario
	inner join Profesionales_X_Especialidad pxe on u.id = pxe.IdUsuario
	inner join Especialidades e on pxe.IdEspecialidad= e.Id
	Where pu.IdPerfilUsuario = 4
go


/* VISTA ADMINS */
Create View VW_Admins AS
	Select u.Apellidos, u.Nombres, u.FechaNacimiento, u.Sexo, u.IdTipoDocumento,u.telefono,u.mail,
	u.IdObraSocial, u.FechaAlta, pu.IdPerfilUsuario
	from Usuarios u
	inner join Perfil_X_Usuario pu on u.Id = pu.IdUsuario
	Where pu.IdPerfilUsuario = 1
go


/* VISTA GESTORES */
Create View VW_Gestores AS
	Select u.Apellidos, u.Nombres, u.FechaNacimiento, u.Sexo, u.IdTipoDocumento,u.telefono,u.mail,
	u.IdObraSocial, u.FechaAlta, pu.IdPerfilUsuario
	from Usuarios u
	inner join Perfil_X_Usuario pu on u.Id = pu.IdUsuario
	Where pu.IdPerfilUsuario = 2
go


/* VISTA Usuarios */
create View VW_Usuarios AS
	Select u.Id, u.Apellidos, u.Nombres, u.FechaNacimiento, u.Sexo, td.Descripcion as 'TipoDoc', u.NroDocumento,
	os.Descripcion as 'Obra_Social', ISNULL(u.Telefono,'no informado') as Telefono,
	ISNULL(u.Mail,'no informado') as Mail, u.FechaAlta
	from Usuarios u
	inner join Tipos_Documentos td on u.IdTipoDocumento = td.Id
	inner join Obras_Sociales os on u.IdObraSocial = os.Id
	inner join Perfil_X_Usuario pu on u.Id = pu.IdUsuario
go


select Id, Apellidos,Nombres,FechaNacimiento,Sexo,TipoDoc,NroDocumento,Obra_Social,Telefono,Mail,FechaAlta from VW_Usuarios

Select * from VW_Usuarios
go
Select * from VW_Pacientes  
go
Select * from VW_Profesionales  
go
Select * from VW_Admins  
go
Select * from VW_Gestores  
go


