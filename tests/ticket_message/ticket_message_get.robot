*** Settings ***
Library	Collections
Library	RequestsLibrary

*** Test cases ***
Ticket message get - success
    [Tags]  Ticket message get
    Create Session  ticket-message  http://develop.crmservice.s3.stuffio.com/api/ticket-message
    &{params}=   Create Dictionary    ticket_id=1
    ${resp}=  Get Request  ticket-message		/   params=${params}
    Should Be Equal As Strings  ${resp.status_code}  200
