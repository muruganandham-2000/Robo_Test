from robot.libraries.BuiltIn import BuiltIn

def my_function():
    # Call a Robot Framework keyword
    result = BuiltIn().run_keyword('Log', 'Hello, world!')
    print(result)


my_function()