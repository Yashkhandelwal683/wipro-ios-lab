# Lab 5C – TaskGroup, Concurrent Fetching and Partial Failure

## Objective
Simulate fetching details for multiple course IDs independently,
launch requests concurrently using a TaskGroup, compare sequential
and concurrent execution times, handle child task failure,
and document cancellation and task lifetime.

## Requirements Covered

### R1: Independent Fetching
The fetchCourse(id:) function independently simulates fetching
course details for multiple course IDs.

### R2: Concurrent Requests
withTaskGroup and group.addTask launch multiple requests concurrently.

### R3: Sequential vs Concurrent Timing
The application compares total elapsed time for sequential
and concurrent fetching.

### R4: Partial Failure
Course ID 3 is simulated as a failed request.
Other successful course results are still collected.

### R5: Cancellation and Task Lifetime
TaskGroup uses structured concurrency.
Child tasks belong to the parent scope.
Cancellation propagates to child tasks.
The task group waits for its child tasks to finish.

## Technologies
- Swift
- async/await
- TaskGroup
- Structured Concurrency
- Cancellation
- Foundation
