from behave import given, when, then

@given('I have entered first value as {number1:d} and second value as {number2:d} into the calculator')
def step_impl(context, number1,number2):
    context.number1 = number1
    context.number2 = number2

@when('I press add')
def step_impl(context):
    context.result = context.number1 + context.number2

@then('the result should be {expected_result:d} on the screen')
def step_impl(context, expected_result):
    assert expected_result == context.result
