FOR $b IN document("http://www.bn.com/bib.xml")//book,
    $e IN $b/*[contains(string(.), "Suciu")]
WHERE ends_with(name($e), "or")
RETURN
        <book>
                { $b/title }
                { $e }
        </book>