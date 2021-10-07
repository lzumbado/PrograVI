CREATE PROCEDURE [dbo].[TipoIdentificacionObtener]
      @IdTipoIdentificacion int= NULL
AS BEGIN
  SET NOCOUNT ON

  SELECT 
    E.Descripcion    
    FROM dbo.TipoIdentificacion E
    WHERE
    (@IdTipoIdentificacion IS NULL OR @IdTipoIdentificacion=@IdTipoIdentificacion)

END