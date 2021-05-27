@tags: ["documents"]
@scenario: Navigate to Handow Documentation
Given I go to {url: "Handow_Documentation"} and watch {xhr: "XHR_Doc_Getting_Start"}
Then I can see {xpath: "Doc_Container"} presenting
@parameters: [
    {
        Doc_Container: '//*[@id="handowui-root"]//div[@class="markdown-body"]'
    }
]

