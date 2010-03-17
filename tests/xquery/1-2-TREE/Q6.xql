DEFINE FUNCTION section_summary (ELEMENT $s) RETURNS ELEMENT
{
        <section>
                { $s/@* }
                { $s/title }
                <figcount>{ count($s/figure) }</figcount>
                {
                        FOR $ss IN $s/section
                        RETURN section_summary($ss)
                }
        </section>
}

<toc>
  {
        FOR $s IN document("book1.xmll")//section
        RETURN section_summary($s)
  }
</toc>