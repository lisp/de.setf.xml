<result>
  {
        FOR $p IN document("census.xml")//person
        WHERE empty(children($p))
        RETURN shallow($p)
  }
</result>
