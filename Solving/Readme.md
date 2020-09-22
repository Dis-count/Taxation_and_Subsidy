
IPC 调用  CP

CP 分别调用 LP12(给出 分配) 和 DP1 (DP 用于给出 optimal value and solution)

再调用 LP9 给出 斜率值 K_l, K_r  传给 IPC

写一个 预处理方程  输入是  time for all players 输出是 sub-intervals
然后重复调用  IPC 给出各区间断点即可.
