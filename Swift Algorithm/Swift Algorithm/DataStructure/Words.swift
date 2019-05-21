//
//  Words.swift
//  Swift Algorithm
//
//  Created by 黄进文 on 2019/3/27.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

/*
 实现一个找单词App: 给定一个初始的字母矩阵，你可以从任一字母开始，上下左右，任意方向、任意长度，选出其中所有单词。
 */
public class Words: UIViewController {
    
    /*
     第一步：实现字母矩阵
     首先，我们肯定有个字符二阶矩阵作为输入，姑且记做：matrix: [[Character]]。现在要把它展现在手机上，
     那么可行的方法，就是创建一个UILabel二维矩阵，记做labels: [[UILabel]]，矩阵中每一个UILabel对应
     的内容就是相应的字母。同时，我们可以维护2个全局变量，xOffset和yOffset。然后在for循环中创建相应的
     UILabel同时将其添加进lables中便于以后使用，代码如下：
     */
    func createMatrix(_ matrix: [[Character]]) {
        
        var labels = [[UILabel]]()
        var xOffset = 0
        var yOffset = 0
        let cellWidth = Int(UIScreen.main.bounds.size.width) / matrix[0].count
        let cellHeight = Int(UIScreen.main.bounds.size.height) / matrix.count
        
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[0].count {
                let label = UILabel(frame: CGRect(x: xOffset, y: yOffset, width: cellWidth, height: cellHeight))
                label.text = String(matrix[i][j])
                view.addSubview(label)
                labels.append([label])
                xOffset += cellWidth
            }
            xOffset = 0
            yOffset += cellHeight
        }
    }
    
    /*
     第二步：用DFS实现搜索单词
     现在要实现搜索单词的核心算法了。我们先简化要求，假如只在字母矩阵中搜索单词"crowd"该怎么做？
     首先我们要找到 "c" 这个字母所在的位置，然后再上下左右找第二个字母 "r" ，接着再找字母 "o" 。。。以此类推，直到找到最后一个字母 "d" 。如果没有找到相应的字母，我们就回头去首字母 "c" 所在的另一个位置，重新搜索。
     这里要注意一个细节，就是我们不能回头搜索字母。比如我们已经从 "c" 开始向上走搜索到了 "r" ，这个时候就不能从 "r" 向下回头 -- 因为 "c" 已经访问过了。所以这里需要一个var visited: [[Bool]] 来记录访问记录。代码如下：
     */
    func searchWord(_ board: [[Character]]) -> Bool {
        guard board.count > 0 && board[0].count > 0 else {
            return false
        }
        
        let (m, n) = (board.count, board[0].count)
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var wordContent = [Character]("crowd".characters)
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                if dfs(board, wordContent, m, n, i, j, &visited, 0) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func dfs(_ board: [[Character]], _ wordContent: [Character], _ m: Int, _ n: Int, _ i: Int, _ j: Int, _ visited: inout [[Bool]], _ index: Int) -> Bool {
        if index == wordContent.count {
            return true
        }
        
        guard i >= 0 && i < m && j >= 0 && j < n else {
            return false
        }
        guard !visited[i][j] && board[i][j] == wordContent[index] else {
            return false
        }
        
        visited[i][j] = true
        
        if dfs(board, wordContent, m, n, i + 1, j, &visited, index + 1) || dfs(board, wordContent, m, n, i - 1, j, &visited, index + 1) || dfs(board, wordContent, m, n, i, j + 1, &visited, index + 1) || dfs(board, wordContent, m, n, i, j - 1, &visited, index + 1) {
            return true
        }
        
        visited[i][j] = false
        return false
    }
    /*
     第三步：优化算法，进阶
     好了现在我们已经知道了怎么搜索一个单词了，那么多个单词怎么搜索？首先题目是要求找出所有的单词，那么肯定事先有个字典，根据这个字典，我们可以知道所选字母是不是可以构成一个单词。所以题目就变成了：
     
     已知一个字母构成的二维矩阵，并给定一个字典。选出二维矩阵中所有横向或者纵向的单词。
     */
    /*
    func findWords(_ board: [[Character]], _ dict: Set<String>) -> [String] {
        var res = [String]()
        
        let (m, n) = (board.count, board[0].count)
        
        let trie = _convertSetToTrie(dict)
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                _dfs(board, m, n, i, j, &visited, &res, trie, "")
            }
        }
        
        return res
    }
    
    private func _dfs(_ board: [[Character]], _ m: Int, _ n: Int, _ i: Int, _ j: Int, _ visited: inout [[Bool]], _ res: inout [String], _ trie: Trie, _ str: String) {
        // 越界
        guard i >= 0 && i < m && j >= 0 && j < n else {
            return
        }
        
        // 已经访问过了
        guard !visited[i][j] else {
            return
        }
        
        // 搜索目前字母组合是否是单词前缀
        var str = str + "\(board[i][j])"
        guard trie.prefixWith(str) else {
            return
        }
        
        // 确认当前字母组合是否为单词
        if trie.isWord(str) && !res.contains(str) {
            res.append(str)
        }
        
        // 继续搜索上下左右四个方向
        visited[i][j] = true
        _dfs(board, m, n, i + 1, j, &visited, &res, trie, str)
        _dfs(board, m, n, i - 1, j, &visited, &res, trie, str)
        _dfs(board, m, n, i, j + 1, &visited, &res, trie, str)
        _dfs(board, m, n, i, j - 1, &visited, &res, trie, str)
        visited[i][j] = true
    }
    */
}
