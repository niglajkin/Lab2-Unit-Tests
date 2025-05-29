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
            storage.append(element)            
        } else {
            storage.insert(element, at: index)
        }
    }

    @discardableResult
    public func delete(at index: Int) throws -> T {
        guard index >= 0 && index < length else { throw ListError.indexOutOfBounds }
        return storage.remove(at: index)
    }

    public func deleteAll(_ element: T) where T: Equatable {
        storage.removeAll { $0 == element }
    
    }

    public func get(_ index: Int) throws -> T {
        guard index >= 0 && index < length else { throw ListError.indexOutOfBounds }
        return storage[index]
    }

    public func clone() -> CustomList<T> {
        let copy = CustomList<T>()
        storage.forEach { copy.append($0) }
        return copy
    }

    public func reverse() {
        storage.reverse()
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