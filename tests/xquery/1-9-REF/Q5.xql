<result>
        {
                FOR $p IN document("census.xml")//person,
                    $c IN $p/person[job = $p/job]
                RETURN
                        <match parent={ $p/name } child={ $c/name } job={ $c/job } />
        }
        {
                FOR $p IN document("census.xml")//person,
                    $c IN $p/@spouse->person/person[job = $p/job]
                RETURN
                        <match parent={ $p/name } child={ $c/name } job={ $c/job } />
        }
</result>
