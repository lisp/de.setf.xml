<result>
  {
        FOR $b IN document("census.xml")//person[name = "Bill"],
            $c IN $b/person | $b/@spouse->person/person,
            $g IN $c/person | $c/@spouse->person/person
        RETURN shallow($g)
  }
</result>
