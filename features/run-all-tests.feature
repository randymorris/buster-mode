Feature: Run all tests

  Scenario: Opens a buffer with test results
    When I turn on buster-mode
    And I press "C-c C-b ra"
    And I switch to buffer "*buster-test*"
    Then I should see "0 timeouts"

  Scenario: Converts ANSI escape sequences to Emacs faces
    When I turn on buster-mode
    And I press "C-c C-b ra"
    And I switch to buffer "*buster-test*"
    Then I should not see "[1m"
    And I should not see "[1D"

  Scenario: Clears the buffer before running
    When I switch to buffer "*buster-test*"
    And I insert "some dummy text"
    And I switch to buffer "*testing-buffer*"
    And I turn on buster-mode
    And I press "C-c C-b ra"
    And I switch to buffer "*buster-test*"
    Then I should not see "some dummy text"
