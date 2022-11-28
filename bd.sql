CREATE TABLE Clientes (
    CNPJ CHAR(14) NOT NULL,
	Localidade VARCHAR(50),
    Estado VARCHAR(50),
	CONSTRAINT PK_CLIENTES 	PRIMARY KEY (CNPJ),
	CONSTRAINT CK_CLIENTES_CNPJ CHECK (LENGTH(CNPJ) = 14)
);

CREATE TABLE Unidades (
    ID_Unidade SERIAL NOT NULL,
	Telefone VARCHAR(11),
    Nome VARCHAR(100),
    Rua VARCHAR(100),
    Numero VARCHAR(5),
    Bairro VARCHAR(100),
	CONSTRAINT PK_UNIDADES 	PRIMARY KEY (ID_Unidade)
);

CREATE TABLE Funcionarios (
    CPF CHAR(11) NOT NULL ,
    Nome VARCHAR(100),
    telefone VARCHAR(15),
    Salario VARCHAR(12),
    Rua VARCHAR(100),
    CNS CHAR(16) Default '',
	ID_Unidade SERIAL NOT NULL , 
	CONSTRAINT PK_FUNCIONARIOS 	PRIMARY KEY (CPF),
	CONSTRAINT CK_FUNCIONARIOS_CPF CHECK (LENGTH(CPF) = 11),
	CONSTRAINT CK_FUNCIONARIOS_CNS CHECK (LENGTH(CNS) = 16),
	CONSTRAINT FK_FUNCIONARIOS FOREIGN KEY (ID_Unidade) REFERENCES Unidades
);
/*CNS CHAR(16) Default '', esse Default '' são utilizadas para que quando criado os CNS, possam ser Nulos ou não*/
CREATE TABLE Tablet (
    Numero_De_Serie VARCHAR(20) NOT NULL,
    Modelo VARCHAR(10),
    Marca VARCHAR(20),
	CONSTRAINT PK_TABLET PRIMARY KEY (Numero_De_Serie)
);

CREATE TABLE Agente_Saude (
    CPF CHAR(11) NOT NULL,
    Registro DATE, 
	CONSTRAINT PK_AgenteSaude PRIMARY KEY (CPF),
	CONSTRAINT FK_AgenteSaude FOREIGN KEY (CPF) REFERENCES Funcionarios (CPF),
	CONSTRAINT CK_FUNCIONARIOS_CPF CHECK (LENGTH(CPF) = 11)
);

CREATE TABLE Possui (
  ID_Unidade INT NOT NULL,
  ID_Cliente CHAR(14) NOT NULL,
  CONSTRAINT PK_Possui 	PRIMARY KEY (ID_Unidade, ID_Cliente),
  CONSTRAINT FK_Possuipri 	FOREIGN KEY (ID_Unidade) 	REFERENCES Unidades (ID_Unidade),
  CONSTRAINT FK_Possuisec 	FOREIGN KEY (ID_Cliente) REFERENCES Clientes (CNPJ)

);

CREATE TABLE Tem (
  ID_Tablet VARCHAR(20) NOT NULL,
  ID_Agente CHAR(14) NOT NULL,
  CONSTRAINT PK_Tem 	PRIMARY KEY (ID_Tablet, ID_Agente),
  CONSTRAINT FK_Tempri 	FOREIGN KEY (ID_Tablet) REFERENCES Tablet (Numero_De_Serie),
  CONSTRAINT FK_Temsec 	FOREIGN KEY (ID_Agente) REFERENCES Agente_Saude (CPF)
);

CREATE TABLE Novetech (
	ID SERIAL NOT NULL ,
    CNPJ CHAR(14) NOT NULL default '05621288000135',
	ID_Cliente CHAR(14) NOT NULL,
	ID_Tablet VARCHAR(20) NOT NULL,
	CONSTRAINT PK_EMPRESA PRIMARY KEY (ID),
	CONSTRAINT FK_EMPRESA_CLIENTES FOREIGN KEY (ID_Cliente) REFERENCES Clientes (CNPJ),
	CONSTRAINT FK_EMPRESA_TABLET FOREIGN KEY (ID_Tablet) REFERENCES Tablet (Numero_De_Serie),
	CONSTRAINT CK_EMPRESA_CNPJ CHECK (LENGTH(CNPJ) = 14)	
);

