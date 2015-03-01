xquery version "3.0";
declare namespace ead="urn:isbn:1-931666-22-9";
declare namespace xlink = "http://www.w3.org/1999/xlink";
<root>
  {
  for $ead in ead:ead
  let $doc := base-uri($ead),
  $people := $ead//ead:controlaccess//ead:persname
  return
   <document uri="{$doc}">
   <people>{$people}</people>
     {
    for $note in $ead//ead:bioghist
    where $ead//ead:bioghist//ead:p[contains(., ' she ')] 
    or $ead//ead:bioghist//ead:p[contains(., ' her ')]
    or $ead//ead:bioghist//ead:p[contains(., ' hers ')]    
    or $ead//ead:bioghist//ead:p[contains(., ' herself ')]
return
<bioghist>
{$note}
</bioghist>
    }
  </document>
}
</root>