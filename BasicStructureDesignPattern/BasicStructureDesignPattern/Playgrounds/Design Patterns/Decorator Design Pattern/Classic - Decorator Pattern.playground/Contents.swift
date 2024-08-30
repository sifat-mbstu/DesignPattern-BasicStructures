import UIKit

/// Head First Design Pattern
/// The Classic Coffee Example

//MARK: Interface
protocol Coffee {
    func cost() -> Int
}

//MARK: ConcreteComponent
class Mocha: Coffee {
    func cost() -> Int {
        return 130
    }
}

//MARK: ConcreteComponent
class Cappuccino: Coffee {
    func cost() -> Int {
        return 200
    }
}

//MARK: Base Decorator
class CondimentDecorator: Coffee {
    private let coffee: Coffee
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    func cost() -> Int {
        coffee.cost()
    }
}

//MARK: Concrete Decorators
class Almonds: CondimentDecorator {
    override func cost() -> Int {
        return super.cost() + extra()
    }
    private func extra() -> Int {
        return 30
    }
}

//MARK: Concrete Decorators
class Chocolate: CondimentDecorator {
    override func cost() -> Int {
        return super.cost() + extra()
    }
    private func extra() -> Int {
        return 40
    }
}

//MARK: Client Code
var mocha: Coffee = Mocha()
mocha = Chocolate(coffee: mocha)
mocha = Chocolate(coffee: mocha)
mocha = Almonds(coffee: mocha)
print(mocha.cost())
