@tags: ["duplicated"]
@scenario: Navigate to Handow Homepage
Given I go to {url: "Handow_Homepage"}
And I wait all pending requests resolved
Then I can see {selector: "Handow_Lab_Link"} presented
@parameters: [
    {
        Handow_Lab_Link: "#handow-lab"
    }
]

@scenario: Navigate to Handow Lab index page
When I click {selector: "Handow_Lab_Link"}
And I wait {seconds: "A_Moment"}
Then I can see {selector: "Form_Demo_Link"} showing {text: "Form_Demo_Label"}
And I can see {selector: "XHR_Cookie_Demo_Link"} showing {text: "XHR_Cookie_Demo_Label"}
And I can see {selector: "Table_Demo_Link"} showing {text: "Table_Demo_Label"}
And I can see {selector: "Probe_Trace_Demo_Link"} showing {text: "Probe_Trace_Demo_Label"}
@parameters: [
    {
        A_Moment: 1,
        Form_Demo_Link: "#lab-demo-form",
        Form_Demo_Label: "Form Demo",
        Table_Demo_Link: "#lab-demo-table",
        Table_Demo_Label: `Table Demo`,
        XHR_Cookie_Demo_Link: "#lab-demo-xhrcookie",
        XHR_Cookie_Demo_Label: "XHR & Cookies Demo",
        Probe_Trace_Demo_Link: "#lab-demo-ref",
        Probe_Trace_Demo_Label: "Probe and trace HTML"
    }
]