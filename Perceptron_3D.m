input = zeros(1, 4);
label = 0;
o = 0;
W = [0, 0, 0, 0];

for i = 1:1000;
    t = rand(1,2) * pi/2;
    
    if t(1) < pi/4;
        input(1) = t(1);
        input(2) = t(2);
        input(3) = sin(t(1) + t(2));
        input(4) = -1;
        label = 0;
        plot3(input(1), input(2), input(3), 'ro');
        hold on;
    else
        input(1) = t(1);
        input(2) = t(2);
        input(3) = t(1) + t(2);
        input(4) = -1;
        label = 1;
        plot3(input(1), input(2), input(3), 'go');
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


x = [-1:0.1:1];
y = [-1:0.1:1];
z = ((-1)*W(1)*x + (-1)*W(2)*y + W(4))/W(3);
plot3(x,y,z);

x = [-1:0.1:1];
y = [0:0.1:2];
z = ((-1)*W(1)*x + (-1)*W(2)*y + W(4))/W(3);
plot3(x,y,z);

y = [-1:0.1:1];
x = [0:0.1:2];
z = ((-1)*W(1)*x + (-1)*W(2)*y + W(4))/W(3);
plot3(x,y,z);

%[x,y] = meshgrid(-1:.1:0.5, -1:.1:0.5);

%mesh(z)


for i = 1:100;
    t = rand(1,2) * pi/2;
    
    if t(1) < pi/4;
        input(1) = t(1);
        input(2) = t(2);
        input(3) = sin(t(1) + t(2));
        input(4) = -1;
        label = 0;
    else
        input(1) = t(1);
        input(2) = t(2);
        input(3) = t(1) + t(2);
        input(4) = -1;
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


% W
% x1 = [0:0.1:2];
% 
% plot(x1, ((-1)*W(1)*x1 + W(3))/W(2));
% display('zzzzzzzzzzzz');
