public final class CustomList<T> {

    private class Node {
        var element: T
        var next: Node?
        var previous: Node?
        init(_ element: T) { self.element = element }
    }

    private var head: Node?
    private var tail: Node?
    public private(set) var length = 0

    public init() {}

    public func append(_ element: T) {
        fatalError("TODO: implement append")
    }

    public func insert(_ element: T, at index: Int) throws {
        fatalError("TODO: implement insert")
    }

    @discardableResult
    public func delete(at index: Int) throws -> T {
        fatalError("TODO: implement delete")
    }

    public func deleteAll(_ element: T) where T: Equatable {
        fatalError("TODO: implement deleteAll")
    }

    public func get(_ index: Int) throws -> T {
        fatalError("TODO: implement get")
    }

    public func clone() -> CustomList<T> {
        fatalError("TODO: implement clone")
    }

    public func reverse() {
        fatalError("TODO: implement reverse")
    }

    public func findFirst(_ element: T) -> Int where T: Equatable {
        fatalError("TODO: implement findFirst")
    }

    public func findLast(_ element: T) -> Int where T: Equatable {
        fatalError("TODO: implement findLast")
    }

    public func clear() {
        fatalError("TODO: implement clear")
    }

    public func extend(_ other: CustomList<T>) {
        fatalError("TODO: implement extend")
    }

    public func forEach(_ callback: (T) -> Void) {
        fatalError("TODO: implement forEach")
    }

    private func node(at index: Int) throws -> Node {
        fatalError("TODO: implement node(at:)")
    }
}