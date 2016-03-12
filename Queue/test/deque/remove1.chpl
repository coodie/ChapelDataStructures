use Queue;

var Q : deque(int);

Q.push_back(1);
Q.push_back(2);
Q.push_back(3);
Q.push_back(4);
Q.push_back(5);

Q.remove(1);
Q.remove(5);

for x in Q do
    writeln(x);

