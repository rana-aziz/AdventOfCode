#Day5 - Part two
<#
It contains a pair of any two letters that appears at least twice in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), 
but not like aaa (aa, but it overlaps).
It contains at least one letter which repeats with exactly one letter between them, like xyx, abcdefeghi (efe), or even aaa.
#>

$Day5_Input = (Get-Content -Path ".\Day5.txt")
$Nicewords = @()
$Naughtywords = @()
Foreach ($word in $Day5_Input) {
    $CharArray = $word.toCharArray()

    #Nice word conditions
    $PairofTwo = 0 #Should be greater than 0
    $LOneL = 0 #Should be greater than 0

    For ($i = 0; $i -lt $CharArray.count; $i++) {
        For ($j = $i+2; $j -le $CharArray.count-2; $j++) {
            if (($CharArray[$i] -eq $CharArray[$j]) -And ($CharArray[$i+1] -eq $CharArray[$j+1]) ){
                $PairofTwo++
            }
        }
        if ($CharArray[$i] -eq $CharArray[$i+2]){
            $LOneL++
        }
    }
    
    if(($PairofTwo -gt 0) -And  ($LOneL -gt 0) ){
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


                <#Write-Host "Pair of Two: $PairofTwo"
                Write-Host ("First i= {0}  and i+1= {1} " -f $CharArray[$i], $CharArray[$i+1])
                Write-Host ("Second j= {0}  and j+1= {1} " -f $CharArray[$j], $CharArray[$j+1])
                #>
            <#Write-Host "LOneL"
            Write-Host ("First i= {0} " -f $CharArray[$i])
            Write-Host ("Second i+2= {0} " -f $CharArray[$i+2])
            #>


#answer 55