CREATE TABLE Contato_Cliente (
   	Numero CHAR(11) NOT NULL,
	ID_Cliente 	CHAR(14) NOT NULL,
	CONSTRAINT PK_CONTATO 	PRIMARY KEY (Numero, ID_Cliente),
	CONSTRAINT FK_CONTATO 	FOREIGN KEY (ID_Cliente) REFERENCES Clientes (CNPJ),
	CONSTRAINT CK_CONTATO_NUMERO CHECK (LENGTH(Numero) = 11)
);


--======================================================     INSERÇÃO     ========================================================== 
INSERT INTO Novetech VALUES
(default,default,'08184111000107' ,'R8AN300321E'),
(default, default,'08184111000107', 'R8AN400321O' ),
(default,default, '08184111000107','R8AN900321I' ),
(default,default, '08184111000107', 'R8AN600321J' ),
(default, default, '08184111000107', 'R8AN100321Ç' ),
(default, default, '01612369000118', 'R6N309071D'  ), 
(default, default, '01612369000118','R6N309071F'  ), 
(default, default, '01612369000118', 'R6N309071Q' ), 
(default,default, '01612369000118', 'R6N309071H' ), 
(default, default, '01612369000118', 'R6N309071C'  ), 
(default, default , '01612369000118','R6N309071P'), 
(default, default,'08349078000128', 'R9XN300132O'  ),
(default, default, '08349078000128','R9XQ3000321'  ), 
(default, default, '08349078000128','R5XN3000322' ), 
(default, default, '08349078000128', 'R5XN3000323'), 
(default, default, '08349078000128', 'R5XB4000324' ),
(default, default, '08184434000109', 'R1XI320042Y' ), 
(default, default, '08184434000109', 'R1XI320041Z'  ), 
(default, default, '08184434000109', 'R1XI333041J' ), 
(default, default, '08184434000109','R1XI321041B' ), 
(default, default, '08184434000109','R1XI600041Q'  ),
(default, default, '08294670000170','R9XZ300071C' ), 
(default, default, '08294670000170', 'R9XZ301071D' ), 
(default, default, '08294670000170', 'R9XZ100071G' ), 
(default, default, '08294670000170', 'R9XZ600071J' ), 
(default, default, '08113896000127', 'R9XZ900071S'), 
(default, default, '08113896000127','R9XZ110071O');


INSERT INTO Contato_Cliente VALUES
('08435232212', '08184111000107'),
('08435382376', '01612369000118'),
('08433612208', '08349078000128'),
('08435211330',  '08184434000109'),
('08435550013', '08113896000127'),
('08136312038', '11361904000169'),
('08433382214',  '08294670000170');

INSERT INTO Clientes VALUES
('85469514736974',default, default),
('08184111000431',default, 'Amazonas'),
('08184111000107','Alto do Rodrigues', 'Rio Grande do Norte'),
('01612369000118','Fernando Pedroza', 'Rio Grande do Norte' ),
('08349078000128', 'Patu', 'Rio Grande do Norte'), 
('08184434000109','Macau', 'Rio Grande do Norte'),
('08113896000127','Pedra Grande', 'Rio Grande do Norte' ),
('11361904000169','Timbaúba', 'Pernambuco'),
('08294670000170','Carnaubáis', 'Rio Grande do Norte');


