% A test script for comparing code speed with and without memory preallocation
clear;
clc

N = 1000000; % The vector lengths
ITR = 1000; % The number of runs

dt1 = zeros(1, ITR); % Holds the execution time of each run (without preallocation)
dt2 = zeros(1, ITR); % Holds the execution time of each run (with preallocation)
ratio = zeros(1, ITR); % % Holds the execution time ratio

for k = 1 : ITR
    % Without preallocation
    clear a;
    a(1) = 1;
    a(2) = 2;
    t = cputime;    % tic
    for i = 3 : N
        a(i) = 0.9*a(i - 1) - 0.3*a(i - 2);
    end
    dt1(k) = cputime - t;   % toc
    
    % With preallocation
    b = zeros(1,N);
    b(1) = 1;
    b(2) = 2;
    t = cputime;    % tic
    for i = 3 : N
        b(i) = 0.9*b(i - 1)-0.3*b(i - 2);
    end
    dt2(k) = cputime - t;   % toc
    ratio(k) = dt1/dt2;
end


dt1_mn = mean(dt1) % mean time over all runs (without preallocation)
dt1_std = std(dt1) % std over all runs (without preallocation)

dt2_mn = mean(dt2) % mean time over all runs (with preallocation)
dt2_std = std(dt2) % std over all runs (without preallocation)

ratio_mn = mean(ratio) % average ratio of two methods
