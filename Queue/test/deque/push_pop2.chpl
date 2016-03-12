use Queue;

var Q : deque(int) = new deque(int);

Q.push_back(1);
Q.push_back(2);
Q.push_back(3);
Q.push_back(4);

Q.push_front(5);
Q.push_front(6);
Q.push_front(7);
Q.push_front(8);

for x in Q do
    writeln(x);

Q.erase();

Q.push_back(1);
Q.push_back(2);
Q.push_back(3);

while(!Q.empty())
{
    writeln(Q.pop_front());
}
