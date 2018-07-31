*** Settings ***
Library	Collections
Library	RequestsLibrary

*** Test cases ***
Ticket Get List - success
    [Tags]  Ticket Get List
    Create Session  CRMservice  http://develop.crmservice.s3.stuffio.com/api/ticket
    &{params}=   Create Dictionary   per_page=20    problem_class=missing_goods
    ${resp}=  Get Request  CRMservice		/   params=${params}
    Should Be Equal As Strings  ${resp.status_code}  200
