-- Single-line comment
# Single-line comment

/*
    Multi-line
    comment
*/

SELECT A.foo FROM TableOne AS A 
WHERE A.bar = "baz" OR A.baz = 42

SELECT A.foo as bar, A.baz as "foo" FROM B.TableOne A

SELECT A.foo as bar, A.baz, A.bang as "foo" FROM B.TableOne A
SELECT A.foo as bar, A.bang as "foo" FROM B.TableOne A
SELECT  A.foo as f, A.baz, A.bang as "foo" FROM B.TableOne A
SELECT A.`foo` as bar, A.baz, A.bang as "foo" FROM B.TableOne A


-- Issue #7
"foo \"bar\" baz"
"foo \'bar\' baz"
'foo \"bar\" baz'
'foo \'bar\' baz'
"foo bar baz"
'foo bar baz'

"Multi-line strings
are supported"
'Multi-line strings
are supported'

SET @variable = 1;
SET @$_ = 2;
SET @"quoted-variable" = 3;
SET @'quoted-variable' = 3;
SET @`quoted-variable` = 3;

SELECT 1 && 1;
SELECT 1 OR NULL;
SELECT 5 & 2*3;
SELECT 2 BETWEEN 1 AND 3;

SELECT COUNT(*) AS cpt, MAX(t.pos) AS max_pos
FROM `my_table`
LEFT JOIN `other_table` AS t
WHERE `somecol` IS NOT NULL
ORDER BY t.other_col DESC;


-- Issue #3
if isnull(blahblah) = 1 then
else
end if

-- Issue #4
select somefield into somevariable from sometable where condition = 0;

-- Issue #5
prepare variable from 'call string(?)';
deallocate prepare variable;

-- Issue #6
execute processToExecute using variable1, variable2;

-- Issue #8
SELECT CURRENT_DATE();

-- Issue #10 "on update cascade"
create table cust_pers
	(	cust_id			int unsigned            not null
	,	pers_id			int unsigned		not null
	,	primary key		(cust_id, pers_id)
	,	foreign key		(cust_id)			references	cust(id)		on delete cascade	on update cascade
	,	foreign key		(pers_id)			references 	pers(id)		on delete cascade	on update cascade
	);	

-- Issue #11 "unique key"
create table country
	(	id				smallint unsigned	not null	primary key		auto_increment
	,	name			varchar(100)		not null	
	,	iso_2			varchar(2)			not null
	,	iso_3			varchar(3)			not null
	,	unique key		ux_ctry_iso_2		(iso_2)
	,	unique key		ux_ctry_iso_3		(iso_3)
	,	unique key		ux_ctry_name		(name)
	);

-- Issue #12 "tinyint" and "datetime"
create table pers
	(	id				int unsigned		not null	primary key 	auto_increment
	,	inactive		tinyint unsigned	default 	0
	,	first_name		varchar(100)
	,	last_name		varchar(100)
	,	created		datetime			not null	default			current_timestamp
	);	

-- Issue #13 "ALTER"
ALTER TABLE testalter_tbl DROP i;
ALTER TABLE testalter_tbl ADD i INT FIRST;
ALTER TABLE testalter_tbl DROP i;
ALTER TABLE testalter_tbl ADD i INT AFTER c;

-- Issue #14: space in column alias
select column1 as 'Column One'
from table
where column1 = 'foo';

select id,animal as 'Animal Name', expiry from creatures

-- Issue #18: TIMESTAMPDIFF and -ADD
-- Also should highlight SECOND and HOUR
SELECT
    id,
    TIMESTAMPADD(SECOND, duration, start_time) as end_time
FROM
    JobReport
WHERE
    TIMESTAMPDIFF(HOUR, creation_time, NOW()) < 24 AND
    LENGTH(timeline) > 10
ORDER BY
    id DESC
LIMIT 1000;

