*** Settings ***
Library	Collections
Library	RequestsLibrary
Library  OperatingSystem

*** Test cases ***
Ticket Attachment Create - Success
    [Tags]  Ticket Attachment Create
    Create Session  ticket-attachment  http://develop.crmservice.s3.stuffio.com/api/ticket-attachment
    ${file_data}=    Get File    foobar.txt
    &{files}=    Create Dictionary    file=${file_data}
    &{params}=   Create Dictionary   message_id=99    file_name=file_from_handsome_robot
    ${resp}=  Post Request  ticket-attachment		/   params=${params}   files=${files}
    Should Be Equal As Strings  ${resp.status_code}  200
