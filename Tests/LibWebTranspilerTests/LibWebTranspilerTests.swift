import XCTest
@testable import LibWebTranspiler

final class LibWebTranspilerTests: XCTestCase {
    func testBabel() {
        XCTAssertNoThrow(try Babel.instance.compile(code: """
        class Shape {
            constructor (id, x, y) {
                this.id = id
                this.move(x, y)
            }
            move (x, y) {
                this.x = x
                this.y = y
            }
        }
        """))
    }

    func testCoffeeScript() {
        XCTAssertNoThrow(try CoffeeScriptCompiler.instance.compile(code: """
        # Assignment:
        number   = 42
        opposite = true

        # Conditions:
        number = -42 if opposite

        # Functions:
        square = (x) -> x * x

        # Arrays:
        list = [1, 2, 3, 4, 5]

        # Objects:
        math =
          root:   Math.sqrt
          square: square
          cube:   (x) -> x * square x

        # Splats:
        race = (winner, runners...) ->
          print winner, runners

        # Existence:
        alert "I knew it!" if elvis?

        # Array comprehensions:
        cubes = (math.cube num for num in list)
        """))
    }

    func testSass() {
        XCTAssertNoThrow(try SassCompiler.instance.compile(code: """
        nav {
          ul {
            margin: 0;
            padding: 0;
            list-style: none;
          }

          li { display: inline-block; }

          a {
            display: block;
            padding: 6px 12px;
            text-decoration: none;
          }
        }
        """))
    }

    func testTypeScript() {
        XCTAssertNoThrow(TypeScriptCompiler.instance.compile(code: """
        class Greeter<T> {
            greeting: T;
            constructor(message: T) {
                this.greeting = message;
            }
            greet() {
                return this.greeting;
            }
        }

        let greeter = new Greeter<string>("Hello, world");

        let button = document.createElement('button');
        button.textContent = "Say Hello";
        button.onclick = function() {
            alert(greeter.greet());
        }

        document.body.appendChild(button);
        """))
    }

    static var allTests = [
        ("testBabel", testBabel),
        ("testCoffeeScript", testCoffeeScript),
        ("testSass", testSass),
        ("testTypeScript", testTypeScript),
    ]
}
