@tags: ["documents"]
@scenario: Navigate to Handow Documentation
Given I have removed {files: "App_Credential_File"} in {folder: "App_Credential_File_Path"} from filesystem
And I go to {url: "Handow_Documentation"} and watch {xhr: "XHR_Doc_Getting_Start"}
Then I can see {selector: "Doc_Container"} presented
@parameters: [
    {
        Doc_Container: '//*[@id="handowui-root"]//div[@class="markdown-body"]'
    }
]
