-- Criando o banco
CREATE 
	DATABASE spotify_atividade;
    
    
-- Utilizando o banco para realizar as operações
USE spotify_atividade;

-- Criando a tabela 
CREATE TABLE spotify_top(
	posicao INT AUTO_INCREMENT,
    artista VARCHAR(50),
    musica VARCHAR(255),
    dias INT,
    top_vezes DOUBLE,
    maior_posicao INT,
    vezes_maior_posicao VARCHAR(10),
    pico_streams INT,
    total_streams INT,
    PRIMARY KEY (posicao)
);

-- Ver tabela top
SELECT * FROM spotify_atividade.spotify_top;

-- Q1 CONTA QUANTOS ARTISTAS  estão com valor nulo no nome.
SELECT COUNT(artista) AS qtd_artistas
FROM spotify_top
WHERE artista IS NULL;

-- Q2 Contagem total de registros na tabela
SELECT COUNT(*) AS total_registros
FROM spotify_top;

-- Q3 Contagem de quantas musicas foram top 1
SELECT COUNT(musica) AS qtd_musicas_top1
FROM spotify_top
WHERE maior_posicao = 1;


-- Q4 QUAL A MÚSICA QUE FICOU MAIS VEZES NO TOP 1
SELECT musica, COUNT(*) AS vezes_no_topo
FROM spotify_top
WHERE maior_posicao = 1
GROUP BY musica
ORDER BY vezes_no_topo DESC
LIMIT 5;

-- Q5 QUANTOS ARTISTAS DIFERENTES HÁ
SELECT COUNT(DISTINCT artista) AS total_artista_diferente
FROM spotify_top; 

-- Q6 QUAL MÚSICA COM MAIS STREAMS
SELECT posicao, artista, pico_streams 
FROM spotify_top
ORDER BY pico_streams DESC
LIMIT 1;


-- Q7 QUAL MÚSICA COM MAIOR PICO TOTAL DE STREAMS
SELECT musica, artista, total_streams
FROM spotify_top
ORDER BY total_streams DESC
LIMIT 1;


-- Q8 Qual artista ficou mais vezes no top
SELECT artista, COUNT(*) AS vezes_no_top1
FROM spotify_top
WHERE maior_posicao = 1 
GROUP BY artista
ORDER BY vezes_no_top1 DESC
LIMIT 1;

-- Q9 Qual artista possui mais registros
SELECT artista, COUNT(*) AS mais_registro
FROM spotify_top
GROUP BY artista
ORDER BY mais_registro DESC
LIMIT 1;

-- Q10 Quantos artistas começam com “H”
SELECT COUNT(DISTINCT artista) AS artistas_com_H
FROM spotify_top
WHERE artista LIKE 'H%';


-- Q11 Músicas da Anitta
SELECT musica, artista
FROM spotify_top
WHERE artista = 'Anitta'
GROUP BY musica; 

-- Q12 Quantas músicas passaram de 500 mil streams
SELECT artista, COUNT(*) AS passou_500
FROM spotify_top
WHERE pico_streams > 500000
GROUP BY artista
ORDER BY passou_500 DESC;

-- Q13 Música no registro 3480
SELECT *
FROM spotify_top
LIMIT 1
OFFSET 3479;

-- Q14 Quantas músicas o artista “The Weeknd” possui e quais.
SELECT artista, COUNT(DISTINCT musica) AS total_musicas
FROM spotify_top
WHERE artista = 'The Weeknd';



-- Q14.1 Lista das músicas
SELECT DISTINCT musica, artista
FROM spotify_top
WHERE artista = 'The Weeknd';

-- Q15 Quantas músicas possuem “girl” no nome

SELECT COUNT(musica) AS nome_girls
FROM spotify_top
WHERE musica LIKE '%girl%';
--  --------------------
SELECT COUNT(*)
FROM TOP
WHERE MUSICA LIKE '%girl%';
-- Total de streams do Post Malone
SELECT SUM(PICO_STREAMS) AS TOTA_PICOS , ARTISTA 
FROM TOP
WHERE ARTISTA = 'Post Malone';

-- Q17 Top 5 artistas com mais registros
SELECT artista, COUNT(*) AS top_5
FROM spotify_top
GROUP BY artista
ORDER BY top_5 DESC
LIMIT 5;

-- Total de streams das 10 músicas com mais streams
SELECT SUM(PICO_STREAMS) AS total_top10
FROM TOP 
ORDER BY PICO_STREAMS DESC
LIMIT 10;
-- Músicas que foram top 1 e ficaram entre 40 e 60 vezes
SELECT MUSICA
FROM TOP
WHERE MAIOR_POSICAO = 1
AND TOP_VEZES BETWEEN 40 AND 60;
-- Músicas com menos de 500 mil streams e posição entre 5 e 10
SELECT musica
FROM spotify_top
WHERE PICO_STREAMS < 500000
AND MAIOR_POSICAO BETWEEN 5 AND 10;

-- Música com menor streams que chegou ao top 1
SELECT ARTISTA, MUSICA, PICO_STREAMS
FROM TOP
WHERE MAIOR_POSICAO = 1
ORDER BY PICO_STREAMS ASC
LIMIT 1;
-- Música com menor streams da Taylor Swift
SELECT ARTISTA, MUSICA, PICO_STREAMS AS TOTAL_VISU
FROM TOP
WHERE ARTISTA = 'Taylor Swift'
ORDER BY PICO_STREAMS ASC --  MENOR = ASC 
LIMIT 1;