INSERT INTO Unidades VALUES
(1, '08132336557','CENTRALIZADOR', 'Rua Cristiano Olsen', '200', 'Jardim Sumaré'),
(2, '08132345698','CAMPO DO SETE ', 'Rua Arlindo Nogueira', '220', 'Jardim Sumaré'),
(3, '08132368957','CENTRO', 'Avenida Rio Branco', '132', 'Centro'),
(4, '08132368597', 'CRUZEIRO I', 'Rua Cristiano Olsen', '165', 'Vila da Saúde'),
(5, '08132336584','CRUZEIRO II', 'Rua Paracatu', '352', 'Centro'),
(6, '08132331554','TIMBAUBINHA', 'Avenida Esbertalina Barbosa Damiani', '14', 'Guriri Norte'),
(7, '08131256847','USF CENTRO DE SAUDE I', 'Rua Paracatu', '512', 'Centro'),
(8, '08133695874','USF CENTRO DE SAUDE II', 'Rua Barão de Vitória', '22', 'Centro'),
(9, '08125486957','USF CENTRO DE SAUDE III', 'Rua Frederico Moura', '35', 'Centro'),
(10,'08433652418','USF CENTRO DE SAUDE IV', 'Rua Paracatun', '85', 'Centro'),
(11, '08436598521','USF CENTRO DE SAUDE V', 'Rua Cristiano Olsen', '20', 'Centro'),
(12, '08432365847','FRANCISCA TAVARES RAMOS', 'Avenida Esbertalina Barbosa Damiani', '2514', 'Guriri Norte'),
(13, '08536254874','USF Centro de Saude', 'Rua Arlindo Nogueira', '29', 'Centro'),
(14, '08432365845','UBS DR. MAURICIO CORTEZ', 'Rua Carlos Augusto Cornelsen', '27', 'Bom Retiro'),
(15, '08436965874','UBS JOAO INACIO', 'Praça da República', '563', 'República'),
(16, '08412659975','UBS LOURIVAL ROCHA', 'Travessa Antônio Ferreira', '5', 'Igrejinha'),
(17, '08136585421','HOSPITAL MACAU', 'Rodovia Raposo Tavares', '847', 'Lageadinho'),
(18, '08365892547','HOSPITAL MACAU - DIRETORIA', 'Rua das Fiandeiras', '958', 'Vila Olímpia'),
(19, '08698547514','USF ENXU QUEIMADO ', 'Avenida Almirante Maximiano Fonseca', '102', 'Zona Portuária'),
(20, '08542874512','USF MIGUEL PE REIRA DE AQUINO (LUIZ SOARES BELCHIOR) ', 'Avenida Desembargador Moreira', '132', 'Aldeota'),
(21, '08326598541','USF ARENOSA', 'Avenida Afonso Pena', '45', 'Casa Grande'),
(22, '08254136585','USF CENTRO', 'Avenida Tocantins', '42', 'Centro'),
(23, '08123695847','USF ENTROCAMENTO', 'Avenida Rio Branco', '55', 'Vila Jardim Rio Claro'),
(24, '02158756558','USF PACHECO', 'Rua Carlos Augusto Cornelsen', '95', 'Bom Retiro');

INSERT INTO Funcionarios VALUES
('23517863294', default, '84984373854', default, default, '1719717600500050', default),
('23122173093', 'Maria Isabela Darmont Valladares', '81983772932', '1280', 'Praça Prefeito Ademar Nunes Vieira', '1156765275690008', default),
('93177694206', 'Flavia Antonio Vasconcelos', '81992471680', '1508', 'Travessa M', '3551573892659288', default),
('54685444906', 'Zacarias Carmanin Cordeiro', '81975272647', '1365', 'Rua Filipinas', '4177112221274733', default),
('70720951100', 'Nei Morais Quintanilha', '81979318831', '1380', 'Praça Ademar Santos Oliveira', '5041753519679868', default),
('55131215145', 'Sidney Barellos de Arruda', '81983859312', '1695', 'Rua 4', '4514167875450619', default),
('83622042222', 'Marcelle Espindola Gonçalves', '81976137655', '2150', 'Rua Guará', '2421669481800080', default),
('28546172234', 'José Wulff Boelho', '84968205971', '3265', 'Rua Antonio Pereira da Costa de Sousa', '1114511463500050', default),
('66933511820', 'Glauber Figueiro Mattos', '84984373105', '1110', 'Travessa Bárbara', '8175482037800090', default),
('46641277828', 'Lauro Passos Barrada', '84996584752', '2250', 'Rua Inacia Maria dos Santos', '1813247660100000', default),
('49375162303', 'Glauco Feitosa Rezende', '84984373854', '2957', 'Quadra G', '1719717600500050', default);

