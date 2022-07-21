Use turnosApp
go

/* VISTA PACIENTES */
create View VW_Pacientes AS
	Select u.Apellidos, u.Nombres, u.FechaNacimiento,u.Sexo,
	case When u.Sexo = 'F' then 'Mujer'
	When u.Sexo = 'M' then 'Hombre'
	When u.Sexo = 'O' then 'No binaria' end as Genero, u.IdTipoDocumento,u.telefono,u.mail,
	u.IdObraSocial, u.FechaAlta, pu.IdPerfilUsuario
	from Usuarios u
	inner join Perfil_X_Usuario pu on u.Id = pu.IdUsuario
	Where pu.IdPerfilUsuario = 3
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
	Select u.Id, u.Apellidos, u.Nombres, u.FechaNacimiento, u.Sexo, 
	case When u.Sexo = 'F' then 'Mujer'
	When u.Sexo = 'M' then 'Hombre'
	When u.Sexo = 'O' then 'No binaria' end as Genero,
	td.Id as 'IdTipoDoc', td.Descripcion as 'TipoDoc',
	u.NroDocumento, os.Id as 'IdObraSocial', os.Descripcion as 'ObraSocial', 
	ISNULL(u.Telefono,'no informado') as Telefono,
	ISNULL(u.Mail,'no informado') as Mail, u.FechaAlta
	from Usuarios u
	inner join Tipos_Documentos td on u.IdTipoDocumento = td.Id
	inner join Obras_Sociales os on u.IdObraSocial = os.Id
go


/* Vista para listar los perfiles que tiene CADA usuario  */ 
create View VW_UsuariosConPerfil AS
select u.Id as IdUsuario, pxu.IdPerfilUsuario as IdPerfil, pu.Descripcion as Perfil from VW_Usuarios u
inner join Perfil_X_Usuario pxu on pxu.IdUsuario = u.Id
inner join Perfiles_Usuarios pu on pu.id = pxu.IdPerfilUsuario
Go


/* Vista para listar las especialidades de cada profesional  */ 
create View VW_ProfesionalesConEspecialidad AS
	select u.Id as IdUsuario, u.Apellidos + ', ' + u.Nombres as Profesional, isnull(pe.IdEspecialidad,0)  as IdEspecialidad,
	isnull(esp.Descripcion,'No especificado') as Especialidad, isnull(pe.Habilitado,0) as Habilitado from VW_Usuarios u
	inner join Perfil_X_Usuario pxu on pxu.IdUsuario = u.Id
	left join Profesionales_X_Especialidad pe on pe.IdUsuario = u.Id
	left join Especialidades esp on esp.Id = pe.IdEspecialidad
	where pxu.IdPerfilUsuario = 4   
Go

/* Vista para listar los horarios de cada profesional  */ 
create View VW_HorariosDeProfesionales AS
	select u.Id as IdUsuario, hxp.IdEspecialidad, esp.Descripcion as Especialidad,
	hr.IdHorario, hr.día as Dia, hr.Hora_Inicio, hr.Hora_Fin, hr.Frecuencia
	from VW_Usuarios u
	inner join Horario_x_Profesional hxp on hxp.IdProfesional = u.Id
	inner join Horarios hr on hr.IdHorario = hxp.IdHorario
    inner join Especialidades esp on esp.Id = hxp.IdEspecialidad
Go

Create view VW_IdPerfilUsuario as(
	select ing.Id as IdIngreso, pxu.IdPerfilUsuario as TipoUser,
	ing.Usuario as Usuario, ing.Pass as Pass, ing.IdUsuario from Ingresos ing 
	inner join Perfil_X_Usuario pxu on pxu.IdUsuario = ing.IdUsuario
	--inner join Usuarios us on us.Id=pxu.IdUsuario
	--inner join Perfiles_Usuarios perfil on perfil.Id=pxu.IdPerfilUsuario
)
go
/*
select * from Horarios
select * from Perfiles_Usuarios
Select * from Perfil_X_Usuario
Select * from VW_UsuariosConPerfil
select*from especialidades
Select IdUsuario, IdPerfil, Perfil from VW_UsuariosConPerfil
*/

