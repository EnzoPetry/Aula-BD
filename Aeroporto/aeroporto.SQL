CREATE TABLE passageiro (
	id BIGINT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	documento VARCHAR(14) NOT NULL
);

CREATE TABLE passagem (
	id BIGINT NOT NULL,
	preco MONEY NOT NULL,
	id_voo BIGINT NOT NULL,
	id_passageiro BIGINT NOT NULL
);

CREATE TABLE aeroporto (
	id BIGINT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	endereco VARCHAR(50) NOT NULL
);

CREATE TABLE piloto (
	id BIGINT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	documento VARCHAR(14) NOT NULL
);

CREATE TABLE aviao (
	id BIGINT NOT NULL,
	modelo VARCHAR(50) NOT NULL,
	assentos_total BIGINT NOT NULL,
	assentos_disponiveis BIGINT NOT NULL
);

CREATE TABLE voo (
	id BIGINT NOT NULL,
	data_partida DATE NOT NULL,
	data_chegada DATE NOT NULL,
	id_aeroporto_orig BIGINT NOT NULL,
	id_aeroporto_dest BIGINT NOT NULL,
	id_aviao BIGINT NOT NULL,
	id_piloto BIGINT NOT NULL
);
-----------------------------------------------------------------------------------
ALTER TABLE passageiro ADD PRIMARY KEY(id);
ALTER TABLE passagem ADD PRIMARY KEY(id);
ALTER TABLE aeroporto ADD PRIMARY KEY(id);
ALTER TABLE piloto ADD PRIMARY KEY(id);
ALTER TABLE aviao ADD PRIMARY KEY(id);
ALTER TABLE voo ADD PRIMARY KEY(id);

ALTER TABLE passagem ADD FOREIGN KEY(id_voo) REFERENCES voo(id);
ALTER TABLE passagem ADD FOREIGN KEY(id_passageiro) REFERENCES passageiro(id);

ALTER TABLE voo ADD FOREIGN KEY(id_aeroporto_orig) REFERENCES aeroporto(id);
ALTER TABLE voo ADD FOREIGN KEY(id_aeroporto_dest) REFERENCES aeroporto(id);
ALTER TABLE voo ADD FOREIGN KEY(id_aviao) REFERENCES aviao(id);
ALTER TABLE voo ADD FOREIGN KEY(id_piloto) REFERENCES piloto(id);

---------------------------------------------------------------------------------------
CREATE SEQUENCE passageiro_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE passageiro ALTER COLUMN id SET DEFAULT NEXTVAL('passageiro_id_seq');
---------------------------------------------------------------------------------------
CREATE SEQUENCE passagem_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE passagem ALTER COLUMN id SET DEFAULT NEXTVAL('passagem_id_seq');
---------------------------------------------------------------------------------------
CREATE SEQUENCE aeroporto_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE aeroporto ALTER COLUMN id SET DEFAULT NEXTVAL('aeroporto_id_seq');
---------------------------------------------------------------------------------------
CREATE SEQUENCE piloto_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE piloto ALTER COLUMN id SET DEFAULT NEXTVAL('piloto_id_seq');
---------------------------------------------------------------------------------------
CREATE SEQUENCE aviao_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE aviao ALTER COLUMN id SET DEFAULT NEXTVAL('aviao_id_seq');
---------------------------------------------------------------------------------------
CREATE SEQUENCE voo_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE voo ALTER COLUMN id SET DEFAULT NEXTVAL('voo_id_seq');
---------------------------------------------------------------------------------------