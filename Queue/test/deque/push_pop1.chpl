use Queue;

var Q : deque(int) = new deque(int);
var x : int;

//push_front, then pop_front
Q.push_front(1);
x = Q.pop_front();
writeln(x);
writeln(Q.empty());

//push_back, then pop_back
Q.push_back(2);
x = Q.pop_back();
writeln(x);
writeln(Q.empty());

//push_front, then pop_back
Q.push_front(3);
x = Q.pop_back();
writeln(x);
writeln(Q.empty());

//push_back, then pop_front
Q.push_back(4);
x = Q.pop_front();
writeln(x);
writeln(Q.empty());
