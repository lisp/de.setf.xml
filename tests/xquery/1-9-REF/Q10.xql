<result>
  {
        FOR $p IN document("census.xml")//person[person]
        WHERE empty($p/@spouse->person)
        RETURN shallow($p)
  }
</result>
