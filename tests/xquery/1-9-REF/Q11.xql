DEFINE FUNCTION descrip (ELEMENT $e) RETURNS ELEMENT
{
        LET $kids := $e/* UNION $e/@spouse->person/*
        LET $mstatus :=  IF ($e[@spouse]) THEN "Yes" ELSE "No"
        RETURN
                <person married={ $mstatus } nkids={ count($kids) }>{ $e/@name/text() }</person>
}

DEFINE FUNCTION descendants (ELEMENT $e)
{
        IF (empty($e/* UNION $e/@spouse->person/*))
        THEN $e
        ELSE $e UNION descendants($e/* UNION $e/@spouse->person/*)
}

descrip(descendants(//person[name = "Joe"])) SORTBY(@nkids DESCENDING, .)
