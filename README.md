![Ruby Version 2.5 or above](https://img.shields.io/badge/ruby-%3E%3D%202.5-red.svg)

Explanation: In Reverse Polish Notation (RPN) the operators follow their operands; for instance, to add three and four one would write `3 4 +` rather then `3 + 4`.  If there are multiple orperations, the operator is given immediately after its second operand; so the expression written `3 - 4 + 5` in conventional infix notation would be written `3 4 - 5 +` in RPN: first subtract 4 from 3, then add 5 to that.

Example: The infix expression `5 + ((1 + 2) * 4) - 3` can be written down like this in RPN: 5 1 2 + 4 * + 3 -

Instructions: Your calculator should handle:

- At least 4 numbers

- The four basic arithemetic operations `+, -, *, /`.

- Use `standard in` and `standard out` to accept and return data. Entering `q` should quit the application.

```
Sample:
1
2
+
= 3
2
*
= 6
4
-
= 2
q
goodbye
```

## Requirements

This project was developed for Ruby 2.5 or above.

## Setup

`bundle install`

## Test Suite

This project uses RSpec for its testing framework. Run `rspec` in project
root directory to run the full test suite.

## Running the Calculator

Run `rake rpncalc` to start the Calculator CLI.
