//
//  main.swift
//  factorio blueprint
//
//  Created by Vaida on 2025-07-10.
//

import factorio_blueprint
import Foundation
import DetailedDescription


let string = """
0eNqtVEuO2kAQvYpVq0Fqj8CYzGApi0hZZ0N2CFltUwyt8S/dZTIE+QA5SC6Wk6S6MbTJQKQZxat2ddWrV6+efYCsaLHRqiJIDqDyujKQLA9g1FMlCxurZImQgCGZP4eqMqgJNXQCVLXGF0gm3UoAVqRI4bHWvezTqi0zzkwmwmMgFmG+RUMgoKkN19SVbWJx7mcC9pCE0f2s68QrmEjcoHIbiQ/Mk2ciXRdphlu5U7W2WbnSeasoxUpmBa4hId2iOIe5ZH1G3ChtKPWC0L6xLHZKU8sRT8tlhAs49mSWVtTYvpSN1JJsa/j985dL6DsZpHSjCp7D/E3CXrlRufcPPN5y5TmblT6t4IbC35gfS8jxqtal43rB5SPY3bUGLylcEX/qO2CBOZeHjJSpyiG92sD4vEsmvFaaK9zl4/Vt1A0yJZfR4zPk8ZCW8uUkjJs29dKOr9kkPjOVWtG2RFL5P7lGb+PqUb1LzDtsgjLfWiMYtDCDqUKeYCjIpy+fubhuqWnf5kJ+eLvfeSJrluVERGIqopVYRu4U96fYnaY2IiYrrrD+4AFPHusbqbXvcedsGVhbBjsWxH5DI77mnAGBARIkG1kYZ6werl8XQ9YU9nlaGf8pnvYJse/7dYtBhgUFvj8MMC8oSk1qI3PyvC5/Pv+D2ngoibNr4FwwgnfBhYNR7zJFQSnN88h9o4qw5Kj/WQsoJEvBsYXTYsHelk/I8R0vzjln9iGax/P57GEczR7mUdf9ARLHAb4=
"""

//print(Color(red: 1, green: 0.2, blue: 0.3, alpha: 0.2))

//let file = URL(fileURLWithPath: "/Users/vaida/Desktop/colossus.txt")
//let data = try String(data: Data(contentsOf: file), encoding: .utf8)!
//
let blueprint = try Blueprint.parse(string)
detailedPrint(blueprint)
detailedPrint(blueprint.resolve(blueprint.wires!.first!.source))
