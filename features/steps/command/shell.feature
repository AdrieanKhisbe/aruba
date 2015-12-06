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
    Then output should contain exactly "Hello"

     Scenario: Running python script
     When I run the following script:
        \"\"\"bash
        #!/usr/bin/env python

      print("Hello")
      \"\"\"
     Then output should contain exactly "Hello"
    """
    When I run `cucumber`
    Then the features should all pass

  Scenario: Running shell commands
    Given a file named "features/run.feature" with:
     """
     Scenario: Running shell commands
      When I run the following commands:
      \"\"\"bash
         echo "Hello shell
      \"\"\"
      Then the output should contain exactly "Hello shell"

    Scenario: Running bash commands
      When I run the following bash commands:
        \"\"\"bash
       echo -n "Hello "
       echo `echo bash` # subshell
        \"\"\"
      Then the output should contain exactly "Hello bash"

    Scenario: Running zsh commands
      When I run the following zsh commands:
        \"\"\"bash
       echo -n "Hello "
       echo $((2 + 2))
        \"\"\"
      Then the output should contain exactly "Hello 4"
      
      Scenario: Running fish commands
        When I run the following fish commands:
        \"\"\"bash
        echo -n "Hello "
        echo (echo fish)
        \"\"\"
        Then the output should contain exactly "Hello fish"
    """
    When I run `cucumber`
    Then the features should all pass