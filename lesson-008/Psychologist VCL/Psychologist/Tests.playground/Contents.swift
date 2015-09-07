//: Playground - noun: a place where people can play

var _globalCounter = 0


let instanceCount_1 = { return _globalCounter++ }()
let instanceCount_2 = { return _globalCounter++ }

instanceCount_2()
print(instanceCount_1)

_globalCounter
