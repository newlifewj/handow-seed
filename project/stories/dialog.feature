@tags: ["dialog"]
@scenario: Deepllink to Lab and navigate to Dialog view
Given I go to url {url: "Local_Lab_Home"}
And I wait all pending requests resolved
And I click it {selector: "Dialog_Entry"}
Then I can see it {selector: "Prompt_Trigger"} is displayed
@parameters: [{
  Local_Lab_Home: "http://localhost:3200/lab/",
  Dialog_Entry: "demo-probe-dialog@h4w",
  Prompt_Trigger: "prompt-trigger@h4w"
}]

@scenario: Navigate to Handow Lab index page
When I handle the prompt by provide name {name: "My_Name"}
Then I can see it {selector: "Name_Field"} is showing text {text: "My_Name"}
@parameters: [{
  My_Name: "Severus Snape",
  Name_Field: "#provided-name"
}]
