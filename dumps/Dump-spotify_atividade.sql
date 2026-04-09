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

-- CONTA QUANTOS ARTISTAS  estão com valor nulo no nome.
SELECT COUNT(artista) AS qtd_artistas
FROM spotify_top
WHERE artista IS NULL;

-- Contagem toral de registros na tabela
SELECT COUNT(*) AS total_registros
FROM spotify_top;

-- Contagem de quantas musicas foram top 1
SELECT COUNT(musica) AS qtd_musicas_top1
FROM spotify_top
WHERE maior_posicao = 1;



-- 4. Qual a música que ficou por mais vezes no top 1 (Uso de Subconsulta e MAX)
SELECT musica, vezes_maior_posicao
FROM spotify_top
WHERE CAST(vezes_maior_posicao AS UNSIGNED) = (
    SELECT MAX(CAST(vezes_maior_posicao AS UNSIGNED)) 
    FROM spotify_top 
    WHERE maior_posicao = 1
);

-- 5. Quantos artistas diferentes há
SELECT COUNT(DISTINCT artista) AS total_artistas_unicos
FROM spotify_top;

-- 6. Qual música com mais streams
SELECT musica, total_streams
FROM spotify_top
WHERE total_streams = (SELECT MAX(total_streams) FROM spotify_top);

-- 7. Qual música com maior pico de streams
SELECT musica, pico_streams
FROM spotify_top
ORDER BY pico_streams DESC
LIMIT 1;

-- 8. Qual artista ficou mais vezes no top 1
SELECT artista, SUM(CAST(vezes_maior_posicao AS UNSIGNED)) AS soma_top
FROM spotify_top
WHERE maior_posicao = 1
GROUP BY artista
ORDER BY soma_top DESC
LIMIT 1;

-- 9. Qual artista possui mais registros
SELECT artista, COUNT(*) AS registros
FROM spotify_top
GROUP BY artista
ORDER BY registros DESC
LIMIT 1;

-- 10. Quantos artistas possuem nome iniciando com a letra “H”
SELECT COUNT(DISTINCT artista)
FROM spotify_top
WHERE artista LIKE 'H%';

-- 11. Quais as músicas da artista “Anitta” estão na tabela
SELECT DISTINCT musica
FROM spotify_top
WHERE artista = 'Anitta';

-- 12. Quantas músicas passaram da marca de 500 mil streams
SELECT COUNT(*)
FROM spotify_top
WHERE total_streams > 500000;

-- 13. Qual a música no registro 3480
SELECT musica
FROM spotify_top
WHERE posicao = 3480;

-- 14. Quantas músicas o artista “The Weeknd” possui e quais
SELECT COUNT(musica) AS qtd, GROUP_CONCAT(musica) AS lista
FROM spotify_top
WHERE artista = 'The Weeknd';

-- 15. Quantas músicas possuem “girl” no nome
SELECT COUNT(*)
FROM spotify_top
WHERE musica LIKE '%girl%';

-- 16. Qual o total de streams do artista “Post Malone”
SELECT SUM(total_streams) AS total_post_malone
FROM spotify_top
WHERE artista = 'Post Malone';

-- 17. Quais são os 5 artistas com mais registros, de forma decrescente
SELECT artista, COUNT(*) AS total
FROM spotify_top
GROUP BY artista
ORDER BY total DESC
LIMIT 5;

-- 18. Qual o total de streams das 10 músicas com mais streams (Uso de Subconsulta)
SELECT SUM(total_streams) AS soma_top10
FROM (
    SELECT total_streams 
    FROM spotify_top 
    ORDER BY total_streams DESC 
    LIMIT 10
) AS sub;

-- 19. Quais as músicas que já estiveram no top 1 e estiveram entre 40 e 60 vezes na maior posição
SELECT musica
FROM spotify_top
WHERE maior_posicao = 1 
AND CAST(vezes_maior_posicao AS UNSIGNED) BETWEEN 40 AND 60;

-- 20. Quais músicas tiveram menos de 500 mil streams e ficaram entre o top 5 e 10
SELECT musica
FROM spotify_top
WHERE total_streams < 500000 
AND maior_posicao BETWEEN 5 AND 10;

-- 21. Qual a música com o mínimo de streams que atingiu a 1ª posição (Uso de MIN)
SELECT musica, total_streams
FROM spotify_top
WHERE maior_posicao = 1 
AND total_streams = (SELECT MIN(total_streams) FROM spotify_top WHERE maior_posicao = 1);

-- 22. Qual a música com o mínimo de streams da artista Taylor Swift
SELECT musica, total_streams
FROM spotify_top
WHERE artista = 'Taylor Swift'
ORDER BY total_streams ASC
LIMIT 1;
