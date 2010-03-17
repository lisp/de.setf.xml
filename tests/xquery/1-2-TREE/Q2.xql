<figlist>
  {
        FOR $f IN document("book1.xml")//figure
        RETURN
                <figure>
                        { $f/@* }
                        { $f/title }
                </figure>
  }
</figlist>