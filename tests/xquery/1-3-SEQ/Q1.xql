
FOR $s IN document("report1.xml")//section[section.title = "Procedure"]
RETURN ($s//incision)[2]/instrument