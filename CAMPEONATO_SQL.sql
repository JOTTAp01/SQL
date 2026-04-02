CREATE 
	DATABASE campeonato;

-- Utilizando o banco    
USE campeonato;


-- Cria a tabela equipe
CREATE TABLE equipe(
	cod_equipe INT AUTO_INCREMENT,
    nome_equipe VARCHAR(47) NOT NULL,
	sigla_equipe CHAR(3) UNIQUE,
    estado CHAR(2),
    PRIMARY KEY (cod_equipe)
);

-- Cria a tabela de jogador
CREATE TABLE jogador(
	cod_jogador INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nacionalidade VARCHAR(50),
    altura DECIMAL(3,2),
    peso DECIMAL(6,3),
    idade INT,
    numero_camisa INT,
    posicao ENUM("GOLEIRO", "ZAGUEIRO", "MEIO-CAMPO", "ATACANTE"),
    id_equipe INT,
    PRIMARY KEY(cod_jogador),
	FOREIGN KEY (id_equipe) REFERENCES equipe(cod_equipe)
);


-- CRUD NO BANCO
-- FORMA 1 - COM COLUNAS
INSERT INTO equipe(nome_equipe, sigla_equipe, estado)
			VALUES("Gama","GAM","DF");

-- FORMA 2 - SEM COLUNAS
INSERT INTO equipe
			VALUES(DEFAULT, "Vasco da Gama", "VAS","RJ");
            
INSERT INTO equipe
			VALUES(DEFAULT, "Botafogo", "BOT", "RJ"),
				(DEFAULT, "Grêmio", "GRE", "RS");
            
            
-- R - READ
SELECT * FROM equipe;


INSERT INTO equipe(nome_equipe, sigla_equipe, estado)
			VALUES("Desportiva","DPV","ES");

            
INSERT INTO equipe(nome_equipe, sigla_equipe, estado)
			VALUES("Ponte Preta","APP","SP");


INSERT INTO equipe(nome_equipe, sigla_equipe, estado)
			VALUES("Porto","PRT","ES");
            
            
INSERT INTO equipe(nome_equipe, sigla_equipe, estado)
			VALUES("Vitoria","VTR","ES");
            

-- inserindo varias equipes
INSERT INTO equipe(nome_equipe, sigla_equipe, estado)
			VALUES
					("São Paulo","SPA","SP"),
                    ("Real Madrid","RMD","PA"),
                    ("Mancheter United", "MUN", "AC");
            

-- U - Update 
UPDATE equipe
SET estado = "MD"
WHERE nome_equipe = "Real Madrid";


-- D - DELETE
DELETE FROM equipe
WHERE cod_equipe = 6;

-- INSERIR JOGADORES
INSERT INTO jogador(nome,peso , numero_camisa, posicao, id_equipe)
			VALUES
					("Vinícius Jr.", 73.0, 7, "ATACANTE", 10),
                    ("Coutinho", 78.0, 10, "MEIO-CAMPO", 11),
                    ("Hugo Souza", 92.0, 1, "GOLEIRO", 5);

INSERT INTO jogador(nome,peso , numero_camisa, posicao, id_equipe)
			VALUES
                    ("Coutinho", 78.0, 10, "MEIO-CAMPO", 11),
                    ("Hugo Souza", 92.0, 1, "GOLEIRO", 5);
            
-- Ver Tabela de Jogadores
SELECT * FROM jogador;

