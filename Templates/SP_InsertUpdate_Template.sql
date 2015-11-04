/****** Template for InsertUpdate Stored procedures    Script Date: 11/2/2015 5:53:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertUpdateStoredProcedure]
	@Id int,
	@CheckFields
AS
BEGIN
	If @Id =0
	BEGIN
		SELECT @Id = ISNULL(Id, 0) FROM dbo.[Table] WHERE CheckFields = @CheckFields

		IF @Id = 0
		BEGIN
			INSERT INTO dbo.[Table]
				(InsertFields)
			VALUES
				(@InserFields)

			SELECT SCOPE_IDENTITY() AS 'RESULT'
		END
		ELSE
			SELECT CAST(@Id as numeric(18,0)) AS 'RESULT' --Error code to be updated with new list of errors
	END
	BEGIN
		Update dbo.[Table] SET 
		WHERE id =@Id

		SELECT CAST(@Id as numeric(18,0)) AS 'RESULT'
	END
END