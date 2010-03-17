<section_list>
  {
        FOR $s IN document("book1.xml")//section
        LET $f := $s/figure
        RETURN
                <section title={ $s/title/text() } figcount={ count($f) }/>
  }
</section_list>