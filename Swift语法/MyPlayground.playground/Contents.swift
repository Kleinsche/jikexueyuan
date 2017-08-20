import Cocoa
/*
//let s:String = "Hello/World"
//let sb:NSString=s
//let startIndex=s.startIndex
//var subString=s.substringWithRange(startIndex.advancedBy(3)...startIndex.advancedBy(5))
//var bb=sb.substringWithRange(NSRange(location: 3, length: 2))

//let re = s.characters.split("/")
//for i in re{
//print(String(i))
//}

//let re2=sb.characterAtIndex(4)
//print()
*/




/*
var sampleString:NSString = "abcd.ef.gh.ijklm"

var array:[NSString] = []

//var samp = sampleString.containsString(".")
while sampleString.containsString("."){
    
    let range = sampleString.rangeOfString(".")
    let element = sampleString.substringToIndex(range.location)
    array.append(element)
    
    sampleString = sampleString.substringFromIndex(range.length + range.location)
}
array.append(sampleString)
*/

/*
 //let s="Hello Swift"
 //let s1=s+",java"
 //let s2="\(s1) \(10)"
 //print(s2)
 
 var dic = ["name":"jikexueyuan","age":2,1:100]
 //dic.removeAtIndex(dic.startIndex)
 dic["language"]="Java"
 print(dic)
 */

let a :Set = [1,2,3,4]
let b :Set = [3,4,5,6]
a.sorted()//转化为数组
//a.intersection(b)//交集

//let date = Date()
//let format = DateFormatter()
//format.dateFormat = "y-M-d H:m:s"
////format.dateStyle = .full
////format.timeStyle = .full
//let dateString = format.string(from: date)
//print(dateString)

var dic = ["name":"hello"]
print(dic["name"]!)

