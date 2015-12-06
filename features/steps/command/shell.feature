Feature: Running shell commands

  In order to test interactive command line applications
  As a developer using Cucumber
  I want to use the commands steps

  Scenario: Running script
    Given a file named "features/run.feature" with:
    """
     Scenario: Running ruby script
     When I run the following script:
        \"\"\"bash
        #!/usr/bin/env ruby

      puts "Hello"
      \"\"\"
    Then output should countain exactly "Hello"

     Scenario: Running python script
     When I run the following script:
        \"\"\"bash
        #!/usr/bin/env python

      print("Hello")
      \"\"\"
     Then output should countain exactly "Hello"
    """
    When I run `cucumber`
    Then the features should all pass

  Scenario: Running shell commands
    Given a file named "features/run.feature" with:
     """
     Scenario: Running shell commands
      When I run the following commands:
      \"\"\"bash
         echo -n "Hello "
         echo $0
      \"\"\"
      Then the output should countain exactly "Hello bash"

    Scenario: Running bash commands
      When I run the following bash commands:
        \"\"\"bash
       echo -n "Hello "
       echo $0
        \"\"\"
      Then the output should countain exactly "Hello bash"

    Scenario: Running zsh commands
      When I run the following zsh commands:
        \"\"\"bash
       echo -n "Hello "
       echo $0
        \"\"\"
      Then the output should countain exactly "Hello zsh"
   """
    When I run `cucumber`
    Then the features should all pass