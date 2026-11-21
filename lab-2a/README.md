
# Lab 2A: Functions and Higher-Order Functions

## Objective
Practice Swift functions, parameter labels, return types,
and higher-order functions.

## R1: Functions

Created functions to:

- Calculate the mean of an array of numbers.
- Find the maximum number.
- Validate email-like input.
- Format a display name.

The mean function returns an optional result to safely handle empty arrays.

## R2: Filter, Map and Reduce

Used an array of transactions.

- filter: Selected only expense transactions.
- map: Transformed expenses into their amounts.
- reduce: Calculated the total expense.

## R3: Sorting Students

Created a Student structure with name and marks.

Students are sorted:
- By marks in descending order.
- By name in ascending order when marks are equal.

## R4: Loop vs Higher-Order Functions

### Loop-Based Solution
Used a for loop and an if condition to calculate the total expenses.

### Higher-Order Function Solution
Used filter, map, and reduce to calculate the total expenses.

Higher-order functions make the code more declarative and concise.
Loop-based solutions can sometimes be easier for beginners to
understand step-by-step.

## R5: Parameter Labels and Return Types

Used clear parameter labels such as:

- calculateMean(numbers:)
- findMaximum(numbers:)
- validateEmail(email:)
- formatDisplayName(name:)

Explicit return types improve clarity and make function behaviour
easier to understand.

## Conclusion

This lab demonstrates functions, parameter labels, return types,
filter, map, reduce, and sorting in Swift.
