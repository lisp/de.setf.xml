<results>
  {
        FOR $t IN document("books.xml")//chapter/title UNION document("books.xml")//section/title
        WHERE contains($t/text(), "XML")
        RETURN $t
  }
</results>