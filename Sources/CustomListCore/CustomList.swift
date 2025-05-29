public final class CustomList<T> {

    private var storage: [T] = []

    public var length: Int { storage.count }

    public init() {}

    public func append(_ element: T) {
        storage.append(element)
    }

    public func insert(_ element: T, at index: Int) throws {
        guard index >= 0 && index <= length else { throw ListError.indexOutOfBounds }
        if index == length {
            return // BUG: should append
        }
        storage.insert(element, at: index)
    }

    @discardableResult
    public func delete(at index: Int) throws -> T {
        guard index >= 0 && index < length else { throw ListError.indexOutOfBounds }
        return storage.remove(at: index)
    }

    public func deleteAll(_ element: T) where T: Equatable {
        if let idx = storage.firstIndex(of: element) {
            storage.remove(at: idx) // BUG: should remove all occurrences
        }
    }

    public func get(_ index: Int) throws -> T {
        guard index >= 0 && index < length else { throw ListError.indexOutOfBounds }
        return storage[index]
    }

    public func clone() -> CustomList<T> {
        let c = CustomList<T>()
        storage.forEach { c.append($0) }
        return c
    }

    public func reverse() {
        // BUG: somehow skipped...
    }

    public func findFirst(_ element: T) -> Int where T: Equatable {
        storage.firstIndex(of: element) ?? -1
    }

    public func findLast(_ element: T) -> Int where T: Equatable {
        storage.lastIndex(of: element) ?? -1
    }

    public func clear() {
        storage.removeAll()
    }

    public func extend(_ other: CustomList<T>) {
        other.forEach { storage.append($0) }
    }

    public func forEach(_ callback: (T) -> Void) {
        storage.forEach(callback)
    }
}

public enum ListError: Error {
    case indexOutOfBounds
}