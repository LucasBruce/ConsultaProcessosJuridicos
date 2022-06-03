
/*1.Com base no modelo acima, escreva um comando SQL que liste
 a quantidade de processos por Status com sua descrição.*/

SELECT * FROM tb_Status as stat
LEFT JOIN tb_Processo as process
ON stat.idStatus = process.idStatus;


/*2.Com base no modelo acima, construa um comando SQL que liste a maior data de andamento 
por número de processo, com processos encerrados no ano de 2013.*/

SELECT max(dtAndamento) as Maior_Data,
DtEncerramento as data_encerramento,  nroProcesso as Numero_Processo
FROM tb_Processo as pro
INNER JOIN tb_Andamento as an
ON pro.idProcesso = an.idProcesso
WHERE year(DtEncerramento) = 2013
GROUP BY nroProcesso


/*3.Com base no modelo acima, construa um comando SQL que liste a quantidade de Data de 
Encerramento agrupada por ela mesma onde a quantidade da contagem seja maior que 5.*/ 

SELECT count(dtAndamento) AS data_encerramento FROM tb_Processo
GROUP BY data_encerramento
HAVING data_encerramento > 5;


/*4. Possuímos um número de identificação do processo, onde o mesmo contém 12 caracteres 
com zero à esquerda, contudo nosso modelo e dados ele é apresentado como bigint. Como 
fazer para apresenta-lo com 12 caracteres considerando os zeros a esquerda?*/ 

/*Passo 1.*/ alter table tb_Processo modify nroProcesso int(12) zerofill;

/*Passo 2.*/ select * from tb_Processo
