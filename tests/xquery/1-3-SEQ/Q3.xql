
LET $i2 := (document("report1.xml")//incision)[2]
FOR $a IN (document("report1.xml")//action AFTER $i2)[1 TO 2]
RETURN $a//instrument