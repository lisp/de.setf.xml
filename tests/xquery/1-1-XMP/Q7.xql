<bib>
  {
        FOR $b IN document("http://www.bn.com/bib.xml")//book[publisher = "Addison-Wesley" AND @year > "1991"]
        RETURN
                <book>
                        { $b/@year }
                        { $b/title }
                </book>
        SORTBY (title)
  }
</bib>