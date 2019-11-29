import UIKit

func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
	
//	if obstacleGrid.count == 1 {
//		return 1;
//	}else if obstacleGrid.count > 1{
//		if obstacleGrid[0].count == 1{
//			return 1;
//		}else if obstacleGrid[0].count < 1{
//			return 0;
//		}else{
//
//		}
//	}else {
//		return 0;
//	}
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
let p = uniquePaths(2,3)
print(p)


