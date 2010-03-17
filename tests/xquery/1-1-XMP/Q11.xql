<bib>
        {
                FOR $b IN document("www.bn.com/bib.xml")//book[author]
                RETURN
                        <book>
                                { $b/title }
                                { $b/author }
                        </book>
        }
        {
                FOR $b IN document("www.bn.com/bib.xml")//book[editor]
                RETURN
                        <reference>
                                { $b/title }
                                <org>{ $b/editor/affiliation/text() }</org>
                        </reference>
        }
</bib>