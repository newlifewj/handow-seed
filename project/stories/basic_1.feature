@tags: ["basic"]
@scenario: Navigate to Handow Homepage
Given I go to url {url: "Handow_Homepage"}
Then I can see it {selector: "Handow_Lab_Link"} is displayed
# And I verify it {selector: "Home_Page_Image"} exist
And I verify it {xpath: "Homepage_Image"} exist
And I do not see it {selector: "Updated_Time"} is displayed
@parameters: [
    {
        Handow_Lab_Link: "#handow-lab",
        Home_Page_Image: "#home-image",
        Homepage_Image: "homepage-image@h4w",
        Updated_Time: "updated-time@h4w"
    }
]

@scenario: Navigate to Handow Lab index page
When I click it {selector: "Handow_Lab_Link"}
Then I can see it {selector: "Form_Demo"} is displayed
# And I can see it {selector: "Index_Title"} is showing text {text: "Title_Text"}
And I can see it {xpath: "Lab_Title"} is showing text {text: "Title_Text"}
And I verify it {selector: "Index_Title"} contains html {html: "HTML_Snippet"}
@parameters: [
    {
        Form_Demo: "#lab-demo-form",
        Index_Title: "#lab-index-title",
        Lab_Title: "lab-title@h4w",
        Title_Text: "Lab Inde",
        HTML_Snippet: "<i>Lab Index</i>"
    }
]