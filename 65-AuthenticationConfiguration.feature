@Regression
Feature: Authentication Configuration


  Scenario: Verify Idle Timeout and Idle Timeout Grace Period
   Given Navigate to page "/security/authentication/account-config"
    Then Verify Authentication Configuration page is displayed
    When Update Idle Timeout
    When Click "Save " button
    Then Verify toaster message appears
      | Account Configuration saved. |
    Then Verify Alert popup is displayed
    When Click "OK" button
    Then Verify Authentication Configuration page is displayed
    When Update Idle Timeout Grace Period
    When Click "Save " button
    Then Verify toaster message appears
      | Account Configuration saved. |
    Then Verify Alert popup is displayed
    Then Login page is displayed
    Given Login to FortiSOAR
      | Username | Password     |
      | csadmin  | UserPassword |
    Given Navigate to page "/security/authentication/account-config"
    Then Verify Authentication Configuration page is displayed
    Then Update Idle Timeout to Default
    Then Update Idle Timeout Grace Period to Default
    When Click "Save " button
    Then Verify toaster message appears
      | Account Configuration saved. |

