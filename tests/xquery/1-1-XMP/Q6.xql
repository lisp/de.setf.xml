<bib>
  {
        FOR $b IN document("http://www.bn.com/bib.xml")//book
        WHERE count($b/author) > 0
        RETURN
                <book>
                        { $b/title }
                        {
                                FOR $a IN $b/author[1 TO 2]
                                RETURN $a
                        }
                        {
                                IF (count($b/author) > 2)
                                THEN <et-al/>
                                ELSE ()
                        }
                </book>
  }
</bib>