Feature: Running shell commands

  In order to test interactive command line applications
  As a developer using Cucumber
  I want to use the commands steps

  @wip
  Scenario: Running ruby script
  When I run the following script:
    """bash
    #!/usr/bin/env ruby

    puts "Hello"
    """
  Then output should countain exactly "Hello"

  @wip
  Scenario: Running python script
  When I run the following script:
    """bash
    #!/usr/bin/env python

    print("Hello")
    """
  Then output should countain exactly "Hello"
