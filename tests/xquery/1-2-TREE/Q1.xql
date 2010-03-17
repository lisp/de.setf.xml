<toc>
  {
        LET $b := document("book1.xml")
        RETURN
                filter($b//section | $b//section/title | $b//section/title/text())
  }
</toc>