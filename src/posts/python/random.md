---
title: "random"
---
# 1. random.shuffle
> shuffle() 方法将序列的所有元素随机排序。

```
import random

list = [20, 16, 10, 5]
random.shuffle(list)
print "随机排序列表 : ",  list
```

# 2. random.sample
```
buffer = collections.deque(maxlen=10)
# ....插入10条数据
batch_size = 3
transitions = random.sample(buffer, batch_size)
# 从buffer随机抽取batch_size条数据，并存放在一个列表中返回
# 在这个例中中，抽取是随机的，并不是按照队列先进先出的性质
```