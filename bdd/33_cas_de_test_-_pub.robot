*** Settings ***
Documentation    cas de test - pub
Metadata         ID                           33
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
cas de test - pub
    [Documentation]    cas de test - pub

    Given I am me
    When I go to work
    Then I smile


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_33_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_33_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =       Get Variable Value    ${TEST_SETUP}
    ${TEST_33_SETUP_VALUE} =    Get Variable Value    ${TEST_33_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_33_SETUP_VALUE is not None
        Run Keyword    ${TEST_33_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_33_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_33_TEARDOWN}.

    ${TEST_33_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_33_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =       Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_33_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_33_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
