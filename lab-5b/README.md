# Lab 5B – Swift Concurrency and Async/Await

## Objective
Demonstrate asynchronous data fetching using async/await,
Task creation, cancellation, and UI state handling.

## Requirements Covered

### R1: Async function
An async function simulates fetching courses with a delay.

### R2: Task and UI update
A Task calls the async function and updates the UI after the result is ready.

### R3: Loading, success, empty and failure states
The application displays loading, success, empty, cancellation
and failure messages.

### R4: Cancellation
A cancel button cancels the active Task.
Task.checkCancellation() checks whether the task was cancelled.

### R5: Async function vs Task
Declaring an async function does not execute it automatically.
A Task is created to start and manage asynchronous execution.

## Technologies
- Swift
- UIKit
- async/await
- Task
- Task Cancellation
