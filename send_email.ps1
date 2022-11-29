# Get Credential
$credential = Get-Credential
$mailsender = 'ngarcia@example.com'
$user = 'ngarcia@example.com'
$days = 3
$subject = 'Your password is about to expire.'
$body = @"
This message was automatically generated. 
The password for $user will expire in $days days.
Your new password must be at least 8 characters and contain:
- Uppercase
- Lowercase
- Digits
- Special Characters

Please contact the helpdesk if you need assistance changing your password.
DO NOT REPLY TO THIS EMAIL.
"@

# Define Params
$mailParams = @{
  SmtpServer                 = 'smtp.office365.com'
  Port                       = '587'
  UseSSL                     = $true
  Credential                 = $credential
  From                       = $mailsender
  To                         = $user
  Subject                    = $subject
  Body                       = $body
  DeliveryNotificationOption = 'OnFailure', 'OnSuccess'
}

# Send message
Send-MailMessage @mailParams