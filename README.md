# API for Factorio Blueprint String

This package offers an API for factorio blueprint string parsing and encoding.

To use this package, declare this Swift Package as a dependency.

## Blueprint Parser

This package is capable of parsing factorio blueprint string, with a type-safe API.

```swift
let string = """
0eNqtVEuO2kAQvYpVq0Fqj8CYzGApi0hZZ0N2CFltUwyt8S/dZTIE+QA5SC6Wk6S6MbTJQKQZxat2ddWrV6+efYCsaLHRqiJIDqDyujKQLA9g1FMlCxurZImQgCGZP4eqMqgJNXQCVLXGF0gm3UoAVqRI4bHWvezTqi0zzkwmwmMgFmG+RUMgoKkN19SVbWJx7mcC9pCE0f2s68QrmEjcoHIbiQ/Mk2ciXRdphlu5U7W2WbnSeasoxUpmBa4hId2iOIe5ZH1G3ChtKPWC0L6xLHZKU8sRT8tlhAs49mSWVtTYvpSN1JJsa/j985dL6DsZpHSjCp7D/E3CXrlRufcPPN5y5TmblT6t4IbC35gfS8jxqtal43rB5SPY3bUGLylcEX/qO2CBOZeHjJSpyiG92sD4vEsmvFaaK9zl4/Vt1A0yJZfR4zPk8ZCW8uUkjJs29dKOr9kkPjOVWtG2RFL5P7lGb+PqUb1LzDtsgjLfWiMYtDCDqUKeYCjIpy+fubhuqWnf5kJ+eLvfeSJrluVERGIqopVYRu4U96fYnaY2IiYrrrD+4AFPHusbqbXvcedsGVhbBjsWxH5DI77mnAGBARIkG1kYZ6werl8XQ9YU9nlaGf8pnvYJse/7dYtBhgUFvj8MMC8oSk1qI3PyvC5/Pv+D2ngoibNr4FwwgnfBhYNR7zJFQSnN88h9o4qw5Kj/WQsoJEvBsYXTYsHelk/I8R0vzjln9iGax/P57GEczR7mUdf9ARLHAb4=
"""

let blueprint = try Blueprint.parse(string)
```

You can use `detailedPrint` to retrieve a detailed description.
```swift
detailedPrint(blueprint)
```

That results in the following output.
```
Stack Storage
 ├─entities: <4 elements>
 │ ├─[0]: steel-chest | (1.5, -2.5)
 │ ├─[1]: stack-inserter | (1.5, -1.5)
 │ │      ├─control_behavior: ControlBehavior
 │ │      │ ├─circuit_condition: signal-S (virtual) ≥ 4
 │ │      │ ├─circuit_set_stack_size: true
 │ │      │ ├─circuit_set_filters: true
 │ │      │ ╰─circuit_enabled: true
 │ │      ├─filters: <1 element>
 │ │      │ ╰─[0]: = steel-chest (normal)
 │ │      ╰─use_filters: true
 │ ├─[2]: selector-combinator | (0.5, -2.0)
 │ │      ├─direction: south
 │ │      ╰─control_behavior: ControlBehavior
 │ │        ├─index_constant: 0
 │ │        ├─select_max: true
 │ │        ╰─operation: selectInput
 │ ╰─[3]: arithmetic-combinator | (2.5, -2.0)
 │        ├─direction: south
 │        ╰─control_behavior: ControlBehavior
 │          ╰─arithmetic_conditions: signal-each (virtual) [red, green] AND -4 => signal-S (virtual)
 ├─icons: <1 element>
 │ ╰─[0]: stack-inserter
 ├─version: 2.0.55:0
 ├─parameters: <5 elements>
 │ ├─[0]: (stack size variable)
 │ │      ├─type: id
 │ │      ├─id: "signal-S"
 │ │      ╰─parameter: false
 │ ├─[1]: The belt stack size
 │ │      ├─type: number
 │ │      ╰─not_parameterized: true
 │ ├─[2]: (artifact)
 │ │      ├─type: id
 │ │      ├─id: "steel-chest"
 │ │      ╰─parameter: false
 │ ├─[3]: (select first)
 │ │      ├─type: number
 │ │      ╰─not_parameterized: true
 │ ╰─[4]: (bit mask)
 │        ├─type: number
 │        ╰─not_parameterized: true
 ╰─wires: <4 elements>
   ├─[0]: Entity #1 (green) -> Entity #3 (green)
   ├─[1]: Entity #2 (green) -> Entity #3 (green output)
   ├─[2]: Entity #2 (green) -> Entity #4 (green output)
   ╰─[3]: Entity #3 (red output) -> Entity #4 (red)
```

Currently only `Blueprint` and `BlueprintBook` classes support the `parse` method.

## Blueprint String Generation

You can use `makeBlueprintString()` method to generate blueprint strings
```swift
let generatedString = try blueprint.makeBlueprintString()
```

> Note: 
> Swift `zlib` only implemented compression level 5, which is different from the recommended compression level 9. Hence you will find the resulting string different from other implementation.
>
> In this implementation, we use a `zlib` header with compression level set to `normal`. But decoders ignore this flag anyway.

## Features introduced by this package
### Type-safe parsing
In this package, we introduced many wrapper structures, such as `wire`, that parses `rawValue` into human-readable format. Because this feature is introduced by this package, the naming conversion may be different to that of others.

### ID resolving
Using the `resolve` method, you can retrieve the entity with a given `EntityID`, a wrapper around `UInt`, which serves as a reference to an entity.

```swift
detailedPrint(blueprint.resolve(blueprint.wires!.first!.source))
```

## Developer Notes
The factorio 2.0 blueprint format is rather new, and [Factorio Wiki](https://wiki.factorio.com/Blueprint_string_format) has not yet updated their guides, hence you may find some properties missing. If so, don't hesitate to create a github issue, or, even better, create a pull request.

## Credits
- [Factorio Wiki](https://wiki.factorio.com/Blueprint_string_format)

## Disclaimer

This is an unofficial, fan-made project and is not affiliated with or endorsed by Wube Software Ltd.  
Factorio and all related assets are © Wube Software Ltd.  
Screenshots and other media are used under fair use for non-commercial purposes.
