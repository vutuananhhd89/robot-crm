*** Settings ***
Library	Collections
Library	RequestsLibrary

*** Test cases ***
Ticket Update - full details
    [Tags]  Create Ticket - lack type
    Create Session  CRMservice  http://develop.crmservice.s3.stuffio.com/api/ticket/1
    &{header}=   Create Dictionary   Content-Type=application/x-www-form-urlencoded
    &{params}=   Create Dictionary   user_email=update_robot_best@paymentwall.com   problem_class=missing_goods   author_type=user
    ${resp}=  Post Request  CRMservice		/   params=${params}   header=${header}
    Should Be Equal As Strings  ${resp.status_code}  200
