<results>
  {
        FOR $b IN document("http://www.bn.com")/bib/book,
            $t IN $b/title,
            $a IN $b/author
        RETURN
                <result>
                        { $t }  
                        { $a }
                </result>
  }
</results>