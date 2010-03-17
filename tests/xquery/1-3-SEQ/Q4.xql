

FOR $proc IN document("data/seq-data.xml")//section[section.title = "Procedure"]
WHERE SOME $i IN $proc//incision SATISFIES empty($proc//anesthesia BEFORE $i)
RETURN $proc
