$userSource= “jsanti"
$userTarget=”a.adams”
$sourceGroups = Get-ADPrincipalGroupMembership -Identity $userSource
Add-ADPrincipalGroupMembership -Identity $userTarget -MemberOf $sourceGroups