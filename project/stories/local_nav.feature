@tags: ["local", "misc"]
@scenario: Go to Handow.org homepage
Given I go to {url: "Handow_Home"}
And I wait all pending requests resolved
Then I can see {selector: "Handow_Lab_Link"} presenting
@parameters: [{
  Handow_Home: "http://www.handow.org/",
  Handow_Lab_Link: "#handow-lab"
}]

@scenario: Open new tab to show the Handow repository on GitHub
When I click {selector: "GitHub_Link"}
Then I can see the new window {url: "Handow_On_GitHub"} is opened
@parameters: [{
  GitHub_Link: "github-link@h4w",
  Handow_On_GitHub: "https://github.com/newlifewj/handow"
}]

@scenario: Open new window to display the SHM Live Demo
When I click {selector: "SHM_Demo_Entry"}
Then I can see the new window {url: "SHM_Live_Demo"} is opened
@parameters: [{
  SHM_Demo_Entry: "shm-demo@h4w",
  SHM_Live_Demo: "http://demo.shm.handow.org/reports"
}]

@scenario: Navigate to Handow Lab index page
When I click {selector: "Handow_Lab_Link"}
Then I can see {selector: "Form_Demo"} presenting
@parameters: [{
    Form_Demo: "#lab-demo-form"
}]

@scenario: Browser backward to homepage
When I navigate browser to move backward
Then I see the address is {url: "Handow_Home"}