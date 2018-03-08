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
