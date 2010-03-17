<bib>
  {
        FOR $book1 IN document("www.bn.com/bib.xml")//book,
            $book2 IN document("www.bn.com/bib.xml")//book
        WHERE $book1/title/text() > $book2/title/text() 
        AND bags-are-equal($book1/author, $book2/author)
        RETURN
                <book-pair>
                        { $book1/title }
                        { $book2/title }
                </book-pair>
  }
</bib>