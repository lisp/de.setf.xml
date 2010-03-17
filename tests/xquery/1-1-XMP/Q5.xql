<books-with-prices>
  {
        FOR $b IN document("www.bn.com/bib.xml")//book,
            $a IN document("www.amazon.com/reviews.xml")//entry
        WHERE $b/title = $a/title
        RETURN
                <book-with-prices>
                        { $b/title }
                        <price-amazon>{ $a/price/text() }</price-amazon>
                        <price-bn>{ $b/price/text() }</price-bn>
                </book-with-prices>
  }
</books-with-prices>