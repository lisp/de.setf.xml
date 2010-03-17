<result>
  {
        FOR $s IN document("census.xml")//person[name = "Dave"]/@spouse->person,
            $sp IN $s/.. | $s/../@spouse->person
        RETURN
                shallow($sp)
  }
</result>
