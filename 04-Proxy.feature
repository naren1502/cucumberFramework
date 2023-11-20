@Regression
Feature: Proxy

  @Sanity @PreConfigured
  Scenario: Set Proxy Configuration
    When Navigate to page "/system/system-configuration/proxy-config"
    Then Verify proxy details are correctly populated
    When Navigate to proxy server page
    Then Verify FSR calls are going through proxy
    When Navigate to FortiSOAR application
    Then User Profile button is displayed

  @Sanity @PreConfigured
  Scenario: Remove Proxy Configuration
    Given Navigate to page "/system/system-configuration/proxy-config"
    And Disable proxy settings
    Then Save proxy settings and verify toaster message
      | Environment variables saved successfully. |
