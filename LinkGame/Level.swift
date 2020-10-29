//
//  Level.swift
//  LinkGame
//
//  Created by chenwei on 2020/10/29.
//

import Foundation

let numColumns = 9
let numRows = 9

class Level {
  private var cookies = Array2D<Cookie>(columns: numColumns, rows: numRows)
    
    func cookie(atColumn column: Int, row: Int) -> Cookie? {
      return cookies[column, row]
    }
    
    func shuffle() -> Set<Cookie> {
      return createInitialCookies()
    }

    private func createInitialCookies() -> Set<Cookie> {
      var set: Set<Cookie> = []

      // 1
      for row in 0..<numRows {
        for column in 0..<numColumns {

          // 2
          let cookieType = CookieType.random()

          // 3
          let cookie = Cookie(column: column, row: row, cookieType: cookieType)
          cookies[column, row] = cookie

          // 4
          set.insert(cookie)
        }
      }
      return set
    }
}
