# Lab 4A: MVC and MVVM in Swift

## Objective
Build a simple Task List application with Add, Complete, Delete and Filter operations. Implement the application using MVC and MVVM architectures and compare their responsibilities and testability.

## Features
- Add new tasks
- Mark tasks as completed
- Delete tasks
- Filter tasks (All, Active, Completed)
- Validate empty task input
- Compare MVC and MVVM architectures

## Folder Structure

```text
lab-4a/
├── README.md
├── Task.swift
├── MVC/
│   ├── TaskModel.swift
│   ├── TaskController.swift
│   └── TaskView.swift
└── MVVM/
    ├── TaskModel.swift
    ├── TaskViewModel.swift
    └── TaskView.swift
```

## MVC (Model-View-Controller)

### Model
Stores task data and task properties.

### View
Displays the task list, input field, buttons and filter.

### Controller
Handles task operations such as adding, completing, deleting and filtering tasks.

## MVVM (Model-View-ViewModel)

### Model
Represents individual tasks.

### View
Displays the UI and observes changes in the ViewModel.

### ViewModel
Contains task management logic, filtering and validation. It separates business logic from the user interface.

## MVC vs MVVM

| Aspect | MVC | MVVM |
|---|---|---|
| Responsibilities | Model, View, Controller | Model, View, ViewModel |
| Logic | Controller handles operations | ViewModel handles operations |
| Testability | Moderate | Better |
| UI dependency | Controller can be closely connected to View | ViewModel is more UI-independent |
| Maintainability | Can become complex as Controller grows | Easier to organize larger applications |

## R4: Moving Logic Out of the View

In MVVM, task filtering, validation, adding, completing and deleting are handled in the ViewModel instead of placing all logic directly inside the View.

This makes the UI simpler, improves testability and separates presentation from business logic.

## R5: Comparison

MVC is useful for small applications and provides a simple separation of responsibilities. However, Controllers can become large as features grow.

MVVM separates UI-related logic into the ViewModel. It makes the application easier to test, maintain and extend.

For a modern SwiftUI application, MVVM is generally a suitable approach because SwiftUI works naturally with observable state and ViewModels.

## Conclusion

This lab demonstrates how the same Task List application can be implemented using MVC and MVVM. It highlights the importance of separating UI, data and logic for maintainable applications.
