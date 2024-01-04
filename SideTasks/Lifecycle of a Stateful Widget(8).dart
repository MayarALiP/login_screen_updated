/*
*
* The Lifecycle of a Stateful Widget in Flutter

Flutter, a popular open-source UI software development toolkit, utilizes the concept of widgets to build user interfaces. Among these, the StatefulWidget is a crucial element that allows developers to manage mutable state within their applications. Understanding the lifecycle of a StatefulWidget is essential for effective Flutter development.
Introduction

A StatefulWidget is a widget in Flutter that has mutable state. Unlike StatelessWidget, which is immutable, StatefulWidget can change its internal state during its lifetime. The lifecycle of a StatefulWidget is divided into various phases, each serving a specific purpose.
Lifecycle Phases
1. Initialization (createState())

    The lifecycle begins when an instance of a StatefulWidget is created.
    The createState() method is called during the widget creation process, returning an associated State object.
    Initialization typically involves setting up any initial values or resources.

2. Mounting (mounted and initState())

    After initialization, the widget is mounted to the widget tree using the State.initState() method.
    initState() is the ideal place to perform any setup that depends on the widget's initial properties.
    The mounted property is set to true, indicating that the widget is currently part of the widget tree.

3. Updating (didChangeDependencies(), build(), didUpdateWidget())

    Whenever the dependencies of the widget change, the didChangeDependencies() method is invoked.
    The build() method is called to create the widget's UI.
    If the widget is rebuilt with new parameters, didUpdateWidget() is called.
    Developers should handle updates and rebuild the widget as needed.

4. Destruction (dispose())

    The dispose() method is invoked when the widget is removed from the widget tree.
    Developers should use this phase to release any resources held by the widget, such as subscriptions or controllers.
    After dispose(), the widget is considered unmounted (mounted is set to false).

Common Use Cases

    Data Loading:
        Fetch data in initState() or didChangeDependencies().

    User Interactions:
        Handle user interactions and state changes within the build() method.

    Animation:
        Initiate animations in initState() and manage their state during updates.

    Resource Cleanup:
        Release resources, such as closing streams or controllers, in the dispose() method.

why do we need it ?!

    Minimize Work in Build:
        Keep the build() method lightweight to ensure smooth UI updates.

    Optimize Resource Management:
        Carefully manage resources to prevent memory leaks.

    Use Keys:
        When dealing with widgets that may be rebuilt, use keys to maintain state between updates.

Conclusion

The lifecycle of a StatefulWidget in Flutter provides developers with a structured way to manage state changes and interactions.
* By understanding each phase of the lifecycle, developers can create robust and efficient applications that respond dynamically to user
*  input and external changes. As Flutter continues to evolve, mastering the intricacies of stateful widget lifecycles remains a fundamental
* skill for Flutter developers.
*
* */
