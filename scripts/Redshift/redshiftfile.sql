create external schema myspectrum_schema
from data catalog
database 'co2-measurement'
iam_role 'arn:aws:iam::598167537769:role/LabRole'
create external database if not exists;

--Crear tabla nativa--

create  table tendencia(
fecha text,
fechaD decimal,
promedio decimal,
tendencia decimal);

--cargar datos desde S3

COPY tendencia FROM 's3://proyecto1-grupo8-ddl/dataset/Tendencia_anual/co2-mm-gl_csv.csv'
iam_role 'arn:aws:iam::598167537769:role/LabRole'
delimiter ','
IGNOREHEADER 1;

--Consultar datos

Select * from tendencia