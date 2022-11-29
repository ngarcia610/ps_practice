$DomainControllerList = Get-ADDomainController -Filter * | Select-Object -Expand Name
$DomainControllerList | ForEach-Object {
    $Outer = $_
    $DomainControllerList | ForEach-Object {
        $Inner = $_
        if ($Outer -ne $Inner) {
            $Result = dfsrdiag backlog /RGName:'Domain System Volume' /RFName:'SYSVOL share' /SendingMember:$Outer /ReceivingMember:$Inner | Select-String Count
            "$Outer->$Inner $Result"
        }
    }
}