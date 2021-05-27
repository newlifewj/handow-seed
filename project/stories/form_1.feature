@scenario: Deeplink the form view
Given I go to {url: "Handow_Form"}
Then I can see {selector: "Form_View"} presenting
And I can see {selector: "Submit_Button"} presenting
# And I can see it {selector: "Username"} with value{value: "Username_Value"}
@parameters: [
    {
        Form_View: "#demo-form-container",
        Submit_Button: "#form-submit",
        Handow_Form_Local: "http://localhost:3200/lab/demoform",
        Secured: false
    },
    {
        Form_View: "#demo-form-container",
        Submit_Button: "#form-submit",
        Handow_Form_Local: "http://localhost:3200/lab/demoform",
        Secured: true
    }
]

@scenario: Test Username validation, the username field must be 3-12 assic characters and not a number
When I enter {value: "Username_Value"} to {selector: "Username_Input"}
Then I can see {selector: "Validate_Error"} presenting  @skip: (this.Secured)
@parameters: [
    {
        Username_Value: "Ja",
        Username_Input: "#form-input-username",
        Validate_Error: "#username-validation"
    },
    {
        Username_Value: "Jack 12345 Smith",
        Username_Input: "#form-input-username",
        Validate_Error: "#username-validation"
    },
    {
        Username_Value: "123456",
        Username_Input: "#form-input-username",
        Validate_Error: "#username-validation"
    },
    {
        Username_Value: "Jack Smith",
        Username_Input: "#form-input-username",
        Validate_Error: "#username-validation"
    }
]

@scenario: Choose secured
@skip: (!this.Secured)
When I click {selector: "Secured_Checkbox"}
Then I can see {selector: "Submit_Button"} is disabled
@parameters: [
    {
        Secured_Checkbox: "#form-checkbox-secured"
    }
]

@scenario: Fill form with valid Username and Email when no-secured
When I enter {value: "Username_Value"} to {selector: "Username_Input"}
And I enter {value: "Email_Value"} to {selector: "Email_Input"}
Then I can see {selector: "Submit_Button"} is enabled @skip: (this.Secured)
Then I can see {selector: "Submit_Button"} is disabled @skip: (!this.Secured)
@parameters: [
    {
        Username_Value: "Mark Davis",
        Username_Input: "#form-input-username",
        Email_Value: "mark.davis@gmail.com",
        Email_Input: "#form-input-email"
    }
]

@scenario: Select level no matter secured or no-secured
When I select {option: "Level_Option1"} of {selector: "Level_Select"}
Then I can see {selector: "Submit_Button"} is enabled
# Then I can see it {xpath: "Submit_Button_Path"} is enabled
@parameters: [
    {
        Level_Select: "#form-select-level",
        Submit_Button_Path: "form-submit-button@h4w",
        Level_Option1: "1"
    }
]

@scenario: Submit for and verify message
When I click {selector: "Submit_Button"}
And I wait {selector: "Spin"} is disappeared
Then I can see {selector: "Feedback_Message"} is showing {text: "Success_No_Secured"} @skip: (this.Secured)
Then I can see {selector: "Feedback_Message"} is showing {text: "Success_Secured"} @skip: (!this.Secured)
@parameters: [
    {
        Spin: "#ajax-loading-spin",
        Feedback_Message: "#form-feedback",
        Success_No_Secured: "Submit successfully",
        Success_Secured: "Submit secured form successfully"
    }
]

