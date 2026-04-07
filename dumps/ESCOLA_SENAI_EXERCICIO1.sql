CREATE 	
		DATABASE escola_senai;
        
-- UTILIZANDO O BANCO	
USE escola_senai;

-- CRIAR TABELA - TB-ALUNO
CREATE TABLE tb_aluno(
ra_aluno INT AUTO_INCREMENT,
nome_aluno VARCHAR(255) NOT NULL,
dt_nasc_aluno DATE,
cpf_aluno CHAR(11) NOT NULL UNIQUE,
sexo_aluno ENUM('M', 'F'),
PRIMARY KEY(ra_aluno)
);

-- CRIAR TABELA - TB-CURSO
CREATE TABLE tb_curso(
cod_curs INT AUTO_INCREMENT,
nome_curs VARCHAR(255),
per_curs INT,
dur_curs INT,
valor_curs DECIMAL(6,2),
PRIMARY KEY(cod_curs)
);

-- CRIAR TABELA - TB-MATRICULA
CREATE TABLE tb_matricula(
cod_mat INT AUTO_INCREMENT,
data_mat DATE NOT NULL,
cod_curs INT NOT NULL,
ra_aluno INT NOT NULL,
PRIMARY KEY(cod_mat),
FOREIGN KEY (ra_aluno) REFERENCES tb_aluno(ra_aluno),
FOREIGN KEY (cod_curs) REFERENCES tb_curso(cod_curs)
);


-- INSERIR INFORMAÇÕES NO BANCO - COM COLUNAS - TABELA ALUNO
INSERT INTO tb_aluno(nome_aluno, dt_nasc_aluno, cpf_aluno, sexo_aluno)
			VALUES
					('João','2007-02-12',"12345678999","M"),
					('Thiago','2008-02-01',"21232367129","M"),
					('Maria','2002-04-23',"22245678999","F"),
					('Arthur','2004-05-02',"56712345678","M"),
					('Beatriz','2006-01-18',"33345678999","F"),
					('Pedro','2008-01-14',"43212345679","M"),
					('Lucas','2005-03-10',"98765432100","M"),
					('Ana','2003-07-22',"65498732111","F"),
					('Carla','2001-11-05',"78912345600","F"),
					('Bruno','2007-09-30',"32165498722","M");
                    

-- INSERIR INFORMAÇÕES NO BANCO - COM COLUNAS - TABELA CURSO
INSERT INTO tb_curso(nome_curs, per_curs, dur_curs, valor_curs)
			VALUES 
					('Desenvolvimento de Sistemas', 1, 200, 500.00),
					('Banco de Dados', 2, 180, 600.00),
					('Redes', 3, 160, 550.00),
					('Java', 1, 220, 700.00),
					('Engenharia de Software', 2, 210, 650.00);
                    
                    
-- INSERIR INFORMAÇÕES NO BANCO - COM COLUNAS - TABELA MATRICULA
INSERT INTO tb_matricula(data_mat, cod_curs, ra_aluno)
			VALUES 
					('2026-02-12',2,3),
                    ('2026-04-16',1,5),
                    ('2026-01-03',4,10),
                    ('2026-01-18', 4, 4),
					('2026-01-20', 5, 5),
					('2026-01-22', 1, 6),
					('2026-01-25', 2, 7),
					('2026-01-28', 3, 8),
					('2026-02-01', 4, 9),
					('2026-02-03', 5, 10),
					('2026-02-05', 1, 2),
					('2026-02-08', 2, 3),
					('2026-02-10', 3, 4),
					('2026-02-12', 4, 5),
					('2026-02-15', 5, 6),
					('2026-02-18', 1, 7),
					('2026-02-20', 2, 8),
					('2026-02-22', 3, 9),
					('2026-02-25', 4, 10),
					('2026-02-28', 5, 1);
                    

-- Ver Tabela de Aluno
SELECT * FROM tb_aluno;

-- Ver Tabela de Curso
SELECT * FROM tb_curso;

-- Ver Tabela de Matricula
SELECT * FROM tb_matricula;







-- Função abaixo foi pega no chat :)
-- Seleciona as colunas que serão exibidas no resultado
SELECT 
    a.ra_aluno AS ra_aluno,         -- pega o RA do aluno da tabela tb_aluno (apelidada como "a")
    a.nome_aluno AS nome_aluno,     -- pega o nome do aluno
    c.nome_curs AS nome_Curso,      -- pega o nome do curso da tabela tb_curso (apelidada como "c")
    m.data_mat AS data_matricula    -- pega a data da matrícula da tabela tb_matricula (apelidada como "m")

-- Define a tabela principal da consulta
FROM tb_matricula m                -- tb_matricula é a tabela base, apelidada como "m"

-- Faz a ligação entre tb_matricula e tb_aluno
JOIN tb_aluno a 
ON a.ra_aluno = m.ra_aluno         -- relaciona o RA do aluno nas duas tabelas

-- Faz a ligação entre tb_matricula e tb_curso
JOIN tb_curso c 
ON c.cod_curs = m.cod_curs         -- relaciona o código do curso nas duas tabelas

-- Ordena o resultado final
ORDER BY a.nome_aluno;             -- organiza os dados em ordem alfabética pelo nome do aluno