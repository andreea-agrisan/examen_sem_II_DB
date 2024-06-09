create extension postgis;

create table if not exists lagar
(
	id serial not null,
	nume varchar(255) not null,
	suprafata integer not null,
	geom geometry('Polygon', 4326),
	primary key(id)
);

create table componente_lagar
(
	fid serial not null,
	lagar_id integer not null,
	nume varchar(255) not null,
	suprafata integer not null,
	geom geometry('Polygon', 4326),
	primary key(fid),
	foreign key(lagar_id) references lagar(id)
);

create table personal
(
	id serial not null,
	nume varchar(255) not null,
	organizatie varchar(255) not null,
	primary key(id)
);

create table componente_lagar_personal
(
	id serial not null,
	componente_lagar_fid integer not null,
	personal_id integer not null,
	primary key(id),
	foreign key(componente_lagar_fid) references componente_lagar(fid),
	foreign key(personal_id) references personal(id)
);

create table baraci
(
	fid serial not null,
	componente_lagar_fid integer not null,
	numar integer not null,
	numar_paturi integer not null,
	geom geometry('Polygon', 4326),
	primary key(fid),
	foreign key(componente_lagar_fid) references componente_lagar(fid)
);

create table alei
(
	fid serial not null,
	componente_lagar_fid integer not null,
	lungime integer not null,
	geom geometry('LineString', 4326),
	primary key(fid),
	foreign key(componente_lagar_fid) references componente_lagar(fid)
);

create table prizonieri
(
	fid serial not null,
	componente_lagar_fid integer not null,
	nume varchar(255) not null,
	numar_tatuat integer not null,
	primary key(fid),
	foreign key(componente_lagar_fid) references componente_lagar(fid)
);

create table zone_executie
(
	id serial not null,
	componente_lagar_fid integer not null,
	denumire varchar(255) not null,
	geom geometry('Polygon', 4326),
	primary key(id),
	foreign key(componente_lagar_fid) references componente_lagar(fid)
);

create table camere_gazare
(
	fid serial not null,
	zone_executie_id integer not null,
	denumire varchar(255) not null,
	geom geometry('Point', 4326),
	primary key(fid),
	foreign key(zone_executie_id) references zone_executie(id)
);

create table zid
(
	fid serial not null,
	zone_executie_id integer not null,
	denumire varchar(255) not null,
	geom geometry('Point', 4326),
	primary key(fid),
	foreign key(zone_executie_id) references zone_executie(id)
);