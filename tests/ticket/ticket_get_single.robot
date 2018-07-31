*** Settings ***
Library	Collections
Library	RequestsLibrary

*** Test cases ***
Ticket Get Single - Success
    [Tags]  Ticket Get Single
    Create Session  CRMservice  http://develop.crmservice.s3.stuffio.com/api/ticket/1
    &{params}=   Create Dictionary   
    ${resp}=  Get Request  CRMservice		/   params=${params}
    Should Be Equal As Strings  ${resp.status_code}  200
