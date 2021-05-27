@tags: ["dialog"]
@scenario: Deepllink to Lab and navigate to Dialog view
Given I go to {url: "Local_Lab_Home"}
And I wait all pending requests resolved
And I click {selector: "Dialog_Entry"}
Then I can see {selector: "Prompt_Trigger"} presenting
@parameters: [{
  Local_Lab_Home: "http://www.handow.org/lab/",
  Dialog_Entry: 'demo-probe-dialog@h4w',
  Prompt_Trigger: "prompt-trigger@h4w"
}]

@scenario: Navigate to Handow Lab index page
When I handle the prompt by providing {text: "My_Name"}
Then I can see {selector: "Name_Field"} is showing {text: "My_Name"}
@parameters: [{
  My_Name: "Severus Snape",
  Name_Field: "#provided-name"
}]
