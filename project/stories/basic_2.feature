
@scenario: Navigate to Handow Homepage
Given I go to url {url: "Handow_Homepage"}
And I wait all pending requests resolved
Then I can see it {selector: "Handow_Lab_Link"} is displayed
@parameters: [
    {
        Handow_Lab_Link: "#handow-lab"
    }
]

@scenario: Navigate to Handow Lab index page
When I click it {selector: "Handow_Lab_Link"}
And I wait time {seconds: "A_Moment"} seconds
Then I can see it {selector: "Form_Demo_Link"} is showing text {text: "Form_Demo_Label"}
And I can see it {selector: "XHR_Cookie_Demo_Link"} is showing text {text: "XHR_Cookie_Demo_Label"}
And I can see it {selector: "Table_Demo_Link"} is showing text {text: "Table_Demo_Label"}
And I can see it {selector: "Probe_Trace_Demo_Link"} is showing text {text: "Probe_Trace_Demo_Label"}
@parameters: [
    {
        A_Moment: 1,
        Form_Demo_Link: "#lab-demo-0",
        Form_Demo_Label: "Form Demo",
        Table_Demo_Link: "#lab-demo-1",
        Table_Demo_Label: "Table Demo",
        XHR_Cookie_Demo_Link: "#lab-demo-2",
        XHR_Cookie_Demo_Label: "XHR & Cookies Demo",
        Probe_Trace_Demo_Link: "#lab-demo-3",
        Probe_Trace_Demo_Label: "Probe and trace HTML"
    }
]