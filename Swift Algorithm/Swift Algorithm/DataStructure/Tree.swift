//
//  TreeNode.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/3/21.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

// https://www.cnblogs.com/ludashi/p/5976682.html
// 树节点
public class TreeNode {
    
    public var val: String
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: String) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

public class Tree {
    
    var values: [String]
    var index: Int = -1

    init(_ values: [String]) {
        self.values = values
    }
    
    func createTreeNode() -> TreeNode? {
        
        self.index += 1
        if self.index < self.values.count && self.index >= 0 {
            let value = self.values[self.index]
            if value == "" {
                 return nil
            } else {
                let rootNode = TreeNode(value)
                rootNode.left = createTreeNode()
                rootNode.right = createTreeNode()
                return rootNode
            }
        }
        return nil
    }
    
    // 请设计一个可以展示一颗s二叉树的App
    /*
    所以是不是在View的界面上，每个节点弄个UILabel来表示，然后用数学方法计算每个UIlabel对应的位置，从而完美的显示上图的样子？
    这个想法比较简单粗暴，是最容易想到，实现之后又是最直观展示一棵二叉树的，但是它有以下两个问题：
    每个UILabel的位置计算起来比较麻烦；
    如果一棵树有很多节点（比如1000个），那么当前界面就会显示不下了，这时候咋办？就算用UIScrollView来处理，整个树也会变得非常不直观，每个节点所对应的UILabel位置计算起来就会更费力。
    要处理大量数据，我们就想到了UITableView。假如每一个cell对应一个节点，以及其左、右节点，那么我们就可以清晰的展示一棵树。比如上图这棵树，用UITableView就可以写成这样：
     其中"#"表示空节点。明眼人可以看出，我们是按照层级遍历的方式布局整个UITableView。这种做法解决了上面两个问题：
     
    1. 无需进行位置计算，UITableView提供复用Cell，效率大幅提高
    2. 面对很多节点的问题，可以先处理一部分数据，然后用处理infinite scroll的方式来加载剩余数据
    */
    func levelToOrder(_ root: TreeNode?) -> [[String]] {
        
        var res = [[String]]()
        // 用数组来实现队列
        var queue = [TreeNode]()
        
        if let root = root {
            queue.append(root)
        }
        
        while queue.count > 0 {
            
            let size = queue.count
            var level = [String]()
            for _ in 0 ..< size {
                let node = queue.removeFirst()
                
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(level)
        }
        return res
    }
    
    // 先序遍历: 先遍历根节点然后再遍历左子树，最后遍历右子树。
    func preOrderTraverse(_ node: TreeNode?){
        
        guard let node = node else {
            print("", terminator: "")
            return
        }
        print("\(node.val) ", terminator: "")
        preOrderTraverse(node.left)
        preOrderTraverse(node.right)
    }
    
    // 中序遍历: 先遍历左子树，然后遍历根节点，最后遍历右子树。
    func inOrderTraverse (_ node: TreeNode?) {
        guard let node = node else {
            print("", terminator: "")
            return
        }
        inOrderTraverse(node.left)
        print("\(node.val) ", terminator: "")
        inOrderTraverse(node.right)
    }
    
    // 后序遍历: 后序遍历是先遍历左子树，然后再遍历右子树，最后遍历根节点
    func afterOrderTraverse (_ node: TreeNode?) {
        guard let node = node else {
            print("", terminator: "")
            return
        }
        afterOrderTraverse(node.left)
        afterOrderTraverse(node.right)
        print("\(node.val) ", terminator: "")
    }
    
    //层次遍历: 层次遍历相对上面的几个遍历实现起来要稍微复杂，层次遍历就是图中以二叉树的根节点为起始节点的广度搜索（BFS）
    func levelOrder(_ root: TreeNode?){
        
        var result = [[TreeNode]]()
        var level = [TreeNode]()
        if let root = root {
            level.append(root)
        }
        while level.count != 0 {
            result.append(level)
            var nextLevel = [TreeNode]()
            for node in level {
                if let leftNode = node.left {
                    nextLevel.append(leftNode)
                }
                if let rightNode = node.right {
                    nextLevel.append(rightNode)
                }
            }
            level = nextLevel
        }
        
        let res = result.map { $0.map { $0.val }}
        print("\(res) ", terminator: "")
    }
    
    // 除了用递归方式遍历，可以用栈实现
    func stackToTraversal(_ rootNode: TreeNode?) -> [String] {
        
        var result = [String]()
        var stack = [TreeNode]()
        var node = rootNode
        while !stack.isEmpty || node != nil {
            if node != nil {
                result.append(node!.val)
                stack.append(node!)
                node = node!.left
            } else {
                node = stack.removeLast().right
            }
        }
        return result
    }
    
    // 给定二叉树[3,9,20,null,null,15,7]
    // 分别求左右节点最大深度，左右节点又分别求左右节点的最大深度，递归解决
    /*
         3
     9       20
     15   7
     */
    func maxDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else {
            return 0
        }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}
