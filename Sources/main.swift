import CustomListCore

func printList<T>(_ list: CustomList<T>, label: String) {
    print("\(label)  (length = \(list.length)):")
    var elements = [T]()
    list.forEach { elements.append($0) }
    print(elements, "\n")
}

let list = CustomList<Character>()

print()

print("== Empty List Length ==")
print("Length of empty list is \(list.length)")
print()

print("== APPEND ==")
["A","B","C"].forEach { list.append($0) }
printList(list, label: "After append 3 elements")

print("== INSERT ==")
try! list.insert("X", at: 0)
try! list.insert("Y", at: 2)
try! list.insert("Q", at: list.length)
printList(list, label: "After inserts")

print("== GET / DELETE ==")
print("Element at index 3 ->", try! list.get(3))
print("Delete index 1  ->", try! list.delete(at: 1))
printList(list, label: "After delete")

print("== DELETE ALL ==")
list.deleteAll("C")
printList(list, label: "After deleteAll(\"C\")")

print("== FIND ==")
print("findFirst(\"A\") ->", list.findFirst("A"))
print("findLast(\"A\")  ->", list.findLast("A"))
print("findFirst(\"Q\") ->", list.findFirst("Q"))
print()

print("== CLONE & REVERSE ==")
let clone = list.clone()
printList(clone, label: "Cloned list")
clone.reverse()
printList(clone, label: "Clone reversed")
clone.reverse()
printList(clone, label: "Clone reversed again (original order)")