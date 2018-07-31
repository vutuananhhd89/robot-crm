*** Settings ***
Library	Collections
Library	RequestsLibrary

*** Test cases ***
Ticket message create - success
    [Tags]  Ticket message create
    Create Session  ticket-message  http://develop.crmservice.s3.stuffio.com/api/ticket-message
    &{params}=   Create Dictionary    ticket_id=1   message="robot handsome"
    ${resp}=  Post Request  ticket-message		/   params=${params}
    Should Be Equal As Strings  ${resp.status_code}  200
