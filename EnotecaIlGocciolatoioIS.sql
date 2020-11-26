create database EnotecaIlGocciolatoioIS;
use EnotecaIlGocciolatoioIS;

create table categoria
(
    id int not null,
    nome varchar(25) not null primary key,
    descrizione varchar(300) null
);

create table ordine
(
    id int auto_increment primary key,
    id_utente int null references utente(id),
    data_ordine date not null,
    id_indirizzo int not null references indirizzo_ordine(id)
);

create table prodotto
(
    id 				   int auto_increment primary key,
    nome               varchar(40)  not null,
    tipo               varchar(50)  null,
    descrizione        varchar(300) null,
    prezzo             double       null,
    sconto             double       null,
    immagine           varchar(50)  null,
    anno               int          null,
    regione            varchar(30)  null,
    gradazione         int          null,
    formato            int          null,
    quantita_magazzino int          not null,
    nome_categoria     varchar(20)  references categoria(nome) ON UPDATE CASCADE ON DELETE RESTRICT
);

create table productordered
(
    product_id 		   int auto_increment primary key,
    nome               varchar(40)  not null,
    tipo               varchar(50)  null,
    descrizione        varchar(300) null,
    prezzo             double       null,
    sconto             double       null,
    immagine           varchar(50)  null,
    anno               int          null,
    regione            varchar(30)  null,
    gradazione         int          null,
    formato            int          null,
    nome_categoria     varchar(20)  references categoria(nome) ON UPDATE CASCADE ON DELETE RESTRICT,
    quantita   int         null,
    order_id   int         references ordine(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

create table utente
(
    id       int auto_increment primary key,
    email    varchar(30) null,
    username varchar(30) null,
    pass     varchar(70) null,
    ruolo    varchar(70) null,
    nome	 varchar(30) not null,
    cognome  varchar(40) not null,
    data_nascita date not null
);

create table indirizzo
(
	id int auto_increment primary key,
	citta    varchar(40) not null,
    cap      int         not null,
    via      varchar(70) not null,
    ncivico  int         not null,
    nazione	 varchar(10) not null,
    id_utente int references utente(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

create table metodo_pagamento(
	id 				int auto_increment primary key,
    numero_carta	varchar(30) not null,
    cvv 			varchar(3) not null,
    mese_scadenza	int not null,
    anno_scadenza	int not null,
    tipo_carta		varchar(10) not null,
    id_utente		int references utente(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

create table indirizzo_ordine
(
	id int auto_increment primary key references ordine(id),
	citta    varchar(40) not null,
    cap      int         not null,
    via      varchar(70) not null,
    ncivico  int         not null,
    nazione	 varchar(10) not null
);
