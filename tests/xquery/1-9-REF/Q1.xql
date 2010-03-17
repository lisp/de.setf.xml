
<result>
  {
        FOR $m IN document("census.xml")//person[name = "Martha"]
        RETURN shallow($m/@spouse->person)
  }
</result>
