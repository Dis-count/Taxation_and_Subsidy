
IPC 调用  CP

(DP/DP1) / DP2 分别用了迭代和递归的方法

CP 分别调用 LP12(给出 分配) 和 DP1 (DP 用于给出 optimal value and solution)

再调用 LP9 给出 斜率值 K_l, K_r  传给 IPC

写一个 预处理方程  输入是  time for all players 输出是 sub-intervals
然后重复调用  IPC 给出各区间断点即可.

generatepic1 调用 players0  delete the last one element
即没有最后一行的限制 (所以用 players 可能还更快一点。)

generatediff  调用 players

player and players have no too much difference.
