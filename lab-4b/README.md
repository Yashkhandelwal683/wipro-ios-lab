# Lab 4B: App, Scene, and View Lifecycles

## Objective
Observe app/scene and view lifecycle events, navigate between two screens, record lifecycle callbacks, and move a lightweight refresh action to an appropriate lifecycle point.

## Folder Structure

```text
lab-4b/
├── README.md
├── LifecycleApp.swift
├── HomeView.swift
└── DetailView.swift
```

## R1: App/Scene Lifecycle Logging

The app observes scene phase changes using `scenePhase`.

Events logged:
- Active
- Inactive
- Background

The application also logs its initialization.

## R2: View Appearance and Disappearance

Both HomeView and DetailView use:

- `onAppear`
- `onDisappear`

These callbacks help observe when a view enters or leaves the visible interface.

## R3: Navigation and Lifecycle Observations

The application provides navigation between HomeView and DetailView.

When navigating between screens, lifecycle logs can be observed in the Xcode console.

Example observations:
- HomeView appears when the app starts.
- DetailView appears when opened.
- DetailView disappears when navigating back.
- HomeView may appear again depending on navigation and view lifecycle behavior.

A view's lifecycle should not be assumed to happen only once.

## R4: Refresh Action

A lightweight refresh action is performed when the scene becomes active.

The refresh is connected to the scene phase using `onChange`.

This is suitable for refreshing lightweight UI data when the application returns to the foreground.

For expensive network operations or complex data synchronization, a dedicated data-management layer should be used.

## R5: Repeated View Appearance

Views may appear and disappear multiple times during navigation.

`onAppear` is not a one-time initialization guarantee. Developers should avoid assuming that a view will only appear once.

Repeated lifecycle events can be observed in the Xcode console.

## Conclusion

This lab demonstrates app/scene lifecycle observation, view appearance and disappearance, navigation between screens, refreshing data when the scene becomes active, and repeated view appearances.
