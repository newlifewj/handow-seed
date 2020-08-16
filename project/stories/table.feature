# Table.feature
@tags: ["Table"]
@scenario: Start from deeplink Handow Lab page
Given I have opened url {url: "Handow_Lab"}
And I wait all pending requests resolved
Then I can see it {selector: "Table_Demo_Link"} is showing text {text: "Table_Demo_Label"}
# Then I can see it {xpath: "Table_Demo_Probe"} is showing text {text: "Table_Demo_Label"}
@parameters: [
    {
        Table_Demo_Link: "#lab-demo-table",
        Table_Demo_Label: "Table Demo",
        Table_Demo_Probe: "demo-probe-1@h4w"
    }
]

@scenario: Navigate to Table and varify users amount and specific username
When I click it {selector: "Table_Demo_Link"}
And I wait time {seconds: "A_Moment"} seconds
Then I can see it {selector: "User_Table"} is displayed
And I can see them {xpath: "All_Users"} amount number {number: "User_Quantity"}
And I can see it {xpath: "Mark_Galeet"} is displayed
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
When I click it {selector: "Table_Head_Level"}
Then I can see them {xpath: "Level_Items"} sorted by order {order: "ASC_Order"}
@parameters: [
    {
        Table_Head_Level: "#table-head-level",
        Level_Items: "level@h4w",
        ASC_Order: "asc"
    }
]

@scenario: Sort by username field
When I click it {selector: "Table_Head_Username"}
Then I can see them {xpath: "Username_Items"} sorted by order {order: "ASC_Order"}
@parameters: [
    {
        Table_Head_Username: "#table-head-username",
        Username_Items: "username@h4w",
        ASC_Order: "asc"
    }
]