---
title: "python函数"
---
# 1. reversed() 
得到列表索引，且反转序列
```
def compute_return(start_index, chain, gamma):
    G = 0
    for i in reversed(range(start_index, len(chain))):
        G = rewards[chain[i] - 1] + gamma * G
    return G
```

# 2. range()
```
# range(start, stop[, step])
# start: 计数从 start 开始。默认是从 0 开始。例如range（5）等价于range（0， 5）;
# stop: 计数到 stop 结束，但不包括 stop。例如：range（0， 5） 是[0, 1, 2, 3, 4]没有5
# step：步长，默认为1。例如：range（0， 5） 等价于 range(0, 5, 1)
>>> range(0, 30, 5)  # 步长为 5
[0, 5, 10, 15, 20, 25]
```
# 3. list()
返回列表
```
print(type(range(5))) # <class, range>
print(type(list(range(5)))) # <class, list>
```
# 4. yield关键字
yield关键词和return的区别就是他返回结果但是不中止程序，当下次重新调用函数时，会从上次yield终止的地方继续执行函数


# 5. with关键字
Python 中的 with 语句用于异常处理，封装了 try…except…finally 编码范式，提高了易用性。
with 语句使代码更清晰、更具可读性， 它简化了文件流等公共资源的管理。
> 访问文件

```
with open('./test_runoob.txt', 'w') as file:
    file.write('hello world !')
# 使用 with 关键字系统会自动调用 f.close() 方法， with 的作用等效于 try/finally 语句是一样的。
```

