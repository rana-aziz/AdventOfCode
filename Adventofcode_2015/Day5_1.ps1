#Day5 - Part one
<#
It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.
#>

$Day5_Input = (Get-Content -Path ".\Day5.txt")
$Nicewords=@()
$Naughtywords=@()
Foreach ($word in $Day5_Input) {
    $CharArray = $word.toCharArray()
    #Nice word conditions
    $VowelsCount = 0 #Should be 3 or more
    $TwiceInRow = 0 #Should be greater than 0
    $ContainStrings = 0 #Should be greater than 0

    $PrevioiusChar = ""
    Foreach ($char in $CharArray) {
        if (($char -eq "a") -Or ($char -eq "e") -Or ($char -eq "i") -Or ($char -eq "o") -Or ($char -eq "u") ) {
            $VowelsCount++
        }
        if ($char -eq $PrevioiusChar) {
            $TwiceInRow ++
        } 
        if ((($PrevioiusChar -eq "a") -And ($char -eq "b" )) -Or (($PrevioiusChar -eq "c") -And ($char -eq "d" )) -Or (($PrevioiusChar -eq "p") -And ($char -eq "q" )) -Or (($PrevioiusChar -eq "x") -And ($char -eq "y" ))) {
            $ContainStrings++
        }   
        $PrevioiusChar = $char  
    }
    if(($VowelsCount -ge 3) -And  ($TwiceInRow -gt 0) -And  ($ContainStrings -eq 0) ){
        $Nicewords += $word
    }
    else{
        $Naughtywords+=$word
    }
}
Write-Host "Total number of Nice words are: $($Nicewords.count) "
#Write-Host "Nice words:"
#$Nicewords
#Write-Host "Total number of Naughty words are: $($Naughtywords.count) "
#Write-Host "Naughty words:"
#$Naughtywords

#answer 255