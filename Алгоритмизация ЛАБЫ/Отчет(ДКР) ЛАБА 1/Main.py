from math import exp, log10, cos



start_ = -11.0
step_ = 0.1

def task1(num:int)->float:

    if num < -9: return exp(num) * log10(num) - 8
    elif num < -4: return 99 + exp(num)
    elif -4 <= num < 2: return pow(num, (0.1 * num)) + cos(2 * num)
    elif 2 <= num: return exp(num) - pow(num, (0.1 * num))
    else: return 0

def sup_proc_1():

    global start_, step_
    start_temp = start_
    print('| {:5} | {:5} |'.format('X', 'Y'))
    while start_temp <= -9:
        y = exp(start_temp) * log10(abs(start_temp)) - 8
        print('| {:5.1f} | {:5.1f} |'.format(start_temp, y))
        start_temp += step_

def sup_proc_2():

    global start_, step_
    start_temp = start_
    print('| {:5} | {:5} |'.format('X', 'Y'))
    while start_temp <= -4:
        y = 99 + exp(start_temp)
        print('| {:5.1f} | {:5.1f} |'.format(start_temp, y))
        start_temp += step_

def sup_proc_3():

    global start_, step_
    start_temp = start_
    print('| {:5} | {:5} |'.format('X', 'Y'))
    while start_temp <= 2:
        y = pow(start_temp, 0.1 * start_temp) + cos(2 * start_temp)
        print('| {:5.1f} | {:5.1f} |'.format(start_temp, y))
        start_temp += step_

def sup_proc_4():

    global start_, step_
    start_temp = start_
    print('| {:5} | {:5} |'.format('X', 'Y'))
    while start_temp <= 4.0:
        y = exp(start_temp) - pow(start_temp, 0.1 * start_temp)
        print('| {:5.1f} | {:5.1f} |'.format(start_temp, y))
        start_temp += step_


def task2(num_of_func):

    if num_of_func == 1:
        sup_proc_1()
    elif num_of_func == 2:
        sup_proc_2()
    elif num_of_func == 3:
        sup_proc_3()
    elif num_of_func == 4:
        sup_proc_4()

print(task1(int(input())))
print(task2(int(input())))