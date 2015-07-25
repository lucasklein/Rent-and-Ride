CREATE SCHEMA rentacar;

USE rentacar ;

-- -----------------------------------------------------
-- Table rentacar.pessoa
-- -----------------------------------------------------
DROP TABLE IF EXISTS rentacar.pessoa ;

CREATE TABLE IF NOT EXISTS rentacar.pessoa (
  cpf_cliente VARCHAR(45) NOT NULL,
  nome_cliente VARCHAR(60) NOT NULL,
  tel_cliente VARCHAR(45) NULL,
  cel_cliente VARCHAR(45) NULL,
  logradouro_cliente VARCHAR(60) NOT NULL,
  numero_cliente INT NOT NULL,
  complemento_cliente VARCHAR(45) NULL,
  email_cliente VARCHAR(60) NOT NULL,
  PRIMARY KEY (cpf_cliente))
ENGINE = InnoDB;

CREATE UNIQUE INDEX cpf_cliente_UNIQUE ON rentacar.pessoa (cpf_cliente ASC);


-- -----------------------------------------------------
-- Table rentacar.usuario
-- -----------------------------------------------------
DROP TABLE IF EXISTS rentacar.usuario ;

CREATE TABLE IF NOT EXISTS rentacar.usuario (
  login_usuario VARCHAR(45) NOT NULL,
  senha_usuario VARCHAR(45) NOT NULL,
  nivel_usuario INT NOT NULL,
  pessoa_cpf_cliente VARCHAR(45) NOT NULL,
  PRIMARY KEY (pessoa_cpf_cliente),
  CONSTRAINT fk_usuario_pessoa1
    FOREIGN KEY (pessoa_cpf_cliente)
    REFERENCES rentacar.pessoa (cpf_cliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX login_usuario_UNIQUE ON rentacar.usuario (login_usuario ASC);


-- -----------------------------------------------------
-- Table rentacar.veiculo
-- -----------------------------------------------------
DROP TABLE IF EXISTS rentacar.veiculo ;

CREATE TABLE IF NOT EXISTS rentacar.veiculo (
  chassi_veiculo VARCHAR(45) NOT NULL,
  marca_veiculo VARCHAR(45) NOT NULL,
  modelo_veiculo VARCHAR(45) NOT NULL,
  ano_veiculo INT NOT NULL,
  km_veiculo INT NOT NULL,
  obs_veiculo VARCHAR(200) NULL,
  foto_veiculo MEDIUMBLOB NOT NULL,
  status_veiculo INT NOT NULL,
  pessoa_cpf_cliente VARCHAR(45) NOT NULL,
  PRIMARY KEY (chassi_veiculo, pessoa_cpf_cliente),
  CONSTRAINT fk_veiculo_pessoa1
    FOREIGN KEY (pessoa_cpf_cliente)
    REFERENCES rentacar.pessoa (cpf_cliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX chassi_veiculo_UNIQUE ON rentacar.veiculo (chassi_veiculo ASC);

CREATE INDEX fk_veiculo_pessoa1_idx ON rentacar.veiculo (pessoa_cpf_cliente ASC);


-- -----------------------------------------------------
-- Table rentacar.aluga
-- -----------------------------------------------------
DROP TABLE IF EXISTS rentacar.aluga ;

CREATE TABLE IF NOT EXISTS rentacar.aluga (
  data_inicio DATETIME NOT NULL,
  data_devolucao DATETIME NOT NULL,
  observacao VARCHAR(300) NULL,
  alugacol VARCHAR(45) NULL,
  pessoa_cpf_cliente VARCHAR(45) NOT NULL,
  veiculo_chassi_veiculo VARCHAR(45) NOT NULL,
  CONSTRAINT fk_aluga_pessoa1
    FOREIGN KEY (pessoa_cpf_cliente)
    REFERENCES rentacar.pessoa (cpf_cliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_aluga_veiculo1
    FOREIGN KEY (veiculo_chassi_veiculo)
    REFERENCES rentacar.veiculo (chassi_veiculo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX fk_aluga_pessoa1_idx ON rentacar.aluga (pessoa_cpf_cliente ASC);

CREATE INDEX fk_aluga_veiculo1_idx ON rentacar.aluga (veiculo_chassi_veiculo ASC);


-- -----------------------------------------------------
-- Table rentacar.carona
-- -----------------------------------------------------
DROP TABLE IF EXISTS rentacar.carona ;

CREATE TABLE IF NOT EXISTS rentacar.carona (
  qtd_vagas INT NOT NULL,
  horario_saida VARCHAR(45) NOT NULL,
  destino VARCHAR(45) NOT NULL,
  usuario_pessoa_cpf_cliente VARCHAR(45) NOT NULL,
  PRIMARY KEY (usuario_pessoa_cpf_cliente),
  CONSTRAINT fk_carona_usuario1
    FOREIGN KEY (usuario_pessoa_cpf_cliente)
    REFERENCES rentacar.usuario (pessoa_cpf_cliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;