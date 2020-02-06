@scenario: Deeplink the form view
Given I go to url {url: "Handow_Form"}
Then I can see it {selector: "Form_View"} is displayed
And I can see it {selector: "Submit_Button"} is disabled
# And I can see it {selector: "Username"} with value{value: "Username_Value"}
@parameters: [
    {
        Form_View: "#demo-form-container",
        Submit_Button: "#form-submit",
        Loop_Ctrl: 1
    },
    {
        Form_View: "#demo-form-container",
        Submit_Button: "#form-submit",
        Loop_Ctrl: 2
    }
]

@scenario: Test Username validation
When I enter value {value: "Username_Value"} to input {input: "Username_Input"}
Then I can see it {selector: "Validate_Error"} is displayed
@parameters: [
    {
        Username_Value: "Ja",
        Username_Input: "#form-input-username",
        Validate_Error: "#username-validation"
    },
    {
        Username_Value: "Jack 12345 Smith",
        Username_Input: "#form-input-username",
        Validate_Error: "#username-validation",
    },
    {
        Username_Value: "123456",
        Username_Input: "#form-input-username",
        Validate_Error: "#username-validation"
    }
]


@scenario: Choose secured
@skip: (1==this.Loop_Ctrl)
When I click it {selector: "Secured_Checkbox"}
Then I can see it {selector: "Submit_Button"} is disabled
@parameters: [
    {
        Secured_Checkbox: "#form-checkbox-secured"
    }
]

@scenario: Fill form with valid Username and Email when no-secured
When I enter value {value: "Username_Value"} to input {input: "Username_Input"}
And I enter value {value: "Email_Value"} to input {input: "Email_Input"}
Then I can see it {selector: "Submit_Button"} is enabled @skip: (2==this.Loop_Ctrl)
Then I can see it {selector: "Submit_Button"} is disabled @skip: (1==this.Loop_Ctrl)
@parameters: [
    {
        Username_Value: "Mark Davis",
        Username_Input: "#form-input-username",
        Email_Value: "mark.davis@gmail.com",
        Email_Input: "#form-input-email"
    }
]

@scenario: Select level no matter secured or no-secured
When I click it {selector: "Level_Select"}
And I click it {selector: "Select_Level_1"}
Then I can see it {selector: "Submit_Button"} is enabled
@parameters: [
    {
        Level_Select: "#form-select-level",
        Select_Level_1: "#form-select-level-1"
    }
]

@scenario: Submit for and verify message
When I click it {selector: "Submit_Button"}
And I wait it {selector: "Spin"} is disappeared
Then I can see it {selector: "Feedback_Message"} is showing text {text: "Success_No_Secured"} @skip: (2==this.Loop_Ctrl)
Then I can see it {selector: "Feedback_Message"} is showing text {text: "Success_Secured"} @skip: (1==this.Loop_Ctrl)
@parameters: [
    {
        Spin: "#ajax-loading-spin",
        Feedback_Message: "#form-feedback",
        Success_No_Secured: "Submit successfully",
        Success_Secured: "Submit secured form successfully"
    }
]

