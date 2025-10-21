from math import exp, log10, cos



start_ = -11.0
step_ = 0.1
x = int(input())

if x < -9: print( exp(x) * log10(abs(x)) - 8)
elif x < -4: print(99 + exp(x))
elif -4 <= x < 2: print(pow(x, (0.1 * x)) + cos(2 * x))
elif 2 <= x: print(exp(x) - pow(x, (0.1 * x)))
else: print(0)

#######################################################################################################################
#######################################################################################################################
#######################################################################################################################

if x < -9:
    print('| {:5} | {:5} |'.format('X', 'Y'))
    while start_ <= -9:
        y = exp(start_) * log10(abs(start_)) - 8
        print('| {:5.1f} | {:5.1f} |'.format(start_, y))
        start_ += step_

elif x < -4:
    print('| {:5} | {:5} |'.format('X', 'Y'))
    while start_ <= -4:
        y = 99 + exp(start_)
        print('| {:5.1f} | {:5.1f} |'.format(start_, y))
        start_ += step_

elif -4 <= x < 2:
    print('| {:5} | {:5} |'.format('X', 'Y'))
    while start_ <= 2:
        y = pow(start_, 0.1 * start_) + cos(2 * start_)
        print('| {:5.1f} | {:5.1f} |'.format(start_, y))
        start_ += step_

elif 2 <= x:
    print('| {:5} | {:5} |'.format('X', 'Y'))
    while start_ <= 4.0:
        y = exp(start_) - pow(start_, 0.1 * start_)
        print('| {:5.1f} | {:5.1f} |'.format(start_, y))
        start_ += step_