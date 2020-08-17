#Day1 - Part one

$Day1 = (Get-Content -Path ".\Day1.txt").toCharArray()
$counter=0
foreach ($char in $Day1)
{
    if ($char -eq "("){$counter++}
    elseif ($char -eq ")"){$counter--}
    else {Write-Host "I don't know this char $char"}
}
Write-Host $counter

