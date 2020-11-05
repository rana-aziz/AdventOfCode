#Day5 - Part two

$stopwatch=[system.diagnostics.stopwatch]::StartNew()

$puzzle="ugkcyxxp"

function GetHash{
    param(
        [int]$integer 
    )
do{
     $someString = $puzzle + $integer
     $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
     $utf8 = New-Object -TypeName System.Text.UTF8Encoding
     $hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($someString)))
     $integer++
}until ($hash.StartsWith("00-00-0"))
 if($hash -match '00-00-0(.)\-(.).*'){
 $position = $Matches.1
 $cahr=$Matches.2
 }
return $integer,$position, $cahr

}

$nextInteger=0
$PasswordHashtable = @{}

do{
$nextInteger,$position, $cahr = Gethash -integer $nextInteger
    if($position -match '[0-7]'){
        if(-not ($PasswordHashtable.ContainsKey($position))){
        $PasswordHashtable.Add($position, $cahr)
        }
    }
}until ($PasswordHashtable.Count -eq 8)

$PasswordHashtable.GetEnumerator() | sort Name

$stopwatch.Stop()
$stopwatch.Elapsed


 #answer F2C730E5
