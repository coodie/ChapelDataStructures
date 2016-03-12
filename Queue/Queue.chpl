module Queue
{
    class deque_node
    {
        type elType;
        
        var data: elType;
        var next: deque_node(elType);
        var prev: deque_node(elType);
    }

    record deque
    {
        type elType;
        var first : deque_node(elType);
        var last : deque_node(elType);
        var length : int;

        iter these()
        {
            var tmp = first;
            while tmp != nil 
            {
                yield tmp.data;
                tmp = tmp.next;
            }
        }

        iter it()
        {
            var tmp = first;
            while tmp != nil 
            {
                yield tmp.data;
                tmp = tmp.next;
            }
        }

        iter rev_it()
        {
            var tmp = last;
            while tmp != nil 
            {
                yield tmp.data;
                tmp = tmp.prev;
            }
        }

        proc push_front(e : elType)
        {
            var node = new deque_node(elType, e);
            if first == nil
            {
                first = node;
                last = node;
            }
            else
            {
                node.next = first;
                first.prev = node;
                first = node;
            }
            length += 1;
        }

        proc push_back(e : elType) : void
        {
            var node = new deque_node(elType, e);
            if last == nil
            {
                first = node;
                last = node;
            }
            else
            {
                last.next = node;
                node.prev = last;
                last = node;
            }
            length += 1;
        }

        proc pop_front() : elType
        {
            if first == nil then 
                halt("pop_front on empty deque");
            var result : elType = first.data;
            if first.next == nil then
            {
                delete first;
                first = nil;
                last = nil;
            }
            else
            {
                var old_first = first;
                var new_first = first.next;
                new_first.prev = nil;
                first = new_first;
                delete old_first;
            }
            length -= 1;
            return result;
        }

        proc pop_back() : elType
        {
            if last == nil then 
                halt("pop_back on empty deque");
            var result : elType = first.data;
            if last.prev == nil then
            {
                delete last;
                first = nil;
                last = nil;
            }
            else
            {
                var old_last = last;
                var new_last = last.prev;
                new_last.next = nil;
                //if last.prev == old_first then
                    //last = new_first;
                last = new_last;
                delete old_last;
            }
            length -= 1;
            return result;
        }

        proc front() : elType
        {
            if first == nil
                halt ("trying to access empty queue");
            return first.data;
        }

        proc back() : elType
        {
            if last == nil
                halt ("trying to access empty queue");
            return last.data;
        }

        proc erase() : void
        {
            var it : deque_node(elType) = first;
            while(it != nil)
            {
                var tmp = it;
                it = it.next;
                delete tmp;
            }
            first = nil;
            last = nil;
            length = 0;
        }

        proc remove(x : elType) : void
        {
            var it = first;
            while(it != nil)
            {
                if it.data == x then
                {
                    remove_node(it);
                    return;
                }
                it = it.next;
            }
            
        }

        proc empty() : bool
        {
            return first == nil;
        }

        proc ~deque()
        {
            erase();
        }

        //these methods shouldn't be used by client of class
        //but lazy chapel devs didn't implement
        //private class members yet

        proc remove_node(node : deque_node(elType))
        {
            if node == first then
                first = first.next;
            if node == last then
                last = last.prev;

            if node.next != nil then
            {
                node.next.prev = node.prev;
            }
            if node.prev != nil then
            {
                node.prev.next = node.next;
            }
            delete node;
        }

        proc print()
        {
            //writeln("first: ", first);
            //writeln("last: ", last);
            //writeln("last == first: ", last == first);
            var node = first;
            while node != nil
            {
                writeln(node.data);
                node = node.next;
            }
        }

        proc print_rev()
        {
            var node = last;
            while node != nil
            {
                writeln(node.data);
                node = node.prev;
            }
        }

        proc ptr_check()
        {
            var node = first;
            while node != nil
            {
                if(node.next != nil)
                {
                    writeln(node.next.prev == node);
                }
                if(node.prev != nil)
                {
                    writeln(node.prev.next == node);
                }
                node = node.next;
            }
        }
    }
}
