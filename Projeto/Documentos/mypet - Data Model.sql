
CREATE SEQUENCE USUARIO_ID_ANIMAL_SEQ;

CREATE TABLE mypetdb.ANIMAL (
                ID_ANIMAL NUMBER(10) NOT NULL,
                IS_EXCLUIDO NUMBER(1) NOT NULL,
                NOME VARCHAR2(200) NOT NULL,
                FOTO BLOB NOT NULL,
                TP_ESPECIE NUMBER(2) NOT NULL,
                TP_RACA NUMBER(2) NOT NULL,
                PESO NUMBER(5) NOT NULL,
                OBSERVACOES VARCHAR2(500),
                CONSTRAINT ID_ANIMAL PRIMARY KEY (ID_ANIMAL)
);


CREATE SEQUENCE ATENDIMENTO_ID_ATENDIMENTO_SEQ;

CREATE TABLE mypetdb.ATENDIMENTO (
                ID_ATENDIMENTO NUMBER(10) NOT NULL,
                ID_ANIMAL NUMBER(10) NOT NULL,
                IS_EXCLUIDO NUMBER(1) NOT NULL,
                TP_SITUACAO NUMBER(1) NOT NULL,
                DATA DATE NOT NULL,
                DATA_FINALIZACAO DATE,
                OBSERVACOES VARCHAR2(500),
                CONSTRAINT ID_ATENDIMENTO PRIMARY KEY (ID_ATENDIMENTO)
);


CREATE SEQUENCE USUARIO_ID_INSUMO_SEQ;

CREATE TABLE mypetdb.INSUMO (
                ID_INSUMO NUMBER(10) NOT NULL,
                IS_EXCLUIDO NUMBER(1) NOT NULL,
                IS_ATIVO NUMBER(1) NOT NULL,
                DESCRICAO VARCHAR2(400) NOT NULL,
                OBSERVACOES VARCHAR2(500),
                CONSTRAINT ID_INSUMO PRIMARY KEY (ID_INSUMO)
);


CREATE SEQUENCE USUARIO_ID_ATENDIMENTO_INSU147;

CREATE TABLE mypetdb.ATENDIMENTO_INSUMO (
                ID_ATENDIMENTO_INSUMO NUMBER(10) NOT NULL,
                ID_INSUMO NUMBER(10) NOT NULL,
                ID_ATENDIMENTO NUMBER(10) NOT NULL,
                QUANTIDADE NUMBER(4),
                CONSTRAINT ID_ATENDIMENTO_INSUMO PRIMARY KEY (ID_ATENDIMENTO_INSUMO, ID_INSUMO, ID_ATENDIMENTO)
);


CREATE SEQUENCE USUARIO_ID_PROCEDIMENTO_SEQ;

CREATE TABLE mypetdb.PROCEDIMENTO (
                ID_PROCEDIMENTO NUMBER(10) NOT NULL,
                IS_EXCLUIDO NUMBER(1) NOT NULL,
                IS_ATIVO NUMBER(1) NOT NULL,
                DESCRICAO VARCHAR2(400) NOT NULL,
                OBSERVACOES VARCHAR2(500),
                CONSTRAINT ID_PROCEDIMENTO PRIMARY KEY (ID_PROCEDIMENTO)
);


CREATE SEQUENCE ATENDIMENTO_PROCEDIMENTO_ID629;

CREATE TABLE mypetdb.ATENDIMENTO_PROCEDIMENTO (
                ID_ATENDIMENTO_PROCEDIMENTO NUMBER(10) NOT NULL,
                ID_PROCEDIMENTO NUMBER(10) NOT NULL,
                ID_ATENDIMENTO NUMBER(10) NOT NULL,
                CONSTRAINT ID_ATENDIMENTO_PROCEDIMENTO PRIMARY KEY (ID_ATENDIMENTO_PROCEDIMENTO, ID_PROCEDIMENTO, ID_ATENDIMENTO)
);


CREATE SEQUENCE USUARIO_ID_USUARIO_SEQ;

CREATE TABLE mypetdb.USUARIO (
                ID_USUARIO NUMBER(10) NOT NULL,
                IS_EXCLUIDO NUMBER(1) NOT NULL,
                IS_ATIVO NUMBER(1) NOT NULL,
                TP_USUARIO NUMBER(1) NOT NULL,
                NOME VARCHAR2(200) NOT NULL,
                CPF NUMBER(11) NOT NULL,
                EMAIL VARCHAR2(100),
                FONE_RESIDENCIAL NUMBER,
                FONE_CELULAR NUMBER NOT NULL,
                SENHA VARCHAR2(20) NOT NULL,
                ENDERECO VARCHAR2(100) NOT NULL,
                CIDADE VARCHAR2(100) NOT NULL,
                OBSERVACOES VARCHAR2(500),
                CONSTRAINT ID PRIMARY KEY (ID_USUARIO)
);


CREATE TABLE mypetdb.USUARIO_ANIMAL (
                ID_USUARIO NUMBER(10) NOT NULL,
                ID_ANIMAL NUMBER(10) NOT NULL,
                CONSTRAINT ID_USUARIO_ANIMAL PRIMARY KEY (ID_USUARIO, ID_ANIMAL)
);


ALTER TABLE mypetdb.USUARIO_ANIMAL ADD CONSTRAINT ANIMAL_USUARIO_ANIMAL_FK
FOREIGN KEY (ID_ANIMAL)
REFERENCES mypetdb.ANIMAL (ID_ANIMAL)
NOT DEFERRABLE;

ALTER TABLE mypetdb.ATENDIMENTO ADD CONSTRAINT ANIMAL_ATENDIMENTO_FK
FOREIGN KEY (ID_ANIMAL)
REFERENCES mypetdb.ANIMAL (ID_ANIMAL)
NOT DEFERRABLE;

ALTER TABLE mypetdb.ATENDIMENTO_INSUMO ADD CONSTRAINT ATND_ATND_INSU_FK
FOREIGN KEY (ID_ATENDIMENTO)
REFERENCES mypetdb.ATENDIMENTO (ID_ATENDIMENTO)
NOT DEFERRABLE;

ALTER TABLE mypetdb.ATENDIMENTO_PROCEDIMENTO ADD CONSTRAINT ATEND_ATEND_PROCED_FK
FOREIGN KEY (ID_ATENDIMENTO)
REFERENCES mypetdb.ATENDIMENTO (ID_ATENDIMENTO)
NOT DEFERRABLE;

ALTER TABLE mypetdb.ATENDIMENTO_INSUMO ADD CONSTRAINT INSUMO_ATENDIMENTO_INSUMO_FK
FOREIGN KEY (ID_INSUMO)
REFERENCES mypetdb.INSUMO (ID_INSUMO)
NOT DEFERRABLE;

ALTER TABLE mypetdb.ATENDIMENTO_PROCEDIMENTO ADD CONSTRAINT PROC_ATEND_PROCED_FK
FOREIGN KEY (ID_PROCEDIMENTO)
REFERENCES mypetdb.PROCEDIMENTO (ID_PROCEDIMENTO)
NOT DEFERRABLE;

ALTER TABLE mypetdb.USUARIO_ANIMAL ADD CONSTRAINT USUARIO_USUARIO_ANIMAL_FK
FOREIGN KEY (ID_USUARIO)
REFERENCES mypetdb.USUARIO (ID_USUARIO)
NOT DEFERRABLE;