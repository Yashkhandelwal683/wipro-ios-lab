# Lab 5A – GCD, Queues and Main-Thread UI

## Objective
To demonstrate background execution using Grand Central Dispatch (GCD),
perform UI updates on the main thread, simulate delayed operations,
prevent duplicate submissions, and debug thread execution.

## Requirements Covered

### R1: Simulate a slow operation without blocking the main thread
A simulated 3-second operation is performed inside a background queue.

### R2: Use DispatchQueue.global and DispatchQueue.main
Background work is executed using DispatchQueue.global().
UI updates are performed using DispatchQueue.main.async.

### R3: Simulate a delayed response
Thread.sleep(forTimeInterval:) simulates a slow operation.

### R4: Loading indicator and duplicate submission prevention
An activity indicator is displayed while the task is running.
The button is disabled during execution.

### R5: Debugging and logging
Print statements and Thread.isMainThread are used to identify
where the code executes.

## File
- GCDDemoViewController.swift

## Technologies
- Swift
- UIKit
- Grand Central Dispatch (GCD)
- DispatchQueue
