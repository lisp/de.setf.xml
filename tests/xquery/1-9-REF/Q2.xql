DEFINE FUNCTION children (ELEMENT $p) 
{
        shallow($p/person) UNION shallow($p/@spouse->person/person)
}

<result>
  {
        FOR $j IN document("census.xml")//person[name = "Joe"]
        RETURN children($j)
  }
</result>
