//: Playground - noun: a place where people can play

import UIKit

var a :Set = [1,2,3,4]
let b :Set = [3,4,5,6]
a.sorted()//转化为数组
a.intersection(b)//交集
a.formSymmetricDifference(b)//补集
a.union(b)//并集
a.subtract(b)//差集


let c :Set = [1,2,3,4]
let d :Set = [1,2]
d.isSubset(of: c)//子集
d.isStrictSubset(of: c)//严格子集
c.isSuperset(of: d)//父集
c.isStrictSuperset(of: d)//严格父集
c.isDisjoint(with: d)//无交集



