<result>
  {
        FOR $b IN document("census.xml")//person,
            $c IN $b/person | $b/@spouse->person/person,
            $g IN $c/person | $c/@spouse->person/person
        RETURN
                <grandparent name={ $b/name } grandchild={ $g/name }/>
  }
</result>
