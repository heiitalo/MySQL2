CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classe(
id_classe INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
nacao VARCHAR(255) NOT NULL,
arma VARCHAR(255) NOT NULL,
PRIMARY KEY (id_classe)
);

CREATE TABLE tb_personagem(
id_personagem INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
hp BIGINT NOT NULL,
atk BIGINT NOT NULL,
def BIGINT NOT NULL,
mana BIGINT NOT NULL,
fk_personagem INT NOT NULL,
PRIMARY KEY(id_personagem),
FOREIGN KEY (fk_personagem) REFERENCES tb_classe(id_classe)
);

INSERT INTO tb_classe(nome, nacao, arma)
VALUES
("mago", "Tibia","tomo"),
("sacerdote", "Tibia", "cajado"),
("assassino", "Zaum", "adaga"),
("Guerreiro", "Valorant", "espada de duas mãos"),
("Paladino", "Valorant", "espada e escudo");

INSERT INTO tb_personagem(nome, hp, atk, def, mana,fk_personagem)
VALUES
("Gendalf", 1000, 50, 100, 5000, 1),
("Sion", 7000, 200, 2000, 200, 4),
("Pyke", 100, 3000, 100, 200, 3),
("Leona", 4000, 500, 2500, 500, 5),
("Jinx", 270, 2000, 800, 500, 3),
("Pedro bala", 2500, 1455, 4500,500, 2),
("Todo duro", 7000, 4555, 8000, 750, 4),
("Carne frita", 10000, 10000, 10000, 10000, 3);

SELECT * FROM db_generation_game_online.tb_personagem WHERE atk > 2000;
SELECT * FROM db_generation_game_online.tb_personagem WHERE def >= 1000 AND def <=2000;
SELECT * FROM db_generation_game_online.tb_personagem WHERE nome LIKE "%C%";

SELECT * FROM tb_personagem
INNER JOIN tb_classe ON tb_classe.id_classe = tb_personagem.fk_personagem;

SELECT * FROM tb_personagem
INNER JOIN tb_classe ON tb_classe.id_classe = tb_personagem.fk_personagem
WHERE tb_classe.nome = "Guerreiro";

