@tags: ["upload", "download"]
@scenario: Deepllink to Lab and navigate to DemoFileLoading page
Given I go to url {url: "Local_Lab_Home"}
And I wait all pending requests resolved
And I click it {selector: "File_Loading_Index"}
Then I can see it {selector: "Upload_Button"} is displayed
@parameters: [{
  Local_Lab_Home: "http://www.handow.org/lab/",
  File_Loading_Index: 'demo-probe-file@h4w',
  Upload_Button: "upload-files-button@h4w"
}]

@scenario: Choose a file with path relative with test project
When I click it {selector: "Choose_File"} and choose the file paths {paths: "Uploading_File"}
Then I can see it {selector: "File_Bar"} is showing text {text: "File_Name"}
And I can see it {selector: "Upload_Button"} is enabled
@parameters: [{
  Choose_File: "#upload-fake-button",
  Uploading_File: "UploadFileDemo.txt",
  File_Bar: "uploading-file-name@h4w",
  File_Name: "UploadFileDemo.txt",
  Upload_Button: "upload-files-button@h4w"
}]

@scenario: Upload the selected file
When I click it {selector: "Upload_Button"}
Then I can see it {selector: "Message_Bar"} is showing text {text: "Upload_Success"}
@parameters: [{
    Upload_Button: "upload-files-button@h4w",
    Message_Bar: "#upload-message",
    Upload_Success: "The files have been uploaded successfully"
}]
 