INSERT INTO Tablet VALUES
('R8AN300321E', 'T-210', 'SAMSUMG' ),
('R8AN400321O', 'T-210', 'SAMSUMG' ),
('R8AN900321I', 'T-210', 'SAMSUMG' ),
('R8AN600321J', 'T-210', 'SAMSUMG' ),
('R8AN100321Ç', 'T-210', 'SAMSUMG' ),
('R6N309071D', 'T-290', 'SAMSUMG' ), 
('R6N309071F', 'T-290', 'SAMSUMG' ), 
('R6N309071Q', 'T-290', 'SAMSUMG'), 
('R6N309071H', 'T-290', 'SAMSUMG'), 
('R6N309071C', 'T-290', 'SAMSUMG' ), 
('R6N309071P', 'T-290', 'SAMSUMG'), 
('R9XN300132O', 'T-285', 'SAMSUMG' ),
('R9XQ3000321', 'T-285', 'SAMSUMG' ), 
('R5XN3000322', 'T-285', 'SAMSUMG' ), 
('R5XN3000323', 'T-285', 'SAMSUMG'), 
('R5XB4000324', 'T-285', 'SAMSUMG' ),
('R1XI320042Y', 'T-280', 'SAMSUMG'), 
('R1XI320041Z', 'T-280', 'SAMSUMG' ), 
('R1XI333041J', 'T-280', 'SAMSUMG'), 
('R1XI321041B', 'T-280', 'SAMSUMG'), 
('R1XI600041Q', 'T-280', 'SAMSUMG' ),
('R9XZ300071C', 'T-113', 'SAMSUMG' ), 
('R9XZ301071D', 'T-113', 'SAMSUMG' ), 
('R9XZ100071G', 'T-113', 'SAMSUMG' ), 
('R9XZ600071J', 'T-113', 'SAMSUMG' ), 
('R9XZ900071S', 'T-113', 'SAMSUMG'), 
('R9XZ110071O', 'T-113', 'SAMSUMG');

insert into possui values(08184111000107, 1 ) -- tablets para ser inseridos

insert into tem values(23122173093, 'R6N309071D')

INSERT INTO Agente_Saude VALUES
('23122173093', '2003-06-29'),
('93177694206','2008-08-24' ),
('54685444906', '2002-12-12'),
('70720951100','2012-10-05' ),
('55131215145', '2019-11-03'),
('83622042222', '2022-10-11'),
('28546172234','2007-01-31'),
('66933511820', '2002-12-09'),
('46641277828', '1998-06-07'),
('49375162303', '2002-09-12');

insert into Possui values
(7,'08184111000107'), /alto/
(8,'08184111000107'), /alto/
(9,'08184111000107'), /alto/
(10,'08184111000107'), /alto/
(11,'08184111000107'), /alto/
(12,'01612369000118' ), /Fernando Pedroza',/
(13,'01612369000118' ), /Fernando Pedroza',/
(14,'08349078000128'), /Patu/
(15,'08349078000128'), /Patu/
(16,'08349078000128'), /Patu/
(17, '08184434000109'), /*Macau	*/
(18, '08184434000109'), /*Macau	*/
(19, '08113896000127' ), /Pedra Grande/
(20, '08113896000127' ), /Pedra Grande/
(1,'11361904000169'), /* Timbauba*/
(2,'11361904000169'), /* Timbauba*/
(3,'11361904000169'), /* Timbauba*/
(4,'11361904000169'), /* Timbauba*/
(5,'11361904000169'), /* Timbauba*/
(6,'11361904000169'), /* Timbauba*/
(21,'08294670000170'), /Carnaubais/
(22,'08294670000170'), /Carnaubais/
(23,'08294670000170'), /Carnaubais/
(24,'08294670000170'); /Carnaubais/

