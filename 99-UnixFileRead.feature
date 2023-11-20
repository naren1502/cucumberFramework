Feature: Unix File Read

Scenario: Read Unix File
When Read Unix Log File
|FileName|NumberOfLines|
|workflow-uwsgi|15|

When Read Unix Log File
|FileName|SearchPattern|
|workflow-uwsgi|Emperor|

