use turnosApp
go
/*    Stored Procedures  */


create procedure SP_ListarUsuarios AS BEGIN
	select Id, Apellidos,Nombres,FechaNacimiento,Sexo,IdTipoDoc,TipoDoc,NroDocumento,
		   IdObraSocial,ObraSocial,Telefono,Mail,FechaAlta from VW_Usuarios
END
GO

Create procedure SP_ListarPacientes (
	@IdPaciente int
) AS BEGIN
	IF (@IdPaciente=-1) BEGIN
		select Id, Apellidos + ', ' + Nombres as NombreCompleto,FechaNacimiento,
		Case When Month(FechaNacimiento) > Month(getDate()) Then dateDiff(Year,FechaNacimiento, getDate())-1
		When Month(FechaNacimiento) = Month(getDate()) AND Day(FechaNacimiento) > Day(getDate()) Then dateDiff(Year,FechaNacimiento, getDate())-1
		Else dateDiff(Year,FechaNacimiento, getDate()) End As Edad,Genero,IdTipoDoc,
		TipoDoc,NroDocumento,IdObraSocial,ObraSocial,Telefono,Mail from VW_Usuarios 
		inner join VW_UsuariosConPerfil up on up.IdUsuario = VW_Usuarios.Id
		where IdPerfil = 3
		order by NombreCompleto
	END ELSE BEGIN
		select u.Id, u.Apellidos + ', ' + u.Nombres as NombreCompleto,u.Genero,u.FechaNacimiento,
		Case When Month(FechaNacimiento) > Month(getDate()) Then dateDiff(Year,FechaNacimiento, getDate())-1
		When Month(FechaNacimiento) = Month(getDate()) AND Day(FechaNacimiento) > Day(getDate()) Then dateDiff(Year,FechaNacimiento, getDate())-1
		Else dateDiff(Year,FechaNacimiento, getDate()) End As Edad, u.IdTipoDoc,
		u.TipoDoc,u.NroDocumento,u.IdObraSocial,u.ObraSocial,u.Telefono,u.Mail from VW_Usuarios u
		inner join VW_UsuariosConPerfil up on up.IdUsuario = u.Id
		--inner join Profesionales_x_Especialidad pe on pe.IdUsuario = up.IdUsuario
		where IdPerfil = 3 AND u.Id = @IdPaciente
		order by NombreCompleto
	END
END
GO


Create procedure SP_ListarProfesionales (
	@IdEspecialidad int
) AS BEGIN
	IF (@IdEspecialidad=-1) BEGIN
		select Id, Apellidos, Nombres, Apellidos + ', ' + Nombres as NombreCompleto,
		Genero,Telefono,Mail from VW_Usuarios 
		inner join VW_UsuariosConPerfil up on up.IdUsuario = VW_Usuarios.Id
		where IdPerfil = 4
		Order By Apellidos, Nombres ASC
	END ELSE BEGIN
		select Id, Apellidos + ', ' + Nombres as NombreCompleto,Genero,Telefono,Mail
		from VW_Usuarios 
		inner join VW_UsuariosConPerfil up on up.IdUsuario = VW_Usuarios.Id
		inner join Profesionales_x_Especialidad pe on pe.IdUsuario = up.IdUsuario
		where IdPerfil = 4 AND IdEspecialidad = @IdEspecialidad
		Order By NombreCompleto ASC
	END
END
GO
/*
Create procedure SP_CargarEspecialidades (
	@IdProfesional bigint
) AS BEGIN
		select Id, pco.Profesional, isnull(pco.IdEspecialidad,0) as IdEspecialidad, 
		isnull(pco.Especialidad,'No especificado') as Especialidad from VW_Usuarios 
		inner join VW_UsuariosConPerfil up on up.IdUsuario = VW_Usuarios.Id
		left join VW_ProfesionalesConEspecialidad pco on pco.IdUsuario = VW_Usuarios.Id
		where IdPerfil = 4 AND Id = @IdProfesional
		Order By Profesional ASC
END
GO*/


