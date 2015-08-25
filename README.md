# LROptional
A simple NSObject category to simplify sending optional messages to objects.

### Installation

1. **Using CocoaPods**

   Add LROptional to your Podfile:

   ```
   pod 'LROptional'
   ```

   Run the following command:

   ```
   pod install
   ```

2. **Manually**

   Clone the project or add it as a submodule. Drag `NSObject+LROptional.h/m` folder to your project.

### Usage

If you happen to write a lot of this

```
if ([obj respondsToSelector:@selector(aMessage)])
    [obj aMessage];
```

You can now replace that with this

```
[obj.lr_optional aMessage];
```

Getting rid of conditionals always feels good, but take into account that the second version is slower due to runtime hackery.


### Requirements

LROptional requires either iOS 6.0 or Mac OS X 10.8 and ARC.

You can still use LROptional in your non-arc project. Just set -fobjc-arc compiler flag in every source file.

### Contact

LROptional was created by Luis Recuenco: [@luisrecuenco](https://twitter.com/luisrecuenco).

### Contributing

If you want to contribute to the project just follow this steps:

1. Fork the repository.
2. Clone your fork to your local machine.
3. Create your feature branch.
4. Commit your changes, push to your fork and submit a pull request.

## License

LROptional is available under the MIT license. See the [LICENSE file](https://github.com/luisrecuenco/LROptional/blob/master/LICENSE) for more info.
