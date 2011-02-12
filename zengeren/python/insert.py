import timeit
import random

class Test:
    def __init__(self,x,y):
	self.x=x
	self.y=y

def create_object_test():
    for var in range(0,1000000):
	Test(random.randint(0,640) , random.randint(0,480))

def insert_test():
    a = []
    for var in range(0,10000000):
	a.append(random.randint(0,100))


# insert_test()

# insert_test()
create_object_test()