Create procedure SP_ListarHorariosProfesionales (
	@IdEspecialidad int,
	@IdProfesional bigint
) AS BEGIN
	IF (@IdProfesional=-1) BEGIN
		Select pe.IdUsuario as IDProfesional, pe.IdEspecialidad, isnull(hp.IdHorario,0) as IdHorario, isnull((
		h.D�a +' de '+ Cast(h.Hora_Inicio as varchar(5)) + ' a ' +  Cast(h.Hora_Fin as varchar(5))),
		'Sin atenci�n') as Horario, isnull(h.Frecuencia,0) as Frecuencia, pe.Habilitado as Activo,
		isnull(h.D�a,0)as D�a, isnull(h.Hora_Inicio,'00:00') as Hora_Inicio, isnull(h.Hora_Fin,'00:00') as Hora_Fin
		from Profesionales_x_Especialidad pe
		left Join Horario_x_Profesional hp on hp.IdProfesional = pe.IdUsuario and hp.IdEspecialidad = pe.IdEspecialidad
		left Join Horarios h on h.IdHorario = hp.IdHorario
		order by Horario asc
	END ELSE BEGIN
		Select pe.IdUsuario as IDProfesional, pe.IdEspecialidad, isnull(hp.IdHorario,0) as IdHorario, isnull((
		h.D�a +' de '+ Cast(h.Hora_Inicio as varchar(5)) + ' a ' +  Cast(h.Hora_Fin as varchar(5))),
		'Sin atenci�n') as Horario, isnull(h.Frecuencia,0) as Frecuencia, pe.Habilitado as Activo,
		isnull(h.D�a,0)as D�a, isnull(h.Hora_Inicio,'00:00') as Hora_Inicio, isnull(h.Hora_Fin,'00:00') as Hora_Fin
		from Profesionales_x_Especialidad pe
		left Join Horario_x_Profesional hp on hp.IdProfesional = pe.IdUsuario and hp.IdEspecialidad = pe.IdEspecialidad
		left Join Horarios h on h.IdHorario = hp.IdHorario
		where pe.IdUsuario = @IdProfesional AND pe.IdEspecialidad = @IdEspecialidad
		
	END
END
GO
--exec SP_ListarHorariosProfesionales 2,94

Create procedure SP_ListarHorarioSeleccionado (
	@IdHorario bigint
) AS BEGIN
		Select D�a, Hora_Inicio, Hora_Fin,Frecuencia,Activo from Horarios
		where IdHorario = @IdHorario
END
GO

create procedure SP_AgregarPerfil(
	@IdUsuario bigint,
	@IdPerfilUsuario smallint
)
AS BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			Insert into Perfil_X_Usuario(IdUsuario, IdPerfilUsuario)
			VALUES (@IdUsuario, @IdPerfilUsuario)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR ('ERROR',16,1)
	END CATCH
END
GO

create procedure SP_AgregarEspecialidad(
	@IdUsuario bigint,
	@IdEspecialidad int
)
AS BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			Insert into Profesionales_x_Especialidad(IdUsuario, IdEspecialidad)
			VALUES (@IdUsuario, @IdEspecialidad)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR ('ERROR',16,1)
	END CATCH
END
GO

create procedure SP_AgregarHorario(
	@IdUsuario bigint,
	@IdEspecialidad int,
	@IdHorario int
)
AS BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			Insert into Horario_x_Profesional(IdProfesional, IdEspecialidad,IdHorario)
			VALUES (@IdUsuario, @IdEspecialidad,@IdHorario)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR ('ERROR',16,1)
	END CATCH
END
GO

Create procedure SP_AltaUsuario(
	@Apellidos varchar(100),
	@Nombres varchar(100),
	@FechaNacimiento date,
	@Sexo char,
	@IdTipoDocumento smallint,
	@NroDocumento bigint,
	@Telefono varchar(50),
	@Mail varchar(100),
	@IdObraSocial int,
	---------
	@IdPerfilUsuario smallint,
	@IdEspecialidad int,
	@IdHorario bigint
)
AS BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			Insert into Usuarios(Apellidos,Nombres,FechaNacimiento,Sexo,IdTipoDocumento,NroDocumento,Telefono,Mail,IdObraSocial)
			VALUES (@Apellidos,@Nombres,@FechaNacimiento,@Sexo,@IdTipoDocumento,@NroDocumento,@Telefono,@Mail,@IdObraSocial)

		DECLARE @IdUsuario bigint
		SET @IdUsuario = @@IDENTITY

			EXEC SP_AgregarPerfil @IdUsuario, @IdPerfilUsuario

			IF (@IdEspecialidad != -1) BEGIN
				EXEC SP_AgregarPerfil @IdUsuario, @IdEspecialidad
				EXEC SP_AgregarHorario @IdUsuario, @IdEspecialidad,@IdHorario
			END

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 BEGIN
			ROLLBACK TRANSACTION
		END
		RAISERROR ('ERROR',16,1)
	END CATCH
