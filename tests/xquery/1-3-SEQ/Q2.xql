FOR $s IN document("report1.xml")//section[section.title = "Procedure"]
RETURN ($s//instrument)[1 TO 2]
