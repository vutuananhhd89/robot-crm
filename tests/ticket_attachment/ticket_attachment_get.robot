*** Settings ***
Library	Collections
Library	RequestsLibrary

*** Test cases ***
Ticket Attachment Get - Success with message_id
    [Tags]  Ticket Attachment Get
    Create Session  ticket-attachment  http://develop.crmservice.s3.stuffio.com/api/ticket-attachment
    &{params}=   Create Dictionary    message_id=1
    ${resp}=  Get Request  ticket-attachment		/   params=${params}
    Should Be Equal As Strings  ${resp.status_code}  200

Ticket Attachment Get - Success with ticket_id
    [Tags]  Ticket Attachment Get
    Create Session  ticket-attachment  http://develop.crmservice.s3.stuffio.com/api/ticket-attachment
    &{params}=   Create Dictionary    ticket_id=1
    ${resp}=  Get Request  ticket-attachment		/   params=${params}
    Should Be Equal As Strings  ${resp.status_code}  200
