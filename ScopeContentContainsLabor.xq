xquery version "3.0";
declare namespace ead="urn:isbn:1-931666-22-9";
declare namespace xlink = "http://www.w3.org/1999/xlink";
<root>
  {
  for $ead in ead:ead
  let $doc := base-uri($ead)
  return
   <document uri="{$doc}">
     {
    for $note in $ead//ead:scopecontent[//ead:p[contains(., 'labor')]]
return
<note>
{$note}
</note>
    }
  </document>
}
</root>