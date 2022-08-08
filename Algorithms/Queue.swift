class Queue<T> {
    var enQueue: [T] = []
    var deQueue: [T] = []

    var count: Int {
        return enQueue.count + deQueue.count
    }

    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }

    init() { }

    func push(_ element: T) {
        enQueue.append(element)
    }

    func pop() -> T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
}