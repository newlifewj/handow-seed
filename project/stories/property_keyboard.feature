@tags: ["property", "keyboard"]
@scenario: Deepllink to Lab and navigate to Proverty and Keyboard test view
Given I go to {url: "Handow_Lab"}
And I wait all pending requests resolved
And I click {selector: "Props_Keyboard_Entry"}
Then I can see {selector: "Demo_Textarea"} presented
@parameters: [{
  Handow_Lab_Local: "http://localhost:3200/lab/",
  Props_Keyboard_Entry: 'demo-probe-propskeys@h4w',
  Demo_Textarea: "#demo-input-textarea",
  Demo_Textarea_Path: "demo-textarea@h4w"
}]

@scenario: Fill the textarea input box
When I enter {value: "Example_Text"} to {selector: "Demo_Textarea"}
And I focus on {selector: "Demo_Textarea"}
And I press keyboard {key: "Enter_Key"}
Then I can see {selector: "Success_Message"} presented
And I cannot see {selector: "Workspace_Clean"}
# This step will fail because we set a bug in UI trim() the input
And I can see the input {selector: "Demo_Textarea"} value equals {text: "Box_Content"}
@parameters: [{
  Example_Text: "demo text",
  Enter_Key: "Enter",
  Success_Message: "submit-review@h4w",
  Workspace_Clean: "workspace-status@h4w",
  Box_Content: "demo text"
}]

@scenario: Verify DOM properties and active styles
When I move mouse hover on {selector: "Github_Link"}
Then I verify the active style {name: "Opacity_Style"} of {selector: "Github_Link"} is {value: "Opacity_Value"}
And I verify the active style {name: "Color"} of {selector: "Demo_Textarea"} is {value: "Forestgreen"}
And I verify the active style {name: "Font_Size"} of {selector: "Demo_Textarea"} is {value: "Size_18px"}
And I verify the property {name: "Name"} of {selector: "Demo_Textarea_Probe"} equals {value: "Textarea_Name"}
@parameters: [{
  Name: "name",
  Opacity_Style: "opacity",
  Github_Link: "github-link@h4w",
  Opacity_Value: "0.6",
  Textarea_Name: "textarea-demo",
  Demo_Textarea_Probe: "demo-textarea@h4w",
  Color: "color",
  Forestgreen: "rgb(34, 139, 34)",
  Font_Size: "font-size",
  Size_18px: "18px"
}]

@scenario: Clear textarea and message by keyboard shotcut
When I press keyboard shotcuts {keys: "Shotcut_Clear"}
Then I cannot see {selector: "Success_Message"}
And I can see {selector: "Workspace_Clean"} presented
And I can see the input {selector: "Demo_Textarea"} value equals {text: "Box_Content"}
# And I can see the input element {xpath: "Demo_Textarea_Path"} value is text {text: "Box_Content"}
@parameters: [{
  Shotcut_Clear: "ShiftLeft ControlLeft C",
  Success_Message: "submit-review@h4w",
  Workspace_Clean: "workspace-status@h4w",
  Box_Content: ""
}]


