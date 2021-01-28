import UIKit

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
	
	let item = Array.init(repeating: 0, count: obstacleGrid[0].count+1)
	var dp = Array.init(repeating: item, count: obstacleGrid.count+1)
	dp[0][1] = 1
	
	for i in 1...obstacleGrid.count{
		for j in 1...obstacleGrid[0].count{
			if obstacleGrid[i-1][j-1] == 1 {
				continue
			}
			dp[i][j]=dp[i][j-1] + dp[i-1][j]
		}
	}
	return dp[obstacleGrid.count][obstacleGrid[0].count];
}
let arr = [[0,0,0],
		   [0,1,0],
		   [0,0,0]]
func uniquePaths(_ m: Int, _ n: Int) -> Int {
	let item = Array.init(repeating: 0, count: m+1)
	var dp = Array.init(repeating: item, count: n+1)
	dp[0][1] = 1//默认是一条路
	for i in 1...n{
		for j in 1...m{
			dp[i][j]=dp[i][j-1] + dp[i-1][j]//路径的总和等于 左边和上边的和
		}
	}
	return dp[n][m];
}
//64
func minPathSum(_ grid: [[Int]]) -> Int {
	let subArray = Array(repeating: 0, count: grid[0].count + 1)
	var array = Array(repeating: subArray, count: grid.count + 1)
	
	for i in 1...grid.count{
		for j in 1...grid[0].count{
			if i == 1 && j == 1 {
				array[i][j] = grid[i-1][j-1]
			}else if j == 1{
				array[i][j] = array[i-1][j]+grid[i-1][j-1]
			}else if i == 1{
				array[i][j] = array[i][j-1]+grid[i-1][j-1]
			}else{
				array[i][j] = min(array[i-1][j], array[i][j-1])+grid[i-1][j-1]
			}
		}
	}
	return array[grid.count][grid[0].count]
}


let p = minPathSum([
  [1,3,1],
  [1,5,1]
])
print(p)


