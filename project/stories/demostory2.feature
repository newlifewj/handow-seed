## Test the stage dashboard

@scenario: Start enter the report page
Given I have opened url {url: "ReportURL"}
# And I have seen it {selector: "LogoTitle"} is displayed
Then I can see it {selector: "StageTitle"} is displayed
@parameters: [
    {
        StageTitle: 'summary-stages-title@h4w'
    },
    {
        StageTitle: 'wrong-stages-title@h4w'
    }
]

@scenario: Enter story detail view
When I click it {selector: "Story"}
And I have seen it {selector: "StoryDetail"} is displayed
Then I can see it {selector: "ParamsToggle"} is displayed
@parameters: [
    {
        Story: "summary-story-name@h4w",
        StoryDetail: ".cpnt-story-details",
        ParamsToggle: "params-show-hide-toggle@h4w"
    }
]
