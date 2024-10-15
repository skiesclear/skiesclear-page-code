# 1. 分类问题的表示方法
独热编码
$$
\begin{align}
\mathbf{y}=[y_1,y_2,...,y_n]^T\\
y_i=
\begin{cases}
1 &if\quad i=y\\
0 &otherwise
\end{cases}
\end{align}$$
# 2. softmax函数介绍
softmax函数能够将未规范化的预测变换为非负数并且总和为1，同时让模型保持 可导的性质。
$$\hat{\mathbf{y}} = \mathrm{softmax}(\mathbf{o})\quad \text{其中}\quad \hat{y}_j = \frac{\exp(o_j)}{\sum_k \exp(o_k)}$$
尽管softmax是一个非线性函数，但softmax回归的输出仍然由输入特征的仿射变换决定。 因此，softmax回归是一个线性模型（linear model）。

# 3. 小批量样本的矢量化
假设读取了一个批量样本$\mathbf{X}$，其中特征维度（输入数量）为d，批量大小为n。假设输出中有q个类别。那么小批量样本的特征为$\mathbf{X} \in \mathbb{R}^{n \times d}$，权重为$\mathbf{W} \in \mathbb{R}^{d \times q}$，偏置为$\mathbf{b} \in \mathbb{R}^{1\times q}$。softmax回归的矢量计算表达式为：
$$\begin{split}\begin{aligned} \mathbf{O} &= \mathbf{X} \mathbf{W} + \mathbf{b}, \\ \hat{\mathbf{Y}} & = \mathrm{softmax}(\mathbf{O}). \end{aligned}\end{split}$$

# 4. 损失函数
1、L2 Loss
$$l(y,y^{\prime})=\frac{1}{2}(y-y^{\prime})^2$$
![[Pasted image 20241014150651.png|400]]

2、L1 Loss
$$l(y,y^{\prime})=\lvert y-y^{\prime}\rvert$$
![[Pasted image 20241014150936.png|400]]
3、Huber's Robust Loss
$$l(y,y^{\prime})=
\begin{cases}
\lvert y-y^{\prime}\rvert - \frac{1}{2} & if\quad \lvert y-y^{\prime}\rvert >1 \\
\frac{1}{2}(y-y^{\prime})^2 & otherwise
\end{cases}$$
![[Pasted image 20241014151523.png|400]]
