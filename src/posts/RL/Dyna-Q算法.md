---
title: "Dyna-Q算法"
---
---
title: Dyna-Q算法
---
---
title: Dyna-Q算法
---
# 1. 简介
“模型”通常指与智能体交互的环境模型，即对环境的状态转移概率和奖励函数进行建模。
根据是否具有环境模型，强化学习算法分两种：
- 无模型的强化学习
	- Sarsa
	- Q-learning
- 基于模型的强化学习
	- 策略迭代
	- 价值迭代
	- Dyna-Q（环境模型自己采样得到）

强化学习算法的两个重要的评价指标：
- 算法收敛后的策略在初始状态下的期望回报
- 算法达到收敛结果需要在真实环境中采样的样本数量

# 2. Dyna-Q 算法的具体流程：
![[Pasted image 20241001154226.png|500]]
# 3. python实现：
```
class DynaQ:
    """ Dyna-Q算法 """
    def __init__(self,
                 ncol,
                 nrow,
                 epsilon,
                 alpha,
                 gamma,
                 n_planning,
                 n_action=4):
        self.Q_table = np.zeros([nrow * ncol, n_action])  # 初始化Q(s,a)表格
        self.n_action = n_action  # 动作个数
        self.alpha = alpha  # 学习率
        self.gamma = gamma  # 折扣因子
        self.epsilon = epsilon  # epsilon-贪婪策略中的参数

        self.n_planning = n_planning  #执行Q-planning的次数, 对应1次Q-learning
        self.model = dict()  # 环境模型

    def take_action(self, state):  # 选取下一步的操作
        if np.random.random() < self.epsilon:
            action = np.random.randint(self.n_action)
        else:
            action = np.argmax(self.Q_table[state])
        return action

    def q_learning(self, s0, a0, r, s1):
        td_error = r + self.gamma * self.Q_table[s1].max(
        ) - self.Q_table[s0, a0]
        self.Q_table[s0, a0] += self.alpha * td_error

    def update(self, s0, a0, r, s1):
        self.q_learning(s0, a0, r, s1)
        self.model[(s0, a0)] = r, s1  # 将数据添加到模型中
        for _ in range(self.n_planning):  # Q-planning循环
            # 随机选择曾经遇到过的状态动作对
            (s, a), (r, s_) = random.choice(list(self.model.items()))
            self.q_learning(s, a, r, s_)
```

# 4. 总结
悬崖漫步环境中，状态的转移是完全确定性的，构建的环境模型的精度是最高的，所以可以通过增加 Q-planning 步数来直接降低算法的样本复杂度。
如果环境比较复杂，状态是连续的，或者状态转移是随机的而不是决定性的，如何学习一个比较准确的模型就变成非常重大的挑战，这直接影响到基于模型的强化学习算法能否应用于这些环境并获得比无模型的强化学习更好的效果。