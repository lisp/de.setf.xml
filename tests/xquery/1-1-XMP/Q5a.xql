<books-with-prices>
  {
        FOR $b IN document("www.bn.com/bib.xml")//book
        RETURN
                <book-with-prices>
                        <price-bn>{ $b/price/text() }</price-bn>
                </book-with-prices>
  }
</books-with-prices>