INSERT INTO tem VALUES
('R8AN300321E','23122173093'),
('R9XN300132O','93177694206'),
('R8AN400321O','54685444906' ),
('R8AN100321Ç','70720951100' ),
('R1XI320042Y','55131215145'),
('R9XZ900071S','28546172234'),
('R1XI600041Q','66933511820'),
('R9XZ600071J','49375162303');

select * from Novetech; /ok/
select * from Clientes; /ok/
select * from Contato_Cliente; /ok/
select * from Possui; /ok/
select * from Unidades; /ok/
select * from Funcionarios; /ok/
select * from Agente_Saude; /ok/
select * from Tem; /ok/
select * from Tablet; /ok/

/* ====================================================== CONSULTAS SIMPLES ======================================================*/

select * from clientes where localidade is null; 
-- Consulta onde vai identificar quais dados na tabela de Cliente tem a localidade como Nula

SELECT * FROM Funcionarios WHERE salario > '1500'; 
-- Consulta da tabela Funcionarios onde vai procurar as os funcionarios que possui o salário maior que1500

SELECT * FROM Agente_saude WHERE registro > '2008-02-02';
-- Consulta da tabela Agente_saude onde vai procurar os agentes de saúdes que foram efetivados depois da data de 2008-02-02

SELECT  * FROM Unidades ORDER BY (CAST(numero AS int)) DESC; 
-- Consulta da tabela unidades onde vai converter numero varchar em int e fazer uma consulta em ordem decrescente

-- ======================================================    JOIN     ======================================================  --
/*Consulta onde vai unir as tabelas Agente_saude e Funcionarios, com o Inner Join, onde vai apresentar as colunas do cpf do agente de saude, o nome(vem da tabela Funcionarios, visto que agente de saúde é uma especificação de Funcionários, o seu salário, a Rua em que reside e seu CNS)*/
/* Essa consulta tem como o objetivo de identificar os Funcionarios que são agentes de saúde e apresentar os seus dados, que na tabela de Agente_saude não apresanta por completo.*/

SELECT agente_saude.cpf, Funcionarios.nome, salario, rua, cns 
from agente_saude join Funcionarios on
agente_saude.cpf = Funcionarios.cpf;

-- Consultas unindo as tabelas de Unidades e Funcionarios onde apresentará o Numero de id da Unidade em que o funcionário trabalho, o nome da unidade, o nome do Funcionário e o seu respectivo CPF
-- Objetivo da consulta é identificar qual o vinculo do Funcionário a unidade

Select Unidades.id_unidade, Unidades.nome, Funcionarios.nome ,Funcionarios.cpf
 from Unidades join Funcionarios 
on unidades.id_unidade = Funcionarios.id_unidade
order by Id_unidade;

/*Consulta de Tabelas onde vai unir a tabela tablet, a Novetech e a de Clientes, tendo como colunas disponíveis o Número de série do Tablet, o seu respectivo modelo, A sua Localidade (cidade) e o CNPj da prefeitura da cidade, como seu identificador.*/
/* O objetivo dessa união de tabelas é realizar o controle de distribuição dos tablets da Empresa NOVETECH para seus clientes, visto que a empresa fornece os equipamentos.*/

SELECT Tablet.numero_de_serie, tablet.modelo, clientes.localidade, Novetech.id_cliente 
from tablet join Novetech  on 
tablet.numero_de_serie = novetech.id_tablet join 
Clientes on clientes.cnpj = novetech.id_cliente


select * from agente_saude;
select * from Funcionarios;


-- ======================================================   full outer join ======================================================  --

/*Consulta onde une as tabelas de Funcionarios, agente_saude, Tem e Tablet onde tem o objetivo de apresentar o Numero_de_série, Cpf(do profissional responsável pelo tablet) e o nome do Profissional, unindo todos os dados de ambas tabelas, das colunas selecionada para que possa identificar quais tablets estão sem "devido CONTROLE". */

