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
        let node = Node(element)
        if tail == nil {
            head = node
            tail = node
        } else {
            tail!.next = node
            node.previous = tail
            tail = node
        }
        length += 1
    }

    public func insert(_ element: T, at index: Int) throws {
        guard index >= 0 && index <= length else { throw ListError.indexOutOfBounds }

        if index == length {                        
            append(element)
            return
        }

        let newNode = Node(element)
        if index == 0 {                              
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {                                     
            let nodeAtIndex = try node(at: index)
            let prev = nodeAtIndex.previous
            prev?.next = newNode
            newNode.previous = prev
            newNode.next = nodeAtIndex
            nodeAtIndex.previous = newNode
        }
        length += 1
    }


    @discardableResult
    public func delete(at index: Int) throws -> T {
        let node = try node(at: index)
        let prev = node.previous
        let next = node.next

        if prev == nil { head = next } else { prev!.next = next }
        if next == nil { tail = prev } else { next!.previous = prev }

        length -= 1
        return node.element
    }

    public func deleteAll(_ element: T) where T: Equatable {
        var current = head
        var idx = 0
        while let node = current {
            current = node.next
            if node.element == element {
                _ = try? delete(at: idx)
                idx -= 1
            }
            idx += 1
        }
    }

    public func get(_ index: Int) throws -> T {
        try node(at: index).element
    }

    public func clone() -> CustomList<T> {
        let copy = CustomList<T>()
        forEach { copy.append($0) }
        return copy
    }

    public func reverse() {
        var current = head
        while let node = current {
            swap(&node.next, &node.previous)
            current = node.previous
        }
        swap(&head, &tail)
    }

    public func findFirst(_ element: T) -> Int where T: Equatable {
        var idx = 0
        var current = head
        while let node = current {
            if node.element == element { return idx }
            idx += 1
            current = node.next
        }
        return -1
    }

    public func findLast(_ element: T) -> Int where T: Equatable {
        var idx = length - 1
        var current = tail
        while let node = current {
            if node.element == element { return idx }
            idx -= 1
            current = node.previous
        }
        return -1
    }

    public func clear() {
        head = nil
        tail = nil
        length = 0
    }

    public func extend(_ other: CustomList<T>) {
        other.forEach { append($0) }
    }

    public func forEach(_ callback: (T) -> Void) {
        var cur = head
        while let node = cur {
            callback(node.element)
            cur = node.next
        }
    }

    private func node(at index: Int) throws -> Node {
        guard index >= 0 && index < length else { throw ListError.indexOutOfBounds }

        if index < length / 2 {
            var cur = head
            var i = 0
            while i < index { cur = cur!.next; i += 1 }
            return cur!
        } else {
            var cur = tail
            var i = length - 1
            while i > index { cur = cur!.previous; i -= 1 }
            return cur!
        }

    }
}

public enum ListError: Error {
    case indexOutOfBounds
}