<bib>
 {
  FOR $b IN document("http://www.bn.com")/bib/book
  WHERE $b/publisher = "Addison-Wesley" AND $b/@year > 1991
  RETURN
        <book year={ $b/@year }>
         { $b/title }
        </book>
 }
</bib>