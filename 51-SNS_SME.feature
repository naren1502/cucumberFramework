#Author: snikam@fortinet.com
Feature: SNS_SME

  @SNS
  Scenario: Verify Default SME
    When Click Setting Button
    Then Verify Secure Message Exchange Menu is displayed
    When Click Secure Message Exchange Menu
    Then Verify Secure Message Exchange Page is displayed
    Then Verify default Secure Message Exchange is enabled
    Then Verify default Secure Message Exchange is configured

  @OnHold
  Scenario: Add External SME
    Given Verify Secure Message Exchange Page is displayed
    When Click Add Secure Message Exchange
    Then Verify Add Secure Message Exchange form is Opened
    When Add Secure Message Exchange Details
    When Click Create
    Then Verify external Secure Message Exchange is added
    Then Verify external Secure Message Exchange is configured

