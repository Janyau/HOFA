[![6yRv8K.jpg](https://s3.ax1x.com/2021/03/16/6yRv8K.jpg)](https://imgtu.com/i/6yRv8K)


- [Features](#features)
- [Requirements](#requirements)
- [Usage](#usage)
- [Communication](#communication)
- [Installation](#installation)

## Features

- [x] safe operation
- [x] simple to use
- [x] high order function

## Requirements

- iOS 9.0+ / macOS 9.0+ / tvOS 9.0+ / watchOS 9.0+
- Xcode 11+

## Usage
Safe operation
```
NSArray *list = @[@"1", @"2", @"3", @"4", @"5"];
NSMutableArray *mList = [NSMutableArray arrayWithObject:list];
[mList check_objectAtIndex:10];
[mList check_addObject:@"10"];
[mList check_insertObject:@"item" atIndex:10];
[mList check_replaceObjectAtIndex:10 withObject:@"item"];
[mList check_removeObjectAtIndex:10];
```

Find
>  The find() method returns the value of the first element in the provided array that satisfies the provided testing function. If no values satisfy the testing function, nil is returned.

```
NSString *findItem = [list find:^BOOL(NSString * _Nonnull item) {
    return [item isEqualToString:@"3"];
}];
```

Some
> The some() method tests whether at least one element in the array passes the test implemented by the provided function. It returns true if, in the array, it finds an element for which the provided function returns true; otherwise it returns false. It doesn't modify the array.

```
BOOL isVerifySome = [list some:^BOOL(NSString * _Nonnull item) {
    return item.integerValue > 3;
}];
```

Every
> The every() method tests whether all elements in the array pass the test implemented by the provided function. It returns a Boolean value.

```
BOOL isVerifyEvery = [list every:^BOOL(NSString * _Nonnull item) {
    return item.integerValue > 3;
}];
```

Filter
> The filter() method creates a new array with all elements that pass the test implemented by the provided function.

```
NSArray *filterList = [list filter:^BOOL(NSString * _Nonnull item) {
    return item.integerValue > 3;
}];
```

Map
> The map() method creates a new array populated with the results of calling a provided function on every element in the calling array.

```
NSArray *mapList = [list map:^id(NSString * _Nonnull item) {
    NSNumber *obj = [NSNumber numberWithInteger:item.integerValue];
    return obj;
}];
```

## Communication

- If you **found a bug**, open an issue here on GitHub and follow the guide. The more detail the better!
- If you **want to contribute**, submit a pull request!

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate HOFA into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'HOFA', '~> 0.0.1'
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can drag the "HOFA" document folder into your project.

## License

HOFA is released under the MIT license. [See LICENSE](https://github.com/Janyau/HOFA/blob/main/LICENSE) for details.