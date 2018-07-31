*** Settings ***
Library	Collections
Library	RequestsLibrary

*** Test cases ***
Ticket Attachment Create - Success
    [Tags]  Ticket Attachment Create
    Create Session  ticket-attachment  http://develop.crmservice.s3.stuffio.com/api/ticket-attachment
    &{params}=   Create Dictionary   message_id=1   file=C:\Projects\CRM_service\report.html
    ${resp}=  Post Request  ticket-attachment		/   params=${params}
    Should Be Equal As Strings  ${resp.status_code}  200
