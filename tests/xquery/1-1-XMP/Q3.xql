<results>
  {
        FOR $b IN document("http://www.bn.com")/bib/book
        RETURN
                <result>
                        { $b/title }
                        {
                                FOR $a IN $b/author
                                RETURN $a
                        }
                </result>
  }
</results>