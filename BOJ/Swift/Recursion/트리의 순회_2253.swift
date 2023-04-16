import Foundation


let n = Int(readLine()!)!
let inorderArr = [0] + readLine()!.split(separator: " ").map{Int($0)!}
let postorderArr = [0] + readLine()!.split(separator: " ").map{Int($0)!}

func getPreorderList(inorder: [Int], postorder: [Int]) {

    if inorder[0] > inorder[1] || postorder[0] > postorder[1]{
        return
    }
    
    let rootNode = postorderArr[postorder[1]]
    var newRootNodeIdx = 0
    var inorderCount = 0
    
    print(rootNode, terminator: " ")
    
    for i in inorder[0]...inorder[1] {
        if inorderArr[i] == rootNode {
            newRootNodeIdx = i
            break
        }
        inorderCount += 1
    }
    
    getPreorderList(inorder: [inorder[0], newRootNodeIdx-1], postorder: [postorder[0], postorder[0]+inorderCount-1])
    getPreorderList(inorder: [newRootNodeIdx+1, inorder[1]], postorder: [postorder[0]+inorderCount, postorder[1]-1])
    
    
}

getPreorderList(inorder: [1, n], postorder: [1, n])
