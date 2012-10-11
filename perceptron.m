input = zeros(1, 11);
label = 0;
o = 0;
W = zeros(1, 11);
alpha = 1;

for i = 1:10000;
    t = rand(1,11) * pi/2;

    if t(1) < pi/4;
        input = sin(t);
        input(11) = -1;
        label = 0;
    else
        input = t;
        input(11) = -1;
        label = 1;
    end
    
    x = W*input';
    if x >= 0;
        o = 1;
    else
        o = 0;
    end
    label
    o
    
    W = W + (label - o)*input
end


for i = 1:100;
    t = rand(1,11) * pi/2;
    if t(1) < pi/4;
        input = sin(t);
        input(11) = -1;
        label = 0;
    else
        input = t;
        input(11) = -1;
        label = 1;
    end
    x = W*input';
    if x >= 0;
        o = 1;
    else
        o = 0;
    end
    if label == o;
        display('correct');
    else
        display('not correct');
    end
end