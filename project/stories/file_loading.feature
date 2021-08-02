@tags: ["upload", "download"]
@scenario: Deepllink to Lab and navigate to DemoFileLoading page
Given I go to {url: "Local_Lab_Home"}
And I wait all pending requests resolved
And I click {selector: "File_Loading_Index"}
Then I can see {selector: "Upload_Button"} presented
@parameters: [{
  Local_Lab_Home: "http://www.handow.org/lab/",
  File_Loading_Index: 'demo-probe-file@h4w',
  Upload_Button: "upload-files-button@h4w"
}]

@scenario: Choose a file with path relative with test project
# When I click it {selector: "Choose_File"} and choose the files paths {paths: "Uploading_File"}
When I click {selector: "Choose_File_Probe"} and choose the files {paths: "Uploading_File"}
Then I can see {selector: "File_Bar"} showing {text: "File_Name"}
And I can see {selector: "Upload_Button"} is enabled
@parameters: [{
  Choose_File: "#upload-fake-button",
  Choose_File_Probe: "choose-files-trigger@h4w",
  Uploading_File: "./demo.txt",
  File_Bar: "uploading-file-name@h4w",
  File_Name: "demo.txt",
  Upload_Button: "upload-files-button@h4w"
}]

@scenario: Upload the selected file
When I click {selector: "Upload_Button"}
Then I can see {selector: "Message_Bar"} showing {text: "Upload_Success"}
@parameters: [{
    Upload_Button: "upload-files-button@h4w",
    Message_Bar: "#upload-message",
    Upload_Success: "The files have been uploaded successfully"
}]