SELECT tablet.numero_de_serie, Agente_saude.cpf, Funcionarios.nome from Funcionarios 
full outer join agente_saude on 
Funcionarios.cpf = agente_saude.cpf 
full outer join Tem on
agente_saude.cpf = tem.id_agente 
full outer join Tablet on 
tem.id_tablet = tablet.numero_de_serie

-- ======================================================     group by ====================================================== --
/*Consulta de salarios da tabela Funcionarios e identificar se existe algum salário repetido e contabilizar quantos são repetidos.*/
Select salario, COUNT(salario)  from Funcionarios  group by salario;
--Consulta de Modelos de tablets disponíveis na empresa, por meio de uma consulta na tabela Tablet para que assim possa ser feito uma melhor gestão dos modelos de tablets utilizados pela a NOVETECH.
Select modelo, COUNT(marca)  from tablet  group by modelo;

-- ====================================================== 1 consulta usando alguma operação de conjunto  ====================================================== 												- 

/*Consulta utilizando uma operador de conjunto, essa consulta tem como o objetivo de unir as tabelas de Funcionarios e Agente de Saude para que possa e identificar quais os CPF dos Funcionarios que são agentes de saúdes.*/

select f.cpf
from Funcionarios f
intersect
select a.cpf
from agente_saude a order by cpf


-- 	======================================================    Subqueries   ======================================================															 -- 
   	
select * from agente_saude
select * from funcionarios
select * from tablet
select * from tem

-- consultar os modelos e numero de série dos tablets que os agentes de saude tem posse

select t.numero_de_serie, t.modelo
from funcionarios f join agente_saude a
on f.cpf = a.cpf
join tem on a.cpf = tem.id_agente
join tablet t on tem.id_tablet = t.numero_de_serie	
ORDER BY modelo

delete from tem 

-- Subconsulta na qual seleciona o número de serie e o modelo dos tablets ordenadas pelo modelo.
select t.numero_de_serie, t.modelo
from tablet t
where t.numero_de_serie in (select tem.id_tablet
								from tem
								where tem.id_agente in (select a.cpf 
														from agente_saude a 
														where a.cpf in (select f.cpf
																		from funcionarios f))) ORDER BY modelo										

/* Subconsulta na qual seleciona cnpj do cliente de onde é localizada a unidade de TIMBAUBINHA, nesse caso o cnpj da prefeitura*/

select c.cnpj, c.localidade 
from clientes c 
where c.cnpj in (SELECT p.id_cliente 
				 from possui p 
				 where p.id_unidade in (select u.id_unidade
										from unidades u
										where nome LIKE 'TIMBAUBINHA'))
								
Select c.cnpj, c.localidade 
from clientes c join possui p 
on c.cnpj = p.id_cliente 
join unidades u on p.id_unidade = u.id_unidade  
where nome LIKE 'TIMBAUBINHA'

---------------------------------------------------------------------------------------------------------------------------------------------

Select * from clientes
select * from SeeFuncionarios
select * from Funcionarios

												-- VIEWS --
/*Criado uma view que apresenta apresenta os dados essencias para uma visualização do Funcionário e caso queira realizar a inserção de um profissional se torna possivel apenas com estes dados.*/

CREATE OR REPLACE VIEW SeeFuncionarios AS 
SELECT cpf, nome,  Salario, CNS, id_unidade
FROM Funcionarios;

INSERT INTO SeeFuncionarios values ('12345678911', 'Teste View', '2584','1234567899874565', 1)
INSERT INTO SeeFuncionarios values ('12345678912', 'Pedro Henrique Ribeiro', '5024','1234567899874552', 5)


/* Visão responsável para fazer uma leitura de junção de tabelas de Funcionarios, agente de saude, Tem e tablet para que possa identificar quem é agente de saude, o seu tablet responsável e os seus dados essenciais.*/