END
GO
	
	
/*
Select  *from Usuarios u order by id desc
Select pu.IdUsuario, pu.IdPerfilUsuario, p.Descripcion from Perfil_X_Usuario pu 
right join Perfiles_Usuarios p on p.Id= pu.IdPerfilUsuario
order by IdUsuario desc
*/

/*
Insert into Usuarios(Apellidos,Nombres,FechaNacimiento,Sexo,IdTipoDocumento,NroDocumento,Telefono,Mail,IdObraSocial)
VALUES ('Fernandez','Roberto',N'03/05/1959' ,'M',1,13658459,114443322,'fernandez@gmail.com',9)

Exec SP_AltaUsuario 'Alvarenga','Candela','2007-04-22','F',1,40263288,null,null,2,3
*/

							   
create procedure SP_ModificarPerfil(
	@IdUsuario bigint,
	@IdPerfilUsuario smallint
)
AS BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Perfil_X_Usuario
			SET IdPerfilUsuario = @IdPerfilUsuario
			WHERE IdUsuario = @IdUsuario
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR ('ERROR',16,1)
	END CATCH
END
GO

create procedure SP_ModificarEspecialidad(
	@IdUsuario bigint,
	@IdEspecialidad int
)
AS BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Profesionales_x_Especialidad
			SET IdEspecialidad = @IdEspecialidad
			WHERE IdUsuario = @IdUsuario
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR ('ERROR',16,1)
	END CATCH
END
GO

create procedure SP_ModificarHorario(
	@IdUsuario bigint,
	@IdEspecialidad int,
	@IdHorario bigint
)
AS BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			UPDATE Horario_x_Profesional
			SET IdEspecialidad = @IdEspecialidad,IdHorario =@IdHorario
			WHERE IdProfesional = @IdUsuario
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		RAISERROR ('ERROR',16,1)
	END CATCH
END
GO

Create procedure SP_ModificarUsuario(
	@IdUsuario bigint,
	@Apellidos varchar(100),
	@Nombres varchar(100),
	@FechaNacimiento date,
	@Sexo char,
	@IdTipoDocumento smallint,
	@NroDocumento bigint,
	@Telefono varchar(50),
	@Mail varchar(100),
	@IdObraSocial int,
	---------
	@IdPerfilUsuario smallint,
	@IdEspecialidad int,
	@IdHorario bigint
)
AS BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			Update Usuarios SET 
			Apellidos = @Apellidos, 
			Nombres = @Nombres,
			FechaNacimiento = @FechaNacimiento,
			Sexo = @Sexo,
			IdTipoDocumento = @IdTipoDocumento,
			NroDocumento = @NroDocumento,
			telefono = @Telefono,
			Mail = @Mail,
			IdObraSocial =  @IdObraSocial
			WHERE ID = @IdUsuario

			EXEC SP_ModificarPerfil @IdUsuario, @IdPerfilUsuario

			IF (@IdEspecialidad != -1) BEGIN
				EXEC SP_AgregarPerfil @IdUsuario, @IdEspecialidad
				EXEC SP_AgregarHorario @IdUsuario, @IdEspecialidad,@IdHorario
			END
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0 BEGIN
			ROLLBACK TRANSACTION
		END
		RAISERROR ('ERROR',16,1)
	END CATCH
END
GO


--Exec SP_ModificarUsuario 104,'Perez','Juan','1999-06-26','M',1,36987589,1137429988,'perez@gmail.com',5,3

