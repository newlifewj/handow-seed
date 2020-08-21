@tags: ["property", "keyboard"]
@scenario: Deepllink to Lab and navigate to Proverty and Keyboard test view
Given I go to url {url: "Local_Lab_Home"}
And I wait all pending requests resolved
And I click it {selector: "Props_Keyboard_Entry"}
Then I can see it {selector: "Demo_Textarea"} is displayed
@parameters: [{
  Local_Lab_Home: "http://www.handow.org/lab/",
  Props_Keyboard_Entry: 'demo-probe-propskeys@h4w',
  Demo_Textarea: "#demo-input-textarea"
}]

@scenario: Fill the textarea input box
When I enter value {value: "Example_Text"} to input {selector: "Demo_Textarea"}
And I focus on it {selector: "Demo_Textarea"}
And I press keyboard key {key: "Enter_Key"}
Then I can see it {selector: "Success_Message"} is displayed
And I can see it {selector: "Workspace_Clean"} is disappeared
# This step will fail because we set a bug in UI trim() the input
And I can see the input element {selector: "Demo_Textarea"} value is text {text: "Box_Content"}
@parameters: [{
  Example_Text: "demo text",
  Enter_Key: "Enter",
  Success_Message: "submit-review@h4w",
  Workspace_Clean: "workspace-status@h4w",
  Box_Content: "demo text"
}]

@scenario: Verify DOM properties and active styles
When I continue testing
Then I verify the property name {name: "Name"} of it {selector: "Demo_Textarea"} is value {value: "Textarea_Name"}
And I verify the active style name {name: "Color"} of it {selector: "Demo_Textarea"} is value {value: "Forestgreen"}
And I verify the active style name {name: "Font_Size"} of it {selector: "Demo_Textarea"} is value {value: "Size_18px"}
@parameters: [{
  Name: "name",
  Textarea_Name: "textarea-demo",
  Color: "color",
  Forestgreen: "rgb(34, 139, 34)",
  Font_Size: "fontSize",
  Size_18px: "18px"
}]

@scenario: Clear textarea and message by keyboard shotcut
When I press keyboard shotcuts keys {keys: "Shotcut_Clear"}
Then I can see it {selector: "Success_Message"} is disappeared
And I can see it {selector: "Workspace_Clean"} is displayed
And I can see the input element {selector: "Demo_Textarea"} value is text {text: "Box_Content"}
@parameters: [{
  Shotcut_Clear: "ShiftLeft ControlLeft C",
  Success_Message: "submit-review@h4w",
  Workspace_Clean: "workspace-status@h4w",
  Box_Content: ""
}]

