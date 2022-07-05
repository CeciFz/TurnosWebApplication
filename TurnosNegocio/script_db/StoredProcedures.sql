
/*    Stored Procedures  */


create procedure SP_ListarUsuarios AS BEGIN
	select Id, Apellidos,Nombres,FechaNacimiento,Sexo,IdTipoDoc,TipoDoc,NroDocumento,
		   IdObraSocial,ObraSocial,Telefono,Mail,FechaAlta from VW_Usuarios
END
GO

--EXEC SP_ListarUsuarios
					   
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


create procedure SP_AltaUsuario(
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
	@IdPerfilUsuario smallint
)
AS BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
			Insert into Usuarios(Apellidos,Nombres,FechaNacimiento,Sexo,IdTipoDocumento,NroDocumento,Telefono,Mail,IdObraSocial)
			VALUES (@Apellidos,@Nombres,@FechaNacimiento,@Sexo,@IdTipoDocumento,@NroDocumento,@Telefono,@Mail,@IdObraSocial)

		DECLARE @IdUsuario bigint
		SET @IdUsuario = @@IDENTITY

			EXEC SP_AgregarPerfil @IdUsuario, @IdPerfilUsuario
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

create procedure SP_ModificarUsuario(
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
	@IdPerfilUsuario smallint
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