import XCTest
@testable import CustomListCore

private func makeList(_ chars: String = "") -> CustomList<Character> {
    let l = CustomList<Character>()
    chars.forEach { l.append($0) }
    return l
}

final class CustomListTests: XCTestCase {

    func testEmptyList() {
        let list = makeList()
        XCTAssertEqual(list.length, 0)
    }

    func testAppendAndOrder() {
        let list = makeList()
        "ABCD".forEach { list.append($0) }
        var out: [Character] = []
        list.forEach { out.append($0) }
        XCTAssertEqual(out, ["A","B","C","D"])
        XCTAssertEqual(list.length, 4)
    }

    func testInsert() throws {
        let list = makeList("AC")
        try list.insert("B", at: 1)
        try list.insert("D", at: 3)      // tail insert
        var out: [Character] = []
        list.forEach { out.append($0) }
        XCTAssertEqual(out, ["A","B","C","D"])
        XCTAssertThrowsError(try list.insert("X", at: 10))
    }

    func testGetDelete() throws {
        let list = makeList("ABC")
        XCTAssertEqual(try list.get(1), "B")
        XCTAssertEqual(try list.delete(at: 1), "B")
        XCTAssertEqual(list.length, 2)
        var out: [Character] = []
        list.forEach { out.append($0) }
        XCTAssertEqual(out, ["A","C"])
        XCTAssertThrowsError(try list.get(5))
    }

    func testDeleteAll() {
        let list = makeList("AABAA")
        list.deleteAll("A")
        var out: [Character] = []
        list.forEach { out.append($0) }
        XCTAssertEqual(out, ["B"])
        XCTAssertEqual(list.length, 1)
    }

    func testReverse() {
        let list = makeList("ABCDE")
        list.reverse()
        var out: [Character] = []
        list.forEach { out.append($0) }
        XCTAssertEqual(out, ["E","D","C","B","A"])
        list.reverse()
        out.removeAll()
        list.forEach { out.append($0) }
        XCTAssertEqual(out, ["A","B","C","D","E"])
    }

    func testCloneDeepCopy() throws {
        let original = makeList("XY")
        let copy = original.clone()
        try copy.insert("Z", at: 0)
        XCTAssertEqual(original.length, 2)
        XCTAssertEqual(copy.length, 3)
    }

    func testFindFirstLast() {
        let list = makeList("ABCABA")
        XCTAssertEqual(list.findFirst("A"), 0)
        XCTAssertEqual(list.findLast("A"), 5)
        XCTAssertEqual(list.findFirst("Q"), -1)
    }

    func testClearAndExtend() {
        let l1 = makeList("AB")
        let l2 = makeList("CD")
        l1.extend(l2)
        var out: [Character] = []
        l1.forEach { out.append($0) }
        XCTAssertEqual(out, ["A","B","C","D"])
        l1.clear()
        XCTAssertEqual(l1.length, 0)
    }
}