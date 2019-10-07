<?php
/**
 * Issue #20 (related)
 *
 * Multi-line PHP strings stop matching on second line
*/

$sql = 'SELECT users.username as u1, users2.username as u2'
  . ' users.username as u3, users2.username as u4';


/**
 * Issue #21
 */

function test()
{
    echo "SELECT * FROM foo WHERE @bar";
    echo "Opps!";
}


/**
 * Issue #24
 */
$thing = 'SELECT as ';
$anotherThing = '';

$query = "SELECT thing as 'anotherthing'";
// ...
