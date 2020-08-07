clear;
clc
N = 100000;
ITR = 1000;

dt1 = zeros(1, ITR);
dt2 = zeros(1, ITR);
ratio = zeros(1, ITR);

for k = 1 : ITR
    clear a;
    a(1) = 1;
    a(2) = 2;
    t = cputime;        % tic
    for i = 3 : N
        a(i) = 0.9*a(i - 1) - 0.3*a(i - 2);
    end
    dt1(k) = cputime - t;   % toc
    
    b = zeros(1,N);
    b(1) = 1;
    b(2) = 2;
    t = cputime;        % tic
    for i = 3 : N
        b(i) = 0.9*b(i - 1)-0.3*b(i - 2);
    end
    dt2(k) = cputime - t;   % toc
    ratio(k) = dt1/dt2;
end

ratio_mn = mean(ratio)
ratio_std = std(ratio)

dt1_mn = mean(dt1)
dt1_std = std(dt1)

dt2_mn = mean(dt2)
dt1_std = std(dt2)

% norm(a - b)