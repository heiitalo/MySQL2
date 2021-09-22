CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categoria(
id_categoria INT NOT NULL AUTO_INCREMENT,
tamanho VARCHAR(255) NOT NULL,
borda_recheada BOOLEAN NULL,
entrega_ou_retirada VARCHAR(255) NOT NULL,
PRIMARY KEY (id_categoria)
);

CREATE TABLE tb_pizza(
id_pizza INT NOT NULL AUTO_INCREMENT,
sabor VARCHAR(255) NOT NULL,
preco FLOAT NOT NULL,
adicional VARCHAR (255) NULL,
fk_pizza INT NOT NULL,
PRIMARY KEY (id_pizza),
FOREIGN KEY (fk_pizza) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria(tamanho, borda_recheada, entrega_ou_retirada)
VALUES
("pequena", TRUE, "entrega"),
("Grande", FALSE, "entrega"),
("Média", TRUE, "Retirada"),
("Grande", TRUE, "Retirada"),
("Média", FALSE, "Entrega");

INSERT INTO tb_pizza(sabor, preco,adicional, fk_pizza)
VALUES
("2 queijos", 40.90, "Bacon", 1),
("Brócolis", 30.50,"", 2),
("Calabresa", 25.90, "Catupiry", 3),
("Mussarela", 25.90,"", 4),
("Portuguesa", 45.50,"", 5),
("Napolitana", 50.00,"", 3),
("Camarão", 75.50,"", 2),
("Chocolate", 45.30, "Confetes",1);

SELECT * FROM  db_pizzaria_legal.tb_pizza WHERE preco > 45;
SELECT *FROM db_pizzaria_legal.tb_pizza WHERE preco BETWEEN 29 AND 60;
SELECT * FROM db_pizzaria_legal.tb_pizza WHERE sabor LIKE "%C%";

SELECT * FROM tb_pizza
INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_pizza.fk_pizza;

SELECT * FROM tb_pizza
INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_pizza.fk_pizza
WHERE tb_categoria.tamanho = "Grande";
