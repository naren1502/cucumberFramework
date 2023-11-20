@Regression
Feature: Notification Channel

  Scenario: Verify create new notification channel
    #Navigate to Notifications page
    When Navigate to page "/system/notification/delivery-rules"
    #Then Verify Notification page is opened
    Then Verify Visible text
      | Text Type   | Text to Search | Tag |
      | Page header | Notifications  | h1  |
    When Click tab "Notification Channels"
    When Click Add notification button
    Then Verify "Start" tab is highlighted
    Then Verify "Channel Details" tab is not highlighted
    Then Verify "Integration" tab is not highlighted
    Then Verify "Test Run" tab is not highlighted
    Then Verify "Review Details" tab is not highlighted
    And Click "Build a Channel" button
    Then Verify "Channel Details" tab is highlighted
    Then Verify "Integration" tab is not highlighted
    Then Verify "Test Run" tab is not highlighted
    Then Verify "Review Details" tab is not highlighted
    When Enter notification channel name as "Automation Notification Channel"
    When Click Continue button
    Then Verify "Integration" tab is highlighted
    Then Verify "Test Run" tab is not highlighted
    Then Verify "Review Details" tab is not highlighted
    When Select configured connector "SMTP"
    And Scroll to text "Choose Action"
    When Select action "Send Email"
    When Enter "To Recipients:" field details as "user1To@auto.com"
    When Enter "Cc Recipients:" field details as "user1Cc@auto.com"
    When Enter "Bcc Recipients:" field details as "user1BCC@auto.com"
    When Enter "Subject:" field details as "This is notification channel of FortiSOAR"
    When From integrations page click Continue button
    Then Verify "Test Run" tab is highlighted
    Then Verify "Review Details" tab is not highlighted
    When From test run page click continue button
    Then Verify "Review Details" tab is highlighted
    Then Verify configuration "Channel Name" value is "Automation Notification Channel"
    Then Verify configuration "Channel Description" value is ""
    Then Verify configuration "Connector Name" value is "SMTP"
    #Then Verify configuration "Connector Version" value is "2.4.3"
    Then Verify configuration "Connector Action" value is "Send Email"
    And Click "Save" button
    Then Verify toaster message appears
      | Channel created successfully |
    Then Verify notification grid row "Automation Notification Channel" is present
    #Then Verify grid row "Automation Notification Channel" column "Type" have value "Connector"
    Then Verify notification channel "Automation Notification Channel" status is active


  Scenario: Verify Edit of notification channel
    Given Verify execution of below scenarios is successful
      | Verify create new notification channel |
    Given Open "Automation Notification Channel" channel for edit
    Then Verify Visible text
      | Text Type   | Text to Search                                 | Tag |
      | Page header | Update Automation Notification Channel Channel | h3  |
    Then Verify "Channel Details" tab is highlighted
    When Enter notification channel description "Updating channel description through automation"
    When Click Continue button

    Then Verify "Choose suitable configured connector" dropdown value is "SMTP"
    Then Verify "Choose Connector Configuration" dropdown value is "localhost-postfix"
    Then Verify "Integration" tab is highlighted
    When From integrations page click Continue button
    Then Verify "Test Run" tab is highlighted
    When From test run page click continue button
    Then Verify "Review Details" tab is highlighted
    Then Verify configuration "Channel Name" value is "Automation Notification Channel"
    Then Verify configuration "Channel Description" value is "Updating channel description through automation"
    Then Verify configuration "Connector Name" value is "SMTP"
    Then Verify configuration "Connector Action" value is "Send Email"
    And Click "Save" button
    Then Verify toaster message appears
      | Channel updated successfully |
    #Then Verify grid row "Automation Notification Channel" column "Type" have value "Connector"
    #Then Verify grid row "Automation Notification Channel" column "Description" have value "Updating channel description through automation"
    Then Verify notification channel "Automation Notification Channel" status is active


  Scenario: Verify InApp Notification channel is not editable
    Given Verify execution of below scenarios is successful
      | Verify create new notification channel |
    Given Navigate to page "/system/notification/channels"
    Given Open "In-App Notifications" channel for edit
    Then Verify toaster message appears
      | This channel is not editable. |


  Scenario: Verify Email Notification channel is editable
    Given Verify execution of below scenarios is successful
      | Verify create new notification channel |
    Given Navigate to page "/system/notification/channels"
    Given Open "Email Notification" channel for edit
    #This will verify that channel is opened for edit
    Then Verify Visible text
      | Text Type   | Text to Search                    | Tag |
      | Page header | Update Email Notification Channel | h3  |


  Scenario: Create custom delivery rule
    Given Verify execution of below scenarios is successful
      | Verify create new notification channel |
    Given Navigate to page "/system/notification/delivery-rules"
    When Click Add Delivery Rule button
    Then Verify Visible text
      | Text Type   | Text to Search           | Tag |
      | Page header | Create New Delivery Rule | h3  |
    Then Verify "Rule Details" tab is highlighted
    Then Verify "Select Channel" tab is not highlighted
    When Enter delivery rule name as "Automation delivery rule"
    When Select entity type "Alert"
    When Select rule trigger action "Created"
    When Click Add condition link
    When Select Type field
    When select operator "Equals"
    When Select type "Phishing"
    When Click Continue button
    Then Verify "Select Channel" tab is highlighted
    When Select notification channel "In-App Notifications"
    When Click add channel button

    When Add the notification content
    When Select notification channel "Automation Notification Channel"
    When Click add channel button
    When From select channel page click continue button
    Then Verify "Rule Details" tab is highlighted
    Then Verify configuration "Rule Name" value is "Automation delivery rule"
    Then Verify configuration "Module Selected" value is "Alerts"
    Then Verify configuration "Operation" value is "Created"
    Then Verify configuration "Configured Channels" value is "In-App Notifications - Enabled"
    Then Verify configuration "Configured Channels" also have value "Automation Notification Channel - Enabled"
    When Click Create custom rule button
    Then Verify toaster message appears
      | Rule created successfully |
    Then Verify notification grid row "Automation delivery rule" is present
    Then Verify for rule "Automation delivery rule" notification channel "In-App Notifications" is enabled
    Then Verify for rule "Automation delivery rule" notification channel "Automation Notification Channel" is enabled
    Then Verify for rule "Automation delivery rule" notification channel "Email Notification" is not enabled
    Then Verify grid row "Automation delivery rule" column "Status" have value "Active"


  Scenario: Create new record and verify notification is received
    Given Verify execution of below scenarios is successful
      | Create custom delivery rule |
    When Navigate to page "/modules/alerts"
    Then Alert Grid is displayed
    When Click on Add Alert
    Then Alert creation form is displayed
    And Add record details
      | Name                                           | Type          |
      | AlertCreatedForNotificationDeliveryRuleTesting | type,Phishing |
    And Click "Save" button
    Then Verify toaster message appears
      | You have created "AlertCreatedForNotificationDeliveryRuleTesting". |
    Then Close Record Detail View
    And Reload the webpage
    When Click Notification bell icon

    Then Verify the notification is received for notification channel

  Scenario: Verify the notification failure grid logs
    Given Reload the webpage
    When Navigate to page "/system/notification/delivery-rules"
    When Click tab "Failure Notification Logs"
    Then Verify the grid have "Entity Name" column
    Then Verify the grid have "Event" column
    Then Verify the grid have "Notification Type" column
    Then Verify the grid have "Modified On" column
    Then Verify the grid have "Error Message" column
    Then Verify notification grid row "alerts" is present
    Then Verify grid row "alerts" column "Event" have value "create"
    Then Verify grid row "alerts" column "Notification Type" have value "connector"
    Then Verify grid row "alerts" column "Error Message" have value "CS-INTEGRATION-5: Error occurred while executing the connector action ERROR :: Required params (To, Subject, Body) missing"
