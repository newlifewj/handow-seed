@tags: ["local", "misc"]
@scenario: Go to Handow.org homepage
Given I go to url {url: "Handow_Home"}
And I wait all pending requests resolved
Then I can see it {selector: "Handow_Lab_Link"} is displayed
@parameters: [{
  Handow_Home: "http://www.handow.org/",
  Handow_Lab_Link: "#handow-lab"
}]

@scenario: Open new tab to show the Handow repository on GitHub
When I click it {selector: "GitHub_Link"}
Then I can see the new window url {url: "Handow_On_GitHub"} is opened
@parameters: [{
  GitHub_Link: "github-link@h4w",
  Handow_On_GitHub: "https://github.com/newlifewj/handow"
}]

@scenario: Open new window to display the SHM Live Demo
When I click it {selector: "SHM_Demo_Entry"}
Then I can see the new window url {url: "SHM_Live_Demo"} is opened
@parameters: [{
  SHM_Demo_Entry: "shm-demo@h4w",
  SHM_Live_Demo: "http://demo.shm.handow.org/reports"
}]

@scenario: Navigate to Handow Lab index page
When I click it {selector: "Handow_Lab_Link"}
Then I can see it {selector: "Form_Demo"} is displayed
@parameters: [{
    Form_Demo: "#lab-demo-form"
}]

@scenario: Browser backward to homepage
When I navigate browser to move backward
Then I see the address is url {url: "Handow_Home"}