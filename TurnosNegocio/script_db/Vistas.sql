Use turnosApp
go

/* VISTA PACIENTES */
	create View VW_Pacientes AS
	Select  p.Id,p.Apellidos, p.Nombres, p.FechaNacimiento, p.Sexo, p.IdTipoDocumento,p.telefono,p.mail,
	p.IdObraSocial, p.FechaAlta, pp.IdPerfilUsuario
	from Personas p
	inner join Perfil_X_Persona pp on p.Id = pp.IdPersona
	Where pp.IdPerfilUsuario = 3
go


/* VISTA PROFESIONALES */
Create View VW_Profesionales AS
	Select p.Id, p.Apellidos, p.Nombres, p.FechaNacimiento, p.Sexo, p.IdTipoDocumento,p.telefono,p.mail,
	p.IdObraSocial, p.FechaAlta, pp.IdPerfilUsuario,e.Descripcion, pxe.CostoConsulta
	from Personas p
	inner join Perfil_X_Persona pp on p.Id = pp.IdPersona
	inner join Profesionales_X_Especialidad pxe on p.id = pxe.IdPersona
	inner join Especialidades e on pxe.IdEspecialidad= e.Id
	Where pp.IdPerfilUsuario = 4
go


/* VISTA ADMINS */
Create View VW_Admins AS
	Select p.Apellidos, p.Nombres, p.FechaNacimiento, p.Sexo, p.IdTipoDocumento,p.telefono,p.mail,
	p.IdObraSocial, p.FechaAlta, pp.IdPerfilUsuario
	from Personas p
	inner join Perfil_X_Persona pp on p.Id = pp.IdPersona
	Where pp.IdPerfilUsuario = 1
go


/* VISTA GESTORES */
Create View VW_Gestores AS
	Select p.Apellidos, p.Nombres, p.FechaNacimiento, p.Sexo, p.IdTipoDocumento,p.telefono,p.mail,
	p.IdObraSocial, p.FechaAlta, pp.IdPerfilUsuario
	from Personas p
	inner join Perfil_X_Persona pp on p.Id = pp.IdPersona
	Where pp.IdPerfilUsuario = 2
go


/* VISTA PERSONAS */
  create View VW_Personas AS
	Select p.Id,p.Apellidos, p.Nombres, p.FechaNacimiento, p.Sexo, td.Descripcion as 'TipoDoc', p.NroDocumento, p.telefono,p.mail,
	os.Descripcion as 'Obra_Social', p.FechaAlta
	from Personas p
	inner join Tipos_Documentos td on p.IdTipoDocumento = td.Id
	inner join Obras_Sociales os on p.IdObraSocial = os.Id
go

select Apellidos,Nombres,FechaNacimiento,Sexo,TipoDoc,NroDocumento,Obra_Social,FechaAlta from VW_Personas


Select * from VW_Personas
go
Select * from VW_Pacientes  
go
Select * from VW_Profesionales  
go
Select * from VW_Admins  
go
Select * from VW_Gestores  
go


