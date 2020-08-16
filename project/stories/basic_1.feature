@tags: ["basic"]
@scenario: Navigate to Handow Homepage
Given I go to url {url: "Handow_Homepage"}
Then I can see it {selector: "Handow_Lab_Link"} is displayed
@parameters: [
    {
        Handow_Homepage: "http://www.handow.org",
        Handow_Lab_Link: "#handow-lab"
    }
]

@scenario: Navigate to Handow Lab index page
When I click it {selector: "Handow_Lab_Link"}
Then I can see it {selector: "Form_Demo"} is displayed
@parameters: [
    {
        Form_Demo: "#lab-demo-form"
    }
]