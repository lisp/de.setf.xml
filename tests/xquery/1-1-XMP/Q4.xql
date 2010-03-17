
<results>
  {
        FOR $a IN distinct(document("http://www.bn.com")//author)
        RETURN
                <result>
                        { $a }
                        {
                                FOR $b IN document("http://www.bn.com")/bib/book[author = $a]
                                RETURN $b/title
                        }
                </result>
  }
</results>