create procedure SP_AltaTurno(
	@IdPaciente bigint,
	@Fecha date,
	@Hora time,
	@IdProfesional bigint,
	@IdEspecialidad int,
	@IdHorario bigint,
	@Observaciones varchar(max)
) AS BEGIN
	Insert into Turnos(IdPaciente,Fecha,Hora,IdProfesional,IdEspecialidad,IdHorario,Observaciones)
	VALUES (@IdPaciente, @Fecha,@Hora,@IdProfesional,@IdEspecialidad,@IdHorario,@Observaciones)
END
GO

Create procedure SP_ModificarTurno(  --Especialidad y paciente no cambian!
	@IdTurno bigint,
	@Fecha date,
	@Hora time,
	@IdProfesional bigint,
	@IdHorario bigint,
	@Observaciones varchar(max)
) AS BEGIN
	Update Turnos SET 
		Fecha = @Fecha,
		Hora = @Hora,
		IdProfesional = @IdProfesional,
		IdHorario = @IdHorario,
		IdEstado = 2,
		Observaciones = @Observaciones
		where IdTurno = @IdTurno
END
GO

Create procedure SP_ActualizaTurno(
	@IdTurno bigint,
	@IdEstado smallint,
	@Observaciones varchar(max)
) AS BEGIN
	Update Turnos SET 
		IdEstado =  @IdEstado,
		Observaciones = @Observaciones
		where IdTurno = @IdTurno
END
GO

Create procedure SP_CancelaTurno(
	@IdTurno bigint,
	@Observaciones varchar(max)
) AS BEGIN
	Update Turnos SET 
		IdEstado =  4,
		Observaciones = @Observaciones
		where IdTurno = @IdTurno
END
GO


Create procedure SP_ListarTurnos (  
	@IdProfesional bigint,
	@IdEspecialidad int   
	--@IdHorario bigint
)AS BEGIN
	IF (@IdProfesional=-1) BEGIN
		select t.IdTurno,t.IdPaciente, u.Apellidos + ', ' + u.Nombres as Paciente, t.Fecha, t.Hora, t.IdProfesional,
		t.IdEspecialidad, t.idHorario, t.IdEstado, pe.Profesional, pe.Especialidad, et.Descripcion as Estado, 
		t.Observaciones	from Turnos t
			inner join Usuarios u on u.id = t.IdPaciente
			inner join VW_ProfesionalesConEspecialidad pe on pe.IdUsuario = t.IdProfesional AND pe.IdEspecialidad = t.IdEspecialidad
			inner join Estados_Turnos  et on et.Id = t.IdEstado
		order by t.Fecha, t.Hora, pe.Profesional, pe.Especialidad,Paciente, t.IdTurno
	END ELSE BEGIN
		select t.IdTurno,t.IdPaciente, u.Apellidos + ', ' + u.Nombres as Paciente, t.Fecha, t.Hora, t.IdProfesional,
		t.IdEspecialidad, t.idHorario, t.IdEstado, pe.Profesional, pe.Especialidad, et.Descripcion as Estado, 
		t.Observaciones	from Turnos t
			inner join Usuarios u on u.id = t.IdPaciente
			inner join VW_ProfesionalesConEspecialidad pe on pe.IdUsuario = t.IdProfesional AND pe.IdEspecialidad = t.IdEspecialidad
			inner join Estados_Turnos  et on et.Id = t.IdEstado
		where t.IdProfesional = @IdProfesional AND t.IdEspecialidad = @IdEspecialidad
		order by t.Fecha, t.Hora, pe.Profesional,pe.Especialidad, Paciente, t.IdTurno
	END
END
GO


