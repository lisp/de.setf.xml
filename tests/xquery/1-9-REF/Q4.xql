<result>
  {
        FOR $p IN document("census.xml")//person,
            $c IN $p/person
        WHERE $p/job = $c/job OR $p/@spouse->person/job = $c/job
        RETURN shallow($c)
  }
</result>
