@Regression
Feature: Log Forwarding


  Scenario: Syslog Forwarding Configuration
    When Navigate to page "/system/system-configuration/log-forwarding"
    Then Verify Visible text
      | Text Type | Text to Search        | Tag   |
      | Page Text | Enable Log Forwarding | label |
    When Select Enable Log Forwarding checkbox
    Then Verify Visible text
      | Text Type       | Text to Search     | Tag   |
      | Parameter label | Configuration Name | label |
    When Enter "AutoSyslogServer" in field "Configuration Name"
    And Enter "10.132.254.149" in field "Server"
    And Verify Protocol dropdown value is "UDP"
    And Enter "514" in field "Port"
    When Scroll to text "Choose Log Types To Forward"
    When Select Audit Logs checkbox
    Then Verify Visible text
      | Text Type       | Text to Search                 | Tag   |
      | Parameter label | Specify Audit log detail level | label |
    And Verify Audit Log Detail Level dropdown value is "Basic"
    When Click "Save" button
    Then Verify toaster message appears
      | Log forwarding configuration updated successfully |


  Scenario: Syslog forwarding verification
    Given Verify execution of below scenarios is successful
      | Syslog Forwarding Configuration |
    Given Store the number of log lines with text
      | LogForwardIndicator | 0 |
	#Create Indicator record and verify logs on the log server
    When Navigate to page "/modules/indicators"
    Then Verify User Navigated to Indicators
    When Click Add record button
    Then Verify Visible text
      | Text Type   | Text to Search | Tag  |
      | Page header | Indicators     | span |
    Then Enter "LogForwardIndicator" in field "Value"

    When Click " Save" button
    Then Verify toaster message appears
      | You have created "LogForwardIndicator". |
    Then Close Record Detail View
	
	#Capture the audit log records from syslog server
    When Store the number of log lines with text
      | LogForwardIndicator | 1 |
    Then Verify audit log record is forwarded on the syslog server
    Then Print the audit log record from syslog server with text "LogForwardIndicator"

