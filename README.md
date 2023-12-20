<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Elevate your Dart application's user experience with our lightweight and intuitive Toast Plugin. Designed for simplicity and efficiency, this plugin empowers developers to effortlessly display toast messages that automatically dismiss, providing a seamless way to communicate essential information to users.

This is inspired by the app at https://schoolofnewafrica.com/. All the credit to my product design lead Tagoe Kingston (https://dribbble.com/niimantse), who is the brain behind the UI concept.


## Features

![timeline_tree](https://github.com/bright2kwame/flutter_simple_toast/blob/flutter_simple_toast/assets/simple_toast_image.png)

• Easy Integration:
  Swiftly integrate toast notifications into your Dart applications with minimal setup. Our 
  plugin is designed for hassle-free implementation, saving you valuable development time.

• Automatic Dismissal:
  Say goodbye to manual dismissals. Our Toast Plugin is equipped with automatic dismissal     
  functionality, ensuring that your toast messages gracefully fade away after a customizable 
  duration.

• Customization Options:
  Tailor the appearance of your toast messages to align with your application's aesthetics. 
  Customize text, background color, duration, and more to create a seamless and branded user 
  experience.

• Responsive Design:
  Whether you're developing for mobile, web, or desktop, our plugin adapts seamlessly to various 
  screen sizes and resolutions, ensuring a consistent and visually appealing toast experience 
  across platforms.

## Getting started

To install the package, run this command:

```
 $ flutter pub add simple_toast

```

This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):

```yaml
dependencies:
  simple_toast: ^0.0.1

```

Import it and use it in your dart code:

```
import 'package:simple_toast/timeline_tree.dart';

```

## Usage

Timeline Model list

```dart
List<TimelinePluginModel> items = [];
```

Node Arrangements

• Position Node Left 
```dart
 var rightModel = TimelinePluginModel(
            isActive: true,
            position: TimelinePluginViewPosition.right,
            child: _timelineItemView(element));
```
• Position Node Right 

```dart
 var rightModel = TimelinePluginModel(
            isActive: false,
            position: TimelinePluginViewPosition.left,
            child: _timelineItemView(element));
```

• Add Models to List 
```dart
 items.add(rightModel);
 items.add(rightModel);
 ```

TIMELINE TREE

• Create Timeline Tree

 ```dart
TimelinePlugin(
        items: items,
        lineWidth: 5,
        shrinkWrap: true,
        primary: false,
        overlapFactor: 0.6,
        activelineColor: AppResourses.appColors.primaryColor,
        physics: const NeverScrollableScrollPhysics(),
      ),
```

## Example

• Import the package
```dart
 //import the plugin
 import 'package:timeline_tree/timeline_tree.dart';
```

```dart
 List<TimelinePluginModel> timelinePluginModels = [];
```

• Extracting and Preparing Data
```dart
 List<TimelinePluginModel> items = [];
 //itereating over the list of data
 for (int index = 0; index < responseItems.length; index++) {
      MissionTimelineItem element = responseItems[index];
      var positionedRight = index % 2 != 0;
      var model = TimelinePluginModel(
            isActive: !element.locked,
            position: positionedRight ? TimelinePluginViewPosition.right :  
            TimelinePluginViewPosition.left,
            child: _timelineItemView(element));
        items.add(model);
      
    //updating the view
    setState(() {
      timelinePluginModels = items;
    });
  }
```

• Creating the View
```dart
  Widget _timelineView() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: TimelinePlugin(
        items: timelinePluginModels,
        lineWidth: 5,
        shrinkWrap: true,
        primary: false,
        overlapFactor: 0.6,
        activelineColor: AppResourses.appColors.primaryColor,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
  ```

## Additional information

• Timeline Tree

@items, list of model items to be displayed in the timeline
@lineWidth, the width of the line in the timeline
@inactivelineColor, color of the line for inactive region
@activelineColor, color of the line for active regions
@overlapFactor, the fraction for which the oncoming view should overlap

```dart
class TimelinePlugin {
  final List<TimelinePluginModel> items,
  final bool primary,
  final bool shrinkWrap,
  final ScrollPhysics? physics,
  final double lineWidth,
  final Color inactivelineColor,
  final Color activelineColor,
  final double overlapFactor
}
```

• Timeline Model

@position, is an enum that tells if to position the node to left and right
@isActive, tells if the that object is active or not. This helps for people who want the timeline have states
@child, the view to attached to the tree

```dart
class TimelinePluginModel(
           final bool isActive,
           final TimelinePluginViewPosition position,
           final Widget child)
```

• Timeline Position Enum

Indicate the position of arrangement

```dart
enum TimelinePluginViewPosition {
  left,
  right
}
```