CREATE OR REPLACE VIEW ListaFuncionarios  AS
SELECT agente_saude.cpf, Funcionarios.nome, Funcionarios.salario, Funcionarios.rua, Funcionarios.cns, tem.id_tablet
from agente_saude join Funcionarios on
Agente_Saude.cpf = Funcionarios.cpf join tem on 
Agente_Saude.cpf = tem.id_agente join tablet on 
tem.id_tablet = tablet.numero_de_serie 
order by Funcionarios.nome;
				
select * from ListaFuncionarios 

/*Visão responsável para fazer uma leitura de junção de tabelas de Novetech, Clientes, Possui e unidades para identificar a quantidade e o nome das unidades para cada Localidade do cliente, seguindo de Seu CNPJ e numero de contato.*/

CREATE OR REPLACE VIEW ListaClientes AS
SELECT DISTINCT Clientes.cnpj, clientes.localidade, unidades.nome, unidades.telefone from
Novetech join CLientes on Novetech.id_cliente = clientes.cnpj join 
possui on clientes.cnpj = possui.id_cliente join 
unidades on possui.id_unidade = unidades.id_unidade 
order by localidade ;

select * from ListaClientes
			
					-- INDEXES --
SELECT * from agente_saude;				
SELECT * from unidades;					
SELECT * from clientes;					

CREATE INDEX Idx_Funcionarios ON Funcionarios( nome );
/*Foi criado o indice na tabela de Funcionários pois o campo é bastante utilizado nas consultas, sendo assim uma das colunas mais utilizada, sendo assim otimizar a sua busca nas consultas*/

CREATE INDEX Idx_Unidades ON Unidades (id_unidade);  
/*Foi criado o indice na tabela de Unidades pois o campo é bastante utilizado nas consultas, Sendo o campo responsável para identificar uma unidadae e identificar em qual unidade os funcionarios fazem parte*/

CREATE INDEX Idx_Tablets ON Tablet (numero_de_serie); 
/* Foi criado o indice na tabela de Tablet pois o campo é bastante utilizado nas consultas para genrenciar o controle de tablets disponíveis pela a empresa*/

-- REESCRITA --
-- Substituindo subqueries para o uso de join
	
SELECT c.cnpj, c.localidade, u.id_unidade, u.nome, u.rua, u.numero from Clientes c join
possui p on c.cnpj = p.id_cliente join 
unidades u on u.id_unidade = p.id_unidade 
order by c.localidade;


-- Substituindo os Intersect --
/* consulta que susbistituis o uso de Intersect utilizando o join*/
Select f.cpf from Funcionarios f join agente_Saude a 
ON f.cpf = a.cpf order by Cpf

--    Funções e procedures armazenadas 
-- Função que soma todos os salários de Funcionarios convertendo o salario VARCHAR para INT 
select sum(cast(salario as int)) from Funcionarios 

 /* Criando uma função que vai realizar varrer os valores da tabela
e inserir em novas variáveis
menor_salario, media_de_salario e maior_salario os seus valores respectivos .
Para conseguir somar os valores em VARCHAR é preciso converter a coluna Salario para int*/
CREATE OR REPLACE FUNCTION min_avg_max(OUT menor_salario integer, OUT media_de_salario integer,							  
OUT maior_salario integer)
AS
$$
BEGIN
select min(salario) from funcionarios into menor_salario;
select round(avg(cast(salario as int)),2) from funcionarios into media_de_salario;
select max(salario) from funcionarios into maior_salario;
END;
$$
LANGUAGE plpgsql;

select min_avg_max()
select * from min_avg_max()

select * from clientes

 /* Função que é responsável pela checagem do equipamento já cadastrado na tabela TABLET;
Nela declaro uma variavel , Numero_de_tablets, onde eu vou inserir os dados do numero_de_serie, depois disso
é feito a comparação e retorna uma mensagem caso não encontrado o numero de serie, caso encontre, retorna o numero de serie do tablet*/

