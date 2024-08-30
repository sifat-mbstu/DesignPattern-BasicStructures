import Foundation

// Help: https://refactoring.guru/design-patterns/decorator

protocol Interface {
    func execute()
}

class ConcreteComponent: Interface {
    func execute() {}
}

class BaseDecorator: Interface {
    private let wrappee: Interface
    init(wrappee: Interface) {
        self.wrappee = wrappee
    }
    func execute() {
        wrappee.execute()
    }
}

class ConcreteDecorator1: BaseDecorator {
    override func execute() {
        super.execute()
        extra()
    }
    private func extra() {}
}

class ConcreteDecorator2: BaseDecorator {
    override func execute() {
        super.execute()
        extra()
    }
    private func extra() {}
}

func clientCode() {
    var component: Interface = ConcreteComponent()
    component = ConcreteDecorator1(wrappee: component)
    component = ConcreteDecorator2(wrappee: component)
    component.execute()
}

clientCode()
