-- Criando o banco
CREATE 
	DATABASE spotify;

-- Utilizando o banco para realizar as operações
USE spotify;

-- Criando a tabela 
CREATE TABLE top(
	posicao INT AUTO_INCREMENT,
    artista VARCHAR(50),
    musica VARCHAR(255),
    dias INT,
    top_vezes DOUBLE,
    maior_posicao int,
    vezes_maior_posicao VARCHAR(10),
    pico_streams INT,
    total_streams INT,
    PRIMARY KEY (posicao)
);

-- Ver tabela top
SELECT * FROM spotify.top;

-- FILTRANDO COLUNAS
SELECT posicao, artista, musica
FROM top;


-- FILTRANDO COM WHERE
SELECT posicao, artista, musica
FROM top
WHERE artista = "Travis Scott";

-- Filtrando operadores relacionais >, <, <>, <=, >=
SELECT *
FROM top
WHERE artista = "SZA" AND maior_posicao = 5;


-- ORDENANDO = ORDER BY, ASC = DE CIMA PRA BAIXO, DESC = DE BAIXO PRA CIMA
SELECT artista, musica
FROM top
ORDER BY artista DESC;

-- ENTRE = BETWEEN
SELECT *
FROM top
WHERE maior_posicao BETWEEN 10 AND 15;

-- POR LETRA
SELECT *
FROM top
WHERE artista BETWEEN 'Adele' AND 'Calvin Harris'
ORDER BY artista;

-- IN - DENTRO DE UMA LISTA
-- POR NOMES
SELECT *
FROM top
WHERE artista IN ('Justin Bieber', 'Maroon 5', 'Queen');


-- POR NUMEROS
SELECT *
FROM top
WHERE dias IN (20, 30, 40);


-- LIKE - PESQUISA NOMES COM %
SELECT artista, musica
FROM top
WHERE musica LIKE 'Super%';


-- NO INICIO
SELECT artista, musica
FROM top
WHERE musica LIKE '%blue';


-- NO MEIO
SELECT artista, musica
FROM top
WHERE musica LIKE '%boy%';

-- COUNT
SELECT COUNT(*) AS contagem
FROM top;

SELECT COUNT(*) AS contagem
FROM top
WHERE artista = 'Travis Scott';

-- DISTINCT - REGISTROS DIFERENTES
SELECT DISTINCT (artista) AS diferente
FROM top
ORDER BY artista;

-- CONTAGEM DE ARTISTAS DIFERENTES
SELECT COUNT(DISTINCT (artista)) AS contagem
FROM top
ORDER BY artista; 

-- AGRUPAR RESULTADOS
SELECT artista, COUNT(artista) as vezes
FROM top
GROUP BY artista;

-- LIMIT - LIMITA OS RESULTADOS
SELECT *
FROM top
WHERE maior_posicao = 7 
LIMIT 5;


-- SOMA DE ESULTADOS
SELECT SUM(total_streams) AS total_de_streams_da_tabela
FROM top;

-- MÉDIA DE RESULTADOS
SELECT AVG(total_streams) as media_de_streams_da_tebela
FROM top;

-- VALOR MAXIMO
SELECT MAX(total_streams) as maximo_de_streams_da_tebela
FROM top;

-- VALOR MINIMO
SELECT MIN(total_streams) as minimo_de_streams_da_tebela
FROM top;

-- VERIFICA SE O VALOR É NULO
SELECT *
FROM top
WHERE maior_posicao IS NULL;




-- Utilizando subquerie
-- Quais musicas tem o total de streams acima da media?
SELECT musica, total_streams
FROM top
WHERE total_streams > (
	SELECT AVG(total_streams)
	FROM top
);



-- Musica com mais streams
SELECT musica, total_streams
FROM top
WHERE total_streams = (
	SELECT MAX(total_streams)
    FROM top
);


