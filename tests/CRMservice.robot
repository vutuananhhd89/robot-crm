*** Settings ***
Library	Collections
Library	RequestsLibrary

*** Test cases ***
Post Request CRM
    [Tags]  Create Ticket
    Create Session  CRMservice  http://develop.crmservice.s3.stuffio.com/api/ticket
    &{params}=   Create Dictionary   user_email=robot_best@paymentwall.com     type=risk   problem_class=missing_goods   author_type=user
    ${resp}=  Post Request  CRMservice		/   params=${params}
    Should Be Equal As Strings  ${resp.status_code}  200
