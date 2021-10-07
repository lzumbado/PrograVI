DROP TABLE IF EXISTS #TipoIdentificacionTemp

SELECT 
IdTipoIdentificacion, Descripcion INTO #TipoIdentificacionTemp
FROM (
VALUES
(1, 'Cedula'),
(2, 'Pasaporte'),
(3, 'Cedula Juridca')
)AS TEMP (IdTipoIdentificacion, Descripcion)


----ACTUALIZAR DATOS---
UPDATE P SET
  P.Descripcion= TM.Descripcion
FROM Dbo.#TipoIdentificacion P
INNER JOIN #TipoIdentificacionTemp TM
    ON P.IdTipoIdentificacion= TM.IdTipoIdentificacion


----INSERTAR DATOS---

SET IDENTITY_INSERT dbo.TipoIdentificacion ON

INSERT INTO dbo.#TipoIdentificacion(
IdTipoIdentificacion, Descripcion)
SELECT
IdTipoIdentificacion, Descripcion
FROM #TipoIdentificacionTemp


EXCEPT
SELECT
IdTipoIdentificacion, Descripcion
FROM dbo.#TipoIdentificacion


SET IDENTITY_INSERT dbo.TipoIdentificacion OFF

GO