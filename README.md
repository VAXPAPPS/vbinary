# VBinary - Number Base Converter

A professional and fast Flutter application for converting numbers between different numeral systems (Binary, Octal, Decimal, Hexadecimal) with an elegant user interface and modern design.

---

## ✨ Key Features

### 🔄 Fast and Accurate Conversion
- Instant conversion between **4 numeral systems**:
  - **Binary (2)**: Binary number system
  - **Octal (8)**: Octal number system
  - **Decimal (10)**: Decimal number system
  - **Hexadecimal (16)**: Hexadecimal number system

### ✅ Smart Input Validation
- Real-time validation of number correctness
- Clear and helpful error messages
- Automatic prevention of incorrect inputs

### 🎨 Modern User Interface
- **Glass Morphism** design (glass-like effects)
- **Professional dark theme** that's easy on the eyes
- Smooth and fluid animations
- Instant response to user input

### 🏗️ Clean and Powerful Architecture
- **Clean Architecture** with complete separation of concerns
- **BLoC Pattern** for effective state management
- Maintainable and developable code
- Easy to add new features


### ⚡ High Performance
- Instant conversions even for very large numbers
- Responsive interface with no lag
- Low resource consumption

---

## 🚀 Quick Start

### Requirements
```bash
- Flutter 3.9.2 or later
- Dart 3.9.2 or later
- Linux / macOS / Windows
```

### Installation and Running
```bash
# 1. Install dependencies
cd /home/x/Desktop/Vaxp-Template
flutter pub get

# 2. Run the application
flutter run -d linux   # or macos or windows

# 3. Or from VS Code
# Press F5 for direct run
```

### Usage
```
1. Enter the number you want to convert
2. Select the source numeral system (from)
3. Select the target numeral system (to)
4. Press the "Convert" button
5. Click the result to copy it automatically
```

---

## 📊 Conversion Examples

| From | Input | To | Result |
|------|-------|-----|--------|
| Decimal | 255 | Hexadecimal | FF |
| Hexadecimal | FF | Binary | 11111111 |
| Binary | 1010 | Decimal | 10 |
| Decimal | 64 | Octal | 100 |
| Octal | 77 | Decimal | 63 |
| Hexadecimal | ABC | Decimal | 2748 |

---

## 🏗️ Architecture Structure

The project follows **Clean Architecture** with **BLoC**:

```
lib/
├── domain/                 # Domain (Business Logic)
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── data/                   # Data (Implementation)
│   └── repositories/
├── application/            # Application (State Management)
│   ├── blocs/
│   ├── events/
│   └── states/
├── presentation/           # Presentation (UI)
│   ├── screens/
│   └── widgets/
├── infrastructure/         # Infrastructure
│   └── services/
└── core/                   # Core Elements
    ├── colors/
    ├── theme/
    └── text/
```

---

## 🔧 Main Components

### Domain Layer
- **ConversionResult**: Entity representing the result
- **NumberRepository**: Contract interface
- **UseCases**: Use cases (conversion, validation, numeral systems)

### Data Layer
- **NumberRepositoryImpl**: Actual conversion implementation
- Precise and fast conversion algorithms

### Application Layer
- **NumberConversionBloc**: State management
- **Events**: Events (convert, validate, clear)
- **States**: States (loading, success, error)

### Presentation Layer
- **ConverterScreen**: Main screen
- **BaseSelector**: System selection
- **NumberInputField**: Number input field
- **ResultDisplay**: Result display

---

## 📚 Used Packages

```yaml
flutter_bloc: ^8.1.6    # State management
bloc: ^8.1.4            # Core logic
equatable: ^2.0.5       # Object comparison
window_manager: ^0.5.1  # Window management
venom_config: ^0.0.1    # Settings system
```

---

## 🎨 Design and Colors

### Color System
- **Primary**: Dark gray used for main elements
- **Secondary**: Blue for secondary elements
- **Glass Surface**: Transparent glass effect

### Effects
- ✨ **Glassmorphism**: Professional glass effect
- 🌀 **Blur**: Smooth blur effect
- 🎭 **Smooth Animations**: Fluid movements
- 🎨 **Dark Theme**: Modern dark theme

---

## 🔄 Workflow

```
User enters a number
        ↓
Selects input and output systems
        ↓
Presses "Convert" button
        ↓
BLoC validates input
        ↓
Repository performs conversion
        ↓
State emits result
        ↓
Interface displays result
```

---

## ✅ Quality Standards

- ✅ Clean and organized code (Clean Code)
- ✅ Dart and Flutter standards (Linting)
- ✅ Comprehensive error handling
- ✅ Clear error messages
- ✅ Professional user interface
- ✅ High and fast performance
- ✅ Maintainable and developable

---

## 🎯 Use Cases

- 💻 **Systems Programming**: Understanding binary and Hex values
- 🎓 **Education**: Learning numeral systems
- 🎨 **Design**: Converting RGB/HEX colors
- 🌐 **Networking**: IP calculations and masks
- 📱 **Development**: Data values and addresses

---

## 🚀 Planned Future Features

- 📋 Conversion history
- 🔄 Batch conversion (Multiple conversions)
- 💾 Save favorites
- 🌐 Multi-language support
- 🎨 Theme and color customization
- 📊 Usage statistics

---

## 📝 Important Notes

- Clean and easy-to-use interface
- Large numbers are fully supported
- Hexadecimal supports both A-F and a-f
- Conversion is instant with no delay
- Interface is intuitive for everyone

---

## 🐛 Troubleshooting

### Problem: "Invalid number for the system"
**Solution**: Make sure the numbers are correct:
- Binary: Only 0 and 1
- Octal: 0-7
- Decimal: 0-9
- Hexadecimal: 0-9, A-F

### Problem: Empty field
**Solution**: Enter a number before pressing convert

### Problem: Unresponsive
**Solution**: Make sure:
- All dependencies are installed (`flutter pub get`)
- Flutter is working correctly (`flutter doctor`)

---

## 👨‍💻 Contributing and Development

To add new features, follow the existing structure:

1. Add **UseCase** in `domain/usecases/`
2. Add **Implementation** in `data/repositories/`
3. Add **Event/State** in `application/`
4. Add **Widget/Screen** in `presentation/`

---

## 📞 Support and References

- [Flutter Documentation](https://flutter.dev)
- [BLoC Pattern](https://bloclibrary.dev)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

---

## 📄 License

VAXP organization projects
