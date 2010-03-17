<result>
  {
        FOR $p IN document("census.xml")//person,
            $s IN $p/@spouse->person
        WHERE $p/person/job = "Athlete" OR $s/person/job = "Athlete"
        RETURN shallow($p)
  }
</result>
