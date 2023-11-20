Feature: SNS - Agent Configuration

@SNS
Scenario: SNS - Adding Agent
When Click Setting Button
Then Verify Agents link is displayed
When Click Agent Link
Then Verify Agents page is displayed
When Click Add Button
Then Add New Agent is displayed
When Enter Agent Details
Then Verify Create button enabled
When Click on Create button
Then Verify Agent is created
Then Verify Agent is Enabled
Then Verify Status is Awaiting Remote Node Connection
Then Verify Agent Action has Download Installer

@SNS
Scenario: SNS - Deploying Agent
Given Verify Agent Action has Download Installer
When Click Download Installer
Then Verify Download Installer Window Opens
Then Verify Default Value for Connector Selection DropDown
Then Verify Download Installer Button is Present
When Click Download Installer Button
When Move Downloaded file to Results
When Run Command to Install Installer file
Then Verify Status has changed to Remote Node Connected
When Navigate to page "/content-hub/my-content/?contentType=connector"
Then Verify "Manage" tab is active
When Search Utility Connector
Then Verify Utility Connector gets searched
When Click Utility Connector
Then Verify Utility Connector detailed Page is displayed
Then Verify Agent Tab is dispalyed
When Click on Agent Tab
Then Verify Install Connector On New Agent button displayed
Then Verify Connector status is Installed Active
Then Verify Deactivate Connector Button is displayed
Then Verify Delete Button is displayed
