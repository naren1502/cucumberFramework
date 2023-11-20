Feature: OnHoldScenarios

 #Navigation scenarios marked as OnHold as few modules are removed in default installation
 # and will be published along with respective solution packs

 @OnHold
 Scenario: Navigate to Emails
  Given Incident Response is displayed
  When Emails is displayed
  Then Click Emails
  Then Verify User Navigated to Emails

 @OnHold
 Scenario: Navigate to MITRE
  Given Incident Response is displayed
  When MITRE is displayed
  Then Click MITRE
  Then Verify User Navigated to MITRE

 @OnHold
 Scenario: Navigate to Vulnerabilities
  Given Vulnerability Management is displayed
  When Click Vulnerability Management
  When Click Vulnerabilities
  Then Verify User Navigated to Vulnerabilities

 @OnHold
 Scenario: Navigate to Scans
  Given Vulnerability Management is displayed
  When Scans is displayed
  Then Click Scans
  Then Verify User Navigated to Scans

 @OnHold
 Scenario: Navigate to Rule Engine
  Given Automation is displayed
  When Rule Engine is displayed
  Then Click Rule Engine
  Then Verify User Navigated to Rule Engine

  # @Sanity
 Scenario: Navigate to Help
  Given Help is displayed
  When Click Help
  Then Verify User Navigated to Help

 Scenario: Verify featured and preview solution packs
  Given Navigate to page "/content-hub/all-content/?contentType=solutionpack"
  Then Verify preview solution pack list
   | Nozomi Networks Central Management Console |
   | OT - Asset Management                      |
   | OT - Vulnerability Management              |
  Then Verify featured solution pack list
   | Nozomi Networks Central Management Console |
   | OT - Asset Management                      |
   | OT - Vulnerability Management              |
   | Phishing Email Response                    |
   | Threat Intel Management                    |




