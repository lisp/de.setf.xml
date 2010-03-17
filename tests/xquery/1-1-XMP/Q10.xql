<results>
  {
        LET $doc := document("prices.xml")
        FOR $t IN distinct($doc/book/title)
        LET $p := $doc/book[title = $t]/price
        RETURN
          <minprice title={ $t/text() }>
                 { 
                   min($p) 
                 }
          </minprice>
  }
</results>