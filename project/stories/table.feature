# Table.feature
@tags: ["Table"]
@scenario: Start from deeplink Handow Lab page
Given I have opened {url: "Handow_Lab"}
And I wait all pending requests resolved
Then I can see {selector: "Table_Demo_Link"} is showing {text: "Table_Demo_Label"}
# Then I can see it {xpath: "Table_Demo_Probe"} is showing text {text: "Table_Demo_Label"}
@parameters: [
    {
        Table_Demo_Link: "#lab-demo-table",
        Table_Demo_Label: "Table Demo",
        Handow_Lab_Local: "http://localhost:3200/lab",
        Table_Demo_Probe: "demo-probe-1@h4w"
    }
]

@scenario: Navigate to Table and varify users amount and specific username
When I click {selector: "Table_Demo_Link"}
And I wait {seconds: "A_Moment"}
Then I can see {selector: "User_Table"} is displayed
And I can see {number: "User_Quantity"} items of {xpath: "All_Users"} exist
And I can see {xpath: "Mark_Galeet"} is displayed
@parameters: [
    {
        A_Moment: 1,
        User_Table: "#demo-table",
        All_Users: "username@h4w",
        User_Quantity: 7,
        Mark_Galeet: "username@h4w('Mark Galeet')"
    }
]

@scenario: Sort by level field
When I click {selector: "Table_Head_Level"}
Then I can see {xpath: "Level_Items"} sorted by {order: "ASC_Order"}
@parameters: [
    {
        Table_Head_Level: "#table-head-level",
        Level_Items: "level@h4w",
        ASC_Order: "asc"
    }
]

@scenario: Sort by username field
When I click {selector: "Table_Head_Username"}
Then I can see {xpath: "Username_Items"} sorted by {order: "ASC_Order"}
And I can see {selector: "Level_Items"} sorted by {order: "Descending"}
@parameters: [
    {
        Table_Head_Username: "#table-head-username",
        Username_Items: "username@h4w",
        Level_Properties: ".user-class[h4w=level]",
        ASC_Order: "asc",
        Descending: "descending"
    }
]