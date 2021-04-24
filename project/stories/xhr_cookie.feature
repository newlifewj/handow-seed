# xhr_cookie.feature
@tags: ["xhr","cookie"]
@scenario: Navigate to the front page of Handow Lab, verify the buttons available in view
Given I go to {url: "Handow_Lab"}
Then I can see {selector: "Lab_Version_Button"} is displayed
And I can see {selector: "Lab_Preset_Button"} is displayed
@parameters: [
    {
        Lab_Version_Button: "#button-lab-version",
        Lab_Preset_Button: "#button-add-jack"
    }
]

@scenario: Click button get lab version
When I click {selector: "Lab_Version_Button"}
And I wait {selector: "Spin"} is disappeared
Then I can see {xpath: "Lab_Version_Showing"} is displayed
@parameters: [
    {
        Spin: "#ajax-loading-spin",
        Lab_Version_Showing: "message@h4w('v0.3.2@2020-02-07 01:11:24')"
    }
]

@scenario: Click button to add Jack Smth
When I click {selector: "Lab_Preset_Button"}
And I set {cookies: "Test_Cookies"}  to current page
And I wait {selector: "Spin"} is disappeared
Then I can see {xpath: "Lab_User_Added"} is displayed
And the cookie {name: "HANDOW_TOKEN"} with {value: "TOKEN_VALUE"} available in current page
@parameters: [
    {
        Spin: "#ajax-loading-spin",
        Lab_User_Added: "message@h4w('New user (Jack Smith) has been added')",
        HANDOW_TOKEN: "HANDOW-TEXT-TOKEN",
        TOKEN_VALUE: "A182F6B9B52BCBBD01B1702A0B0E8E61"
    }
]

# XHR and cookies parameters are defined in xhr.params.js globally
@scenario: Access the GET_VERSION API and verify the Handow version property in response
When I send request {xhr: "XHR_Get_Version"}
Then I received response with {status: "HTTP200"} HTTP status
And I received response with payload {data: "Handow_Version_Data"}
And I verify the cookies {cookies: "HANDOW_TOKEN"} exist

@scenario: XHR add Jack Smith
When I send request {xhr: "XHR_Post_User"}
Then I received response with {status: "HTTP201"} HTTP status

@scenario: Navigate to a new view, there will be errors in this page
When I click {selector: "XHR_Cookie_Link"}
Then I verify {xpath: "XHR_Cookie_View"} exist
@parameters: [
    {
        XHR_Cookie_Link: "#lab-demo-xhrcookie",
        XHR_Cookie_View: "xhr-cookie-view@h4w"
    }
]
