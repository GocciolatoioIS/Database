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

create table prodotto_catalogo
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

create table prodotto_ordinato
(
    product_id 		   int auto_increment primary key,
    nome               varchar(40)  not null,
    tipo               varchar(50)  null,
    descrizione        varchar(300) null,
    prezzo             double       null,
    sconto             double       null,
    immagine           varchar(50)  DEFAULT NULL,
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

create table indirizzo_ordine
(
	id int auto_increment primary key,
	citta    varchar(40) not null,
    cap      int         not null,
    via      varchar(70) not null,
    ncivico  int         not null,
    nazione	 varchar(10) not null,
    id_ordine int references ordine(id)
);

insert into enotecailgocciolatoiois.indirizzo_ordine (id, citta, cap, via, ncivico, nazione)
values  (5, 'Marigliano', 80034, 'via Clemente Mastrisciano', 54, 'Italia'),
        (6, 'Marigliano', 80034, 'via Clemente Mastrisciano', 54, 'Italia'),
        (7, 'Marigliano', 80034, 'via Clemente Mastrisciano', 54, 'Italia'),
        (8, 'ABDUL GIAML', 80034, 'DELLA MORTE', 777, 'AO'),
        (9, 'ABDUL GIAML', 80034, 'DELLA MORTE', 777, 'AO'),
        (10, 'Somma Vesuviana', 80034, 'Via portaterra', 54, 'AL'),
        (11, 'ABDUL GIAML', 80034, 'DELLA MORTE', 777, 'AO');

insert into enotecailgocciolatoiois.categoria (id, nome, descrizione)
values  (6, 'Amari', 'Uno amaro, o bitter, è una bevanda spiritosa dal gusto prevalentemente amaro, ottenuta da varie droghe vegetali, e usata, per le sue proprietà eupeptiche, come aperitivo o anche, se più ricca di alcol, come digestivo.'),
        (3, 'Birra', 'bevanda alcolica ottenuta tipicamente dalla fermentazione di mosto a base di malto d orzo, aromatizzata e amaricata con luppolo.'),
        (4, 'Champagne', 'Lo champagne è un vino spumante francese ad appellation di origine contrôlée prodotto con metodo classico, famoso in tutto il mondo e comunemente associato ai concetti di lusso e festa.'),
        (8, 'Cibo', 'Scopri i nostri prodotti di alimentari come pasta, tavolette di cioccolato e biscotti.'),
        (7, 'Confetture', 'Dai uno sguardo alle nostre confetture, vari tipi di creme e una vasta selezione di miele.'),
        (2, 'Spumanti', 'Il vino spumante è un vino caratterizzato da rilevante effervescenza, dovuta ad anidride carbonica disciolta. Il termine "spumante" si riferisce allo sviluppo di spuma che è una manifestazione della effervescenza. Lo spumante è un vino speciale come i liquorosi e gli aromatizzati.'),
        (5, 'Superalcolici', 'Gin, Grappe, Rhum, Vodka, Whisky e tanto altro.'),
        (1, 'Vino', 'bevanda alcolica, ottenuta dalla fermentazione (totale o parziale) del frutto della vite, l uva (sia essa pigiata o meno), o del mosto.');

insert into enotecailgocciolatoiois.ordine (id, id_utente, data_ordine, id_indirizzo)
values  (5, 2, '2021-01-06', 5),
        (6, 2, '2021-01-06', 6),
        (7, 2, '2021-01-06', 7),
        (8, 2, '2021-01-07', 8),
        (10, 16, '2021-01-08', 10),
        (11, 2, '2021-01-14', 11);
        
 insert into enotecailgocciolatoiois.indirizzo (id, citta, cap, via, ncivico, nazione, id_utente)
values  (6, 'ABDUL GIAML', 80034, 'DELLA MORTE', 777, 'AO', 2),
        (7, 'Somma Vesuviana', 80034, 'Via portaterra', 54, 'AS', 2),
        (8, 'SAN PAOLO B.', 989898, 'Via Giandugliotto', 21, 'BR', 2),
        (9, 'Somma Vesuviana', 80034, 'Via portaterra', 54, 'AD', 2),
        (10, 'Somma Vesuviana', 80034, 'Via portaterra', 54, 'AL', 16);       
        
        insert into enotecailgocciolatoiois.utente (id, email, username, pass, ruolo, nome, cognome, data_nascita)
values  (2, 'dimy1996@live.it', 'thedmg8', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'amministratore', 'Giovanni', 'Di Mauro', '1970-05-16'),
        (3, 'alberto@hotmail.it', 'alby', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'utente', 'Alberto', 'Chiarovalle', '1980-01-01'),
        (15, 'mary@mary.it', 'mary1', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'utente', 'maria', 'mosca', '1997-08-07'),
        (16, 'Giacomino@gmail.it', 'GiacominoBiricchino', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'utente', 'Giacomo', 'De Santis', '1970-03-07');
        
        insert into enotecailgocciolatoiois.prodotto_ordinato (product_id, nome, tipo, descrizione, prezzo, sconto, immagine, anno, regione, gradazione, formato, nome_categoria, quantita, order_id)
values  (1, 'Brunello di Montalcino', null, 'Rubino intenso, bouquet complesso, con sentori di rosa appassita.', 129, 0, './img/./img/brunello.jpg', 2013, 'Toscana', 13, 75, null, 1, null),
        (2, 'Montepulciano D Abruzzo NEGUS', null, 'Cascina del Colle, vino rosso. ', 36, 0, './img/./img/montepulciano.jpg', 2013, 'Abruzzo', 16, 75, null, 1, null),
        (3, 'Valdobbiadene Prosecco', null, 'il colore dell’imballo potrebbe essere diverso
e le bottiglie inserite all’interno di cartoni misti con altri prodotti acquistati. ', 36, 0, './img/./img/tanico.jpg', 2012, 'NonSo', 14, 300, null, 3, null),
        (4, 'Montepulciano D Abruzzo NEGUS', null, 'Cascina del Colle, vino rosso. ', 36, 0, './img/./img/montepulciano.jpg', 2013, 'Abruzzo', 16, 75, null, 3, 5),
        (5, 'Brunello di Montalcino', null, 'Rubino intenso, bouquet complesso, con sentori di rosa appassita.', 129, 0, './img/./img/brunello.jpg', 2013, 'Toscana', 13, 75, null, 1, 6),
        (6, 'Xocoveza 12X', null, 'Birra in stile Imperial Stout prodotta con aggiunta di caffè, vaniglia, cacao, peperoncino, noce moscata e cannella.', 99, 0, './img/./img/xocoveza.jpg', 0, 'USA', 9, 33, null, 1, 6),
        (7, 'Champagne Brut Cristal', null, 'Uno Champagne che è pregevole se sorseggiato in meditazione. Ottimo anche in abbinamento a cibi delicati e pregiati come il caviale, il pesce, i molluschi e i crostacei tipo l’aragosta, l’astice, e le ostriche. Va servito alla temperatura di 8° C.', 225, 0, './img/./img/brutcristal.jpg', 2012, 'Francia', 12, 75, null, 1, 6),
        (8, 'Brunello di Montalcino', null, 'Rubino intenso, bouquet complesso, con sentori di rosa appassita.', 129, 0, './img/./img/brunello.jpg', 2013, 'Toscana', 13, 75, null, 1, 7),
        (9, 'Brunello di Montalcino', null, 'Rubino intenso, bouquet complesso, con sentori di rosa appassita.', 129, 0, './img/./img/brunello.jpg', 2013, 'Toscana', 13, 75, null, 1, 8),
        (10, 'Brunello di Montalcino', null, 'Rubino intenso, bouquet complesso, con sentori di rosa appassita.', 129, 0, './img/./img/brunello.jpg', 2013, 'Toscana', 13, 75, null, 1, 9),
        (11, 'Brunello di Montalcino', null, 'Rubino intenso, bouquet complesso, con sentori di rosa appassita.', 129, 0, './img/./img/brunello.jpg', 2013, 'Toscana', 13, 75, null, 1, 10),
        (12, 'Montepulciano D Abruzzo NEGUS', null, 'Cascina del Colle, vino rosso. ', 36, 0, './img/./img/montepulciano.jpg', 2013, 'Abruzzo', 16, 75, null, 1, 10),
        (13, 'Brunello di Montalcino', null, 'Rubino intenso, bouquet complesso, con sentori di rosa appassita.', 129, 0, './img/./img/brunello.jpg', 2013, 'Toscana', 13, 75, null, 1, 11);
        
        insert into enotecailgocciolatoiois.prodotto_catalogo (id, nome, tipo, descrizione, prezzo, sconto, immagine, anno, regione, gradazione, formato, quantita_magazzino, nome_categoria)
values  (1, 'Brunello di Montalcino', null, 'Rubino intenso, bouquet complesso, con sentori di rosa appassita.', 129, null, './img/brunello.jpg', 2013, 'Toscana', 13, 75, 3, 'Vino'),
        (2, 'Montepulciano D Abruzzo NEGUS', null, 'Cascina del Colle, vino rosso. ', 36, null, './img/montepulciano.jpg', 2013, 'Abruzzo', 16, 75, 5, 'Vino'),
        (3, 'Doppio Magnum', null, 'Doppio Magnum 3 Litri Montepulciano d Abruzzo RISERVA in Cassa Legno Fattoria Giuseppe Savini ', 36, null, './img/doppiomagnum.jpg', 2012, 'Abruzzo', 14, 300, 10, 'Vino'),
        (4, 'Valdobbiadene Prosecco', null, 'il colore dell’imballo potrebbe essere diverso
e le bottiglie inserite all’interno di cartoni misti con altri prodotti acquistati. ', 36, null, './img/tanico.jpg', 2012, 'NonSo', 14, 300, 7, 'Vino'),
        (5, 'Friuli Isonzo Sauvignon Blanc', null, 'Nel calice si presenta con un colore giallo verdolino. Il naso è attraversato da sentori di peperone, ananas', 36, null, './img/feudi.jpg', 2012, 'NonSo', 14, 300, 10, 'Vino'),
        (6, 'Champagne Brut Cristal', null, 'Uno Champagne che è pregevole se sorseggiato in meditazione. Ottimo anche in abbinamento a cibi delicati e pregiati come il caviale, il pesce, i molluschi e i crostacei tipo l’aragosta, l’astice, e le ostriche. Va servito alla temperatura di 8° C.', 225, null, './img/brutcristal.jpg', 2012, 'Francia', 12, 75, 9, 'Champagne'),
        (7, 'Champagne Cuvèe Rosè', null, 'La finitura di questo fantastico vino è luminosamente brillante, rosso e riccamente ornamentato da bollicine fresche e vivaci che animano il vino nel bicchiere. Al naso emerge a livello olfattivo con pieni sentori di piccoli frutti rossi selvatici come la fragola di bosco e l’uva spina.', 48, null, './img/cuveerose.jpg', null, 'Francia', 12, 75, 10, 'Champagne'),
        (8, 'Champagne BELLE EPOQUE', null, 'Col tempo, quest’assemblaggio complesso ha sviluppato una ricchezza aromatica eccezionale, armoniosa ed equilibrata. All’inizio ritroviamo aromi di frutta bianca con cenni di ananas e fiori bianchi primaverili. ', 158, null, './img/belleepoque.jpg', 2012, 'Francia', 12, 75, 10, 'Champagne'),
        (9, 'Daarbulah 6X', null, 'Realizzata con una miscela di malti torrefatti e caramellati, aggiunta di avena e zucchero di canna grezzo, Daarbulah del birrificio Hammer è una birra in stile Imperial Stout dal colore scuro.', 132, null, './img/daarbulah.jpg', null, 'Francia', 25, 33, 10, 'Birra'),
        (10, 'Xocoveza 12X', 'null', ' ', 99, 0, './img/xocoveza.jpg', 0, 'USA', 9, 33, 9, 'Birra'),
        (14, 'Giovanni', 'bianco', ' ', 234, 0, './img/1.jpg', 21, 'Campania', 21, 21, 21, 'Spumanti');