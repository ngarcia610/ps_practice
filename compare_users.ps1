# requires -module ActiveDirectory -Version 3
Import-Module ActiveDirectory

function Compare-UserObjectProperties{
    Param(
        $identity1,
        $identity2
    )

    Begin{
        $userclass=[adsi]"LDAP://schema/user"
        $allproperties=$userclass.mandatoryproperties
        $allproperties+=$userclass.optionalproperties
    }
    Process{
        Try{
            $user1=Get-Aduser $identity1 -Properties * -ea Stop
            $user2=Get-Aduser $identity2 -Properties * -ea Stop
            foreach($p in $allproperties){
               [pscustomobject]@{
                       PropertyName=$p
                       User1=$user1.psobject.Properties[$p].Value
                       User2=$user2.psobject.Properties[$p].Value
                }
            }
        }
        Catch{Throw $_}
    }
}

# Compare-UserObjectProperties User1 User2 | Out-GridView
Compare-UserObjectProperties syi svc-nprintingserver | Out-GridView