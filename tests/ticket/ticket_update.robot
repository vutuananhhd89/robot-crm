*** Settings ***
Library	Collections
Library	RequestsLibrary

*** Test cases ***
Ticket Update - success
    [Tags]  Update Ticket - Success
    Create Session  CRMservice  http://develop.crmservice.s3.stuffio.com/api/ticket/1
    &{headers}=   Create Dictionary   Content-Type=application/x-www-form-urlencoded
    &{params}=   Create Dictionary   user_email=update_robot_best@paymentwall.com   problem_class=missing_goods   author_type=user
    ${resp}=  Patch Request  CRMservice		/   params=${params}   headers=${headers}
    Should Be Equal As Strings  ${resp.status_code}  200
