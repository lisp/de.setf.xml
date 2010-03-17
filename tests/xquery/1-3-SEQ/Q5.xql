
FOR $proc IN document("data/seq-data.xml")//section[section.title = "Procedure"]
RETURN ($proc//* AFTER ($proc//incision)[1]) BEFORE ($proc//incision)[2]
