--tabel lagar

SELECT nume, ST_Area(geom) AS area FROM lagar;
SELECT nume, ST_Perimeter(geom) AS perimeter FROM lagar;


--tabel componente_lagar

SELECT nume, ST_Perimeter(geom) AS perimeter FROM componente_lagar;
SELECT nume, ST_AsText(ST_Centroid(geom)) AS centroid FROM componente_lagar;


--tabel baraci

SELECT numar, ST_Area(geom) AS area FROM baraci;
SELECT numar, ST_Perimeter(geom) AS perimeter FROM baraci;

--tabel alei

SELECT lungime, ST_Area(geom) AS area FROM alei;
SELECT ST_AsText(ST_Centroid(geom)) AS centroid FROM alei;


--tabel zone_executie

SELECT denumire, ST_Area(geom) AS area FROM zone_executie;
SELECT denumire, ST_Perimeter(geom) AS perimeter FROM zone_executie;


--tabel camere_gazare

SELECT denumire, ST_Perimeter(geom) AS perimeter FROM camere_gazare;
SELECT denumire, ST_AsText(ST_Centroid(geom)) AS centroid FROM camere_gazare;


--tabel zid

SELECT denumire, ST_Area(geom) AS area FROM zid;
SELECT denumire, ST_AsText(ST_Centroid(geom)) AS centroid FROM zid;