CREATE OR REPLACE FUNCTION VerificarTablet(numero VARCHAR)															
RETURNS VARCHAR
AS $$
DECLARE Numero_de_tablets VARCHAR;
BEGIN
SELECT numero_de_serie into Numero_de_tablets from Tablet
where  numero_de_serie = numero;
IF NOT FOUND THEN
	RETURN 'Tablet não encontrado';
END IF; 
	RETURN Numero_de_tablets;
END;
$$ LANGUAGE 'plpgsql';

select VerificarTablet('252551')
select VerificarTablet('RX9TN4002174')

-- CREATE PROCEDURE DE INSERÇÃO
/* Uma função Procedure que tem o objetivo de inserir valores na tabela Tablet ao chamar a função*/
CREATE OR REPLACE PROCEDURE inserirTablet(numero_de_serie VARCHAR(20), modelo Varchar(10), marca VARCHAR(20))
AS $$
BEGIN 
INSERT INTO Tablet VALUES(numero_de_serie, modelo, marca);
END;
$$ LANGUAGE 'plpgsql';

CALL inserirTablet('RX9TN4002174', 'T-300', 'SAMSUMG');

/* CREATE TRIGGERS*/

/* Foi criada uma tabela de Backup para que possa "fiscalizar" a inserção de cada 'tablet' na tabela tablet.
Com isso, a Função criada 'ControleTablets', que vai retornar uma Trigger que depois de inserir na tabela Tablet vai fazer a inserção na tabela TabletBackup*/

create table TabletBackup as
select * from Tablet where 1= 2;


CREATE OR REPLACE FUNCTION ControleTablets()
RETURNS TRIGGER
AS $$
BEGIN
INSERT INTO tabletBackup VALUES(new.numero_de_serie, new.modelo, new.marca);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;


select * from tabletBackup;
select * from tablet;

Insert into tablet values('R89TN4051854', 'T-300', 'SAMSUMG')

CREATE or REPLACE TRIGGER insertTablets
After INSERT ON Tablet
For each row
Execute procedure ControleTablets();

-------------------------------------------------------------------------------------------------------------------------------------------------
/*Trigger com a função de ao realizar uma Atualização no Funcionário, será enviado uma notificação informando o que foi ocorrido depois de realizado.*/

CREATE OR REPLACE FUNCTION verificaoFuncionario() RETURNS
TRIGGER AS $$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		raise notice 'Operação Delete sobre %', TG_TABLE_NAME;
		RETURN OLD;
	ELSIF (TG_OP = 'UPDATE') THEN
		raise notice 'Operação Update sobre %', TG_TABLE_NAME;
		RETURN NEW;
	ELSIF (TG_OP = 'INSERT') THEN
		raise notice 'Operação Insert sobre %', TG_TABLE_NAME;
		RETURN NEW;
	END IF;
	RETURN NULL;
END;
$$ language plpgsql;

CREATE TRIGGER TestaDepto_audit
AFTER INSERT OR UPDATE OR DELETE ON Funcionarios
FOR EACH ROW EXECUTE PROCEDURE verificaoFuncionario();

----------------------------------------------------------------------------------------------------------------

/* Ao alterar o salário de um funcionário, a alteração é registrada na tabela monitoramento_salario, em que é possível
visualizar o nome do funcionário, o antigo salário e o novo salário */
CREATE TABLE monitoramento_salario(
	nome VARCHAR(45) NOT NULL,
	antigo_salario VARCHAR NOT NULL,
	novo_salario VARCHAR NOT NULL
);

CREATE OR REPLACE FUNCTION f_monitoramento_salario()
RETURNS trigger AS $$
BEGIN
	INSERT INTO monitoramento_salario (nome, antigo_salario, novo_salario)
	VALUES (old.nome, old.salario, new.salario);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER t_monitoramento_salario
AFTER UPDATE ON funcionarios FOR EACH ROW
EXECUTE PROCEDURE f_monitoramento_salario();

select * from FUNCIONARIOS
select * from monitoramento_salario

Update funcionarios
Set salario = 2000
Where cpf = '93177694206'