Create procedure SP_ListarTurnosPaciente (  
	@IdPaciente bigint,
	@ConHistorial bit
)AS BEGIN
	IF (@ConHistorial = 1) BEGIN
		select t.IdTurno,t.IdPaciente, u.Apellidos + ', ' + u.Nombres as Paciente, t.Fecha, t.Hora, t.IdProfesional,
		pe.Profesional, t.IdEspecialidad, pe.Especialidad, t.idHorario, t.IdEstado, et.Descripcion as Estado
		from Turnos t
			inner join Usuarios u on u.id = t.IdPaciente
			inner join VW_ProfesionalesConEspecialidad pe on pe.IdUsuario = t.IdProfesional
			inner join Estados_Turnos  et on et.Id = t.IdEstado
		where t.IdPaciente = @IdPaciente AND T.Fecha < GETDATE()
		order by t.Fecha, t.Hora, pe.Profesional,pe.Especialidad
	END ELSE BEGIN
			select t.IdTurno,t.IdPaciente, u.Apellidos + ', ' + u.Nombres as Paciente, t.Fecha, t.Hora, t.IdProfesional,
		pe.Profesional, t.IdEspecialidad, pe.Especialidad, t.idHorario, t.IdEstado, et.Descripcion as Estado
		from Turnos t
			inner join Usuarios u on u.id = t.IdPaciente
			inner join VW_ProfesionalesConEspecialidad pe on pe.IdUsuario = t.IdProfesional
			inner join Estados_Turnos  et on et.Id = t.IdEstado
		where t.IdPaciente = @IdPaciente AND t.IdEstado != 4  AND T.Fecha >= GETDATE()
		order by t.Fecha, t.Hora, pe.Profesional,pe.Especialidad
	END
END
GO



--exec SP_ListarTurnos -1,-1
--select * from Turnos
--select * from Horarios
--select * from VW_ProfesionalesConEspecialidad
--select * from Estados_Turnos

--exec SP_AltaTurno 1,'2022-07-19','15:00',65,1,8,null


Create procedure SP_FiltroTurnos(
	@Fecha date,
	@IdProfesional bigint,
	@IdEspecialidad int,
	@IdHorario bigint,
	@IdPaciente bigint
)AS BEGIN
	IF (@IdPaciente=-1) BEGIN
		Select IdTurno,IdPaciente, Fecha, Hora, IdProfesional, IdEspecialidad, IdEstado from Turnos
		where Fecha = @Fecha AND IdProfesional = @IdProfesional AND IdHorario = @IdHorario
		AND IdEspecialidad = @IdEspecialidad AND IdEstado != 4 /* 4 = CANCELADO*/
		order by Fecha, Hora
	END ELSE BEGIN
		Select IdTurno,IdPaciente, Fecha, Hora, IdProfesional, IdEspecialidad, IdEstado from Turnos
		where Fecha >= GETDATE() AND IdProfesional = @IdProfesional	AND IdEspecialidad = @IdEspecialidad
		AND IdEstado != 4 AND IdPaciente = @IdPaciente
		order by Fecha, Hora
	END
END
GO

Create procedure SP_ControlTurnosPacientes(
	@IdPaciente bigint,
	@Fecha date,
	@Hora time(7)
)AS BEGIN
	Select IdTurno,IdPaciente, Fecha, Hora, IdProfesional, IdEspecialidad, IdEstado from Turnos
		where Fecha = @Fecha AND hora = @Hora AND IdEstado != 4 AND IdPaciente = @IdPaciente 
		order by IdPaciente, Fecha, Hora
END
GO

--exec SP_ListarTurnosPacientes 46,'2022-07-22','10:00'
--delete from Turnos where IdTurno = 23
/*
	Select Fecha, Hora, IdProfesional, IdEspecialidad, IdEstado from Turnos
	where Fecha = '2022-07-21' AND IdProfesional = 13 AND
	IdEspecialidad = 12 AND IdEstado != 4 /* 4= CANCELADO*/
	order by Fecha, Hora
*/



Create procedure SP_BuscarProfesional (
	@IdProfesional int
) AS BEGIN
		select u.Id, u.Apellidos + ', ' + u.Nombres as NombreCompleto,u.Genero,
		u.Telefono,u.Mail, pe.IdEspecialidad, e.Descripcion as Especialidad
		from VW_Usuarios u
		inner join VW_UsuariosConPerfil up on up.IdUsuario = u.Id
		inner join Profesionales_x_Especialidad pe on pe.IdUsuario = u.Id
		inner join Especialidades e on e.Id = pe.IdEspecialidad
		where IdPerfil = 4 AND U.Id = @IdProfesional
END
GO

create procedure sp_idusuario_idingresos(
	@dni bigint
) as begin
		
	select us.Id from Usuarios us where us.NroDocumento=@dni
		
end
GO

create procedure sp_agregaringreso(
	@usuario varchar(50),
	@pass varchar(50),
	@idusuario bigint
)as begin

	insert into Ingresos (Usuario,Pass,IdUsuario)
	values (@usuario,@pass,@idusuario)
end
GO