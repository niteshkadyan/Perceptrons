input = zeros(1, 3);
label = 0;
o = 0;
W = [0, 0, 0];

for i = 1:2000;
    t = rand * pi/2;
    
    if t < pi/4;
        input(1) = t;
        input(2) = sin(t);
        input(3) = -1;
        label = 0;
        plot(input(1), input(2), 'ro');
        hold on;
    else
        input(1) = t;
        input(2) = t;
        input(3) = -1;
        label = 1;
        plot(input(1), input(2), 'go');
        hold on;
    end
      
    
    alpha = W*input';   
    if alpha >= 0;
        o = 1;
    else
        o = 0;
    end
    input;
    alpha;
    label;
    o;
    
    W = W + (label - o)*input
    
end
W
x1 = [0:0.1:2];

plot(x1, ((-1)*W(1)*x1 + W(3))/W(2));



for i = 1:100;
    t = rand * pi/2;
    
    if t < pi/4;
        input(1) = t;
        input(2) = sin(t);
        input(3) = -1;
        label = 0;
    else
        input(1) = t;
        input(2) = t;
        input(3) = -1;
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

display('zzzzzzzzzzzz');
