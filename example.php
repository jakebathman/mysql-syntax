<?php
/**
 * Issue #20
*/  

// Broken example
$sql = 'SELECT users.username as u1, users2.username as u2'
  .' users.username as u3, users2.username as u4';

// echo "sql:$sql\n"; // DEBUG INFO
echo "hello world";
echo "hello world";

// Working example
$sql = 'SELECT users.username as u1, users2.username as u2'
  .' users.username as u3, users2.username as u4';

// echo "sql:$sql\n"; // DEBUG INFO
echo "hello world";
echo "hello world";

// broken example
$test = "SELECT count(*) FROM (SELECT * FROM table) AS subquery";
print($b);