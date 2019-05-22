//
//  ArrayExtensiongs.swift
//  Swift Algorithm
//
//  Created by Jovins on 2019/3/27.
//  Copyright © 2019年 Jovins. All rights reserved.
//

import UIKit

/*
 新闻聚合阅读器(RSS Reader)。因为新闻内容经常会更新，所以每次下拉刷新这个UITableView或是点击右上角刷新按钮，
 经常会有新的内容加入到原来的dataSource中。刷新后合理插入新闻，就要运用到搜索和排列。
 let insertIdx = news.indexForInsertingObject(object: singleNews) { (a, b) -> Int in
 let newsA = a as! News
 let newsB = b as! News
 return newsA.compareDate(newsB)
 }
 news.insert(singleNews, at: insertIdx)
 */
extension Array {
    
    func indexForInsertingObject(object: AnyObject, compare: ((_ a: AnyObject, _ b: AnyObject) -> Int)) -> Int {
        
        var left = 0, right = self.count, mid = 0
        while left < right {
         
            mid = (right - left) / 2 + left
            if compare(self[mid] as AnyObject, object) < 0 {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
}
