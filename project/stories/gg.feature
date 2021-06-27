@tags: ["google"]
@scenario: Navigate to Google Search
Given I have opened {url: "Google_Search"}
And I wait all pending requests resolved
And I download the content of current page as {file: "GG_Search_Html"} 
Then I can see {selector: "An_Image"} presented
@parameters: [
    {
        Google_Search: 'https://www.google.ca/',
        GG_Search_Html: 'temp/ggSearch.html',
        An_Image: '//img'
    }
]
@scenario: Navigate to Google Translate
Given I have opened {url: "Google_Translate"}
And I wait all pending requests resolved
Then I can see {selector: "Translate_Box"} presented
@parameters: [
    {
        Google_Translate: 'https://translate.google.ca/?sl=en&tl=zh-CN&text=synonym&op=translate&hl=en',
        Translate_Box: '//textarea'
    }
]


