# xhr_cookie.feature
@tags: ["xhr","cookie"]
@scenario: Navigate to the front page of Handow Lab, verify the buttons available in view
Given I go to {url: "Handow_Lab"}
Then I can see {selector: "Lab_Version_Button"} presented
And I can see {selector: "Lab_Preset_Button"} presented
@parameters: [
    {
        Lab_Version_Button: "#button-lab-version",
        Lab_Preset_Button: "#button-add-jack"
    }
]

@scenario: Click button get lab version
When I click {selector: "Lab_Version_Button"}
And I wait {selector: "Spin"} disappeared
Then I can see {selector: "Lab_Version_Showing"} presented
@parameters: [
    {
        Spin: "#ajax-loading-spin",
        Lab_Version_Showing: "message@h4w('v0.3.2@2020-02-07 01:11:24')"
    }
]

@scenario: Click button to add Jack Smth
When I click {selector: "Lab_Preset_Button"} and watch {xhr: "Post_Reset_User_XHR"}
And I set {cookies: "Test_Cookies"} to browser context
And I wait {selector: "Spin"} disappeared
Then I can see {selector: "Lab_User_Added"} presented
And the cookie {name: "Handow_Token_Name"} with {value: "Handow_Token_Value"} available in current page
@parameters: [
    {
        Spin: "#ajax-loading-spin",
        Lab_User_Added: "message@h4w('New user (Jack Smith) has been added')",
        Handow_Token_Name: "HANDOW-TEXT-TOKEN",
        Handow_Token_Value: "A182F6B9B52BCBBD01B1702A0B0E8E61"
    }
]

# XHR and cookies parameters are defined in xhr.params.js globally
@scenario: Access the GET_VERSION API and verify the Handow version property in response
When I send request {xhr: "XHR_Get_Version"}
Then I received response with {status: "HTTP200"} HTTP status
And I received response with payload {data: "Handow_Version_Data"}
And I verify the cookies {names: "Handow_Token_Name"} existed
@parameters: [
    {
        Handow_Token_Name: "HANDOW-TEXT-TOKEN"
    }
]


@scenario: XHR add Jack Smith
When I send request {xhr: "XHR_Post_User"}
Then I received response with {status: "HTTP201"} HTTP status

@scenario: Navigate to a new view, there will be errors in this page
When I click {selector: "XHR_Cookie_Link"} and watch {xhr: "More_Doc_XHR"}
Then I verify {selector: "XHR_Cookie_View"} existed
@parameters: [
    {
        XHR_Cookie_Link: "#lab-demo-xhrcookie",
        XHR_Cookie_View: "xhr-cookie-view@h4w"
    }
]
