use Random;

config const max_task : int = 100;

var cur_task : atomic int;
cur_task.write(0);

proc merge(A, B, C) : void
{
    var i : int = A.domain.dim(1).low, j : int = B.domain.dim(1).low, k = C.domain.dim(1).low;
    var endA : int = A.domain.dim(1).high, endB : int = C.domain.dim(1).high;

    while(i <= endA && j <= endB)do
    {
        if(A[i] < B[j])then
        {
            C[k] = A[i];
            i += 1;
        }
        else
        {
            C[k] = B[j];
            j += 1;
        }
        k += 1;
    }
    while(i <= endA)
    {
        C[k] = A[i];
        i += 1;
        k += 1;
    }
    while(j <= endB)
    {
        C[k] = B[j];
        j += 1;
        k += 1;
    }
}

proc mergeSort(A)
{
    //writeln(cur_task.read());
    if(A.size <= 1) then
        return;
    var l : int  = A.domain.dim(1).low;
    var r : int  = A.domain.dim(1).high;

    var half : int = (l+r)/2;
    var L = A[l..half];
    var R = A[half+1..r];

    if(cur_task.read() < max_task) then
    {
        cur_task.add(1);
        sync cobegin 
        {   
            mergeSort(L);
            mergeSort(R);
        }
        cur_task.sub(1);
    }
    else
    {
        mergeSort(L);
        mergeSort(R);
    }
    merge(L, R, A);
}

