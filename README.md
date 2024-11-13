# BouncySlider

[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

**BouncySlider** is a customizable and interactive SwiftUI slider with a delightful bouncy animation. Perfect for adding a fun, engaging slider component to your iOS apps.

## Features

- 🌈 Smooth and bouncy animation for enhanced user experience.
- 🎨 customizable appearance (color, image, size).
- 📱 Compatible with SwiftUI and supports iOS.

## Preview

<p align="center">
  <img src="https://github.com/Mor4eza/BouncySlider/blob/main/Resource/demo.gif" width="300" alt="BouncySlider demo">
</p>

## Installation

You can add BouncySlider to your project using Swift Package Manager:

1. Open your project in Xcode.
2. Go to **File > Swift Packages > Add Package Dependency...**
3. Enter the following URL:
4. https://github.com/Mor4eza/BouncySlider.git
5. Select the version you’d like to use, or leave it as the default, and click **Next**.

## Usage

### Basic Usage

To use **BouncySlider** in your SwiftUI view:

```swift
import SwiftUI
import BouncySlider

struct ContentView: View {

    @State var value: CGFloat = 0.5
    var body: some View {
        VStack {
            BouncySlider(value: $value, orientation: .vertical) {
                if value == 1.0 {
                    Image(systemName: "speaker.wave.3.fill").foregroundStyle(.gray)
                } else if value < 1.0 && value > 0.36 {
                    Image(systemName: "speaker.wave.2.fill").foregroundStyle(.gray)
                } else if value <= 0.35 && value > 0.0 {
                    Image(systemName: "speaker.wave.1.fill").foregroundStyle(.gray)
                } else {
                    Image(systemName: "speaker.fill").foregroundStyle(.gray)
                }
            }
            Text("Volume: \(Int(value * 100))%")
                
        }
        
    }
}
```


### Customization

You can customize various properties of the slider to fit your design needs:

- **Background Color**: Set the color of the slider Background.
- **Fill Color**: Set the color of the Slider.
- **Custom Image**: Add Custom Image to Slider.
- **Orientation**: Set the Slider Orientation to Vertical or Horizontal.
- **Slider length**: Change the length of the slider.

Example:

```swift
BouncySlider(value: $value, orientation: .vertical, backgroundColor: .red, fillColor: .yellow) {
  Image() // use your desired image
}
```

## Example

To see **BouncySlider** in action, check out the included example project in the repository.

1. Clone the repository:
   ```bash
   git clone https://github.com/Mor4eza/BouncySlider.git
   ```
2. Open BouncySliderExample.xcodeproj in Xcode.

3. Build and run the project in the simulator or on a device.

This example demonstrates the basic and advanced uses of BouncySlider and lets you experiment with different customization options.

## Requirements

- iOS 14.0+
- Swift 5.0+
- SwiftUI

## License

BouncySlider is available under the MIT license. See the [LICENSE](LICENSE) file for more information.

## Contributing

Contributions are welcome! If you have ideas for new features, improvements, or find any bugs, feel free to open an issue or submit a pull request. Please ensure that your contributions align with the existing code style and provide appropriate documentation.

