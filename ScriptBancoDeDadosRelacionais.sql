


create table profissional_saude(
	id int primary key,
	matricula int ,
	nome varchar(100),
	departamento varchar(50),
	cargo varchar(50), 
	telefone varchar(11)
);

create table paciente(
	id int primary key,
	nome varchar(100),
	telefone varchar(11),
	data_nascimento varchar(10)
	
);

create table internacao_paciente(
	internacao_paciente serial primary key,
	id_paciente int,
	nome_paciente varchar(100) ,
	data_hora_entrada varchar(15),
	data_hora_saida varchar(15),
	diagnostico varchar(300),
	medico int,
	constraint fk_id_paciente
	foreign key(id_paciente)
	references paciente(id),
	constraint fk_nome_medico
	foreign key(medico)
	references profissional_saude(id)	
	
);

insert into profissional_saude
values
(1,1000, 'Marcos','Pediatria', 'Pediatria','19999-9999'),
(2,1024, 'Gloria','Cardiopneumologia', 'Geral','175099-888'),
(3,1547, 'Frederico','Médico', 'Geral','193599-7777'),
(4,1258, 'Sandra','Ortopedia e Traumatologia', 'Geral','199899-6666'),
(5,1245, 'Marcio','Ortopedia e Traumatologia', 'Ortopedista','199479-2222'),
(6,7895, 'Ana','Cirurgia', 'Geral','19899-1111'),
(7,1025, 'Richard','Dermatologia', 'Ambulatório Geral e Didático, Alergia','199589-0000');


insert into paciente
values
(1,'Neilton', '197845-6585','25/07/1995'),
(2,'Marcelo', '194745-6585','07/08/1980'),
(3,'Miguel', '197845-6585','30/12/2008'),
(4,'Elaine', '193645-6585','05/05/1960'),
(5,'Simone', '487845-6585','07/07/1998'),
(6,'Rian', '189045-6585','16/11/2010'),
(7,'Claudione', '191807-6585','17/2/2003'),
(8,'Rodrigo', '356284-6585','24/01/1910');

insert into internacao_paciente
(id_paciente, nome_paciente,	
 data_hora_entrada, data_hora_saida, diagnostico, medico)
values
(1,'Neilton','20/04/21 14:30','20/04/21 16:30','Sinusite atacada',3),
(1,'Neilton','20/04/21 16:50','20/04/21 20:30','Sinusite atacada, com febre e virose, desidatração',3),
(2,'Marcelo','21/04/21 14:30','21/04/21 16:14','Dores no peito, começo de infarte ',2),
(3,'Miguel','23/04/21 14:50','23/04/21 15:15','alergia atacada',7),
(4,'Elaine','27/04/21 15:30','27/04/21 16:20','Braço com luxação',5),
(6,'Rian','14/05/21 15:40','14/04/21 17:10','Colica renal',1),
(7,'Claudione','16/05/21 18:40','16/04/21 20:59','Enxaqueca',7),
(8,'Rodrigo','28/05/21 12:30','28/04/21 16:43','Curativo corte pos faca',6),
(3,'Miguel','01/06/21 04:30','01/04/21 04:50','Fratura no pé', 4);

/*
select * from profissional_saude,
select * from paciente,
select * from internacao_paciente;
*/

/*contagem do numero de internações de cada paciente */
select nome_paciente,
count(nome_paciente) as quantidade_internacao
from internacao_paciente
group by nome_paciente
order by quantidade_internacao desc;


/*Contagem do numero de medicos por departamento*/
select departamento,
count(departamento) as quantidade_por_departamento
from profissional_saude 
group by departamento
order by quantidade_por_departamento desc;





