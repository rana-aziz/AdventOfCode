#Day1 - Part two

$Day1 = (Get-Content -Path ".\Day1.txt").toCharArray()
$counter=0
$Position=0
foreach ($char in $Day1)
{
    $Position++
    if ($char -eq "("){$counter++}
    elseif ($char -eq ")"){$counter--}
    else {Write-Host "I don't know this char $char"}

    if($counter -eq "-1")
    {Write-Host "The position of the character that causes Santa to first enter the basement is $Position"
    break
    }
}


