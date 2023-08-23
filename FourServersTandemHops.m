N = 10000;                   % Total Number of Packets generated
hops_1 = 0;                % No. of Internal Hops when 1 packet is in  System
hops_2 = 0;                % No. of Internal Hops when 2 packets are in System
hops_3 = 0;                % No. of Internal Hops when 3 packets are in System

No_of_times_0 = 0; 
No_of_times_1 = 0;
No_of_times_2 = 0;
No_of_times_3 = 0;
No_of_times_4 = 0;
%% Assigning Arrival And Departure Time for Each Servers
    for i = 1 : N
        S1(i) = out.Server1.Time(2*i-1);   % Server1 Arrival
    end
    for i = 1 : N
        S11(i) = out.Server1.Time(2*i);    % Server1 Departure
    end
    for i = 1 : N
        S2(i) = out.Server2.Time(2*i-1);   % Server2 Arrival
    end
    for i = 1 : N
        S22(i) = out.Server2.Time(2*i);    % Server2 Departure
    end
    for i = 1 : N
        S3(i) = out.Server3.Time(2*i-1);   % Server3 Arrival
    end
    for i = 1 : N
        S33(i) = out.Server3.Time(2*i);    % Server3 Departure
    end
    for i = 1 : N
        S4(i) = out.Server4.Time(2*i-1);   % Server4 Arrival
    end
    for i = 1 : N
        S44(i) = out.Server4.Time(2*i);    % Server4 Departure
    end

    %% No packet is in System
        for i = 1 : 1 : N - 1
            if (out.Arrival.Time(i+1) > S44(i)) && ( S1(i+1)-S44(i) > 0)
             No_of_times_0 = No_of_times_0 + 1;
            end
        end
    %% Only one packet is in System
        for i = 1 : 1 : N - 1
            if out.Arrival.Time(i+1) >= out.Server4.Time(2*i)
             No_of_times_1 = No_of_times_1 + 1;
             hops_1 = hops_1 + 3;
            end
        end

     %% Two Packets are in system   
        for i = 1 : 1 : N - 3
            if S1(i+1) <= S44(i) && S1(i+2) >= S44(i) && S1(i+3) >= S44(i)
                No_of_times_2 = No_of_times_2 + 1;
                if S33(i) > S2(i+1)                     % When S2 and S3 are Busy
                    hops_2 = hops_2 + 2; 
                end
                if S22(i) > S1(i+1)                     % When S1 and S2 are Busy
                    hops_2 = hops_2 + 4;
                end
                if S44(i) > S3(i+1)                     % When S3 and S4 are Busy
                    hops_2 = hops_2 + 0; 
                end
                if S1(i+1) > S33(i) && S1(i+1) < S44(i) % When S1 and S4 are Busy
                    hops_2 = hops_2 + 2;
                end
                if S2(i+1) > S33(i) && S2(i+1) < S44(i) % When S2 and S4 are Busy
                    hops_2 = hops_2 + 1;
                end
                if S1(i+1) > S22(i) && S1(i+1) < S33(i) % When S1 and S3 are Busy
                    hops_2 = hops_2 + 3;
                end
            end
        end
        
     %% Three Packets are in the System
         for i = 1 : 1 : N - 3
            if S1(i+1) <= S44(i) && S1(i+2) <= S44(i) && S1(i+3) >= S44(i)
                No_of_times_3 = No_of_times_3 + 1;
                if S2(i+2) < S33(i+1) && S2(i+1) < S44(i)                       % When S2,S3,S4 are Busy 
                    hops_3 = hops_3 + 0;
                end
                if S1(i+2) > S22(i+1) && S1(i+2) < S33(i+1) && S2(i+2) < S44(i) % When S1,S3,S4 Are Busy
                    hops_3 = hops_3 + 1;
                end
                if S1(i+2) < S22(i+1) && S1(i+2) > S33 (i) && S1(i+2) < S44(i)  % When S1,S3,S4 are Busy
                    hops_3 = hops_3 + 2;
                end
                if S1(i+2) < S22(i+1) && S1(i+2) < S33(i)                       % When S1,S2,S3 are busy
                    hops_3 = hops_3 + 3;
                end
            end
         end
    
     %% Four Packets are in the System
         for i = 1 : 1 : N - 3
            if S1(i+1) <= S44(i) && S1(i+2) <= S44(i) && S1(i+3) <= S44(i)
                No_of_times_4 = No_of_times_4 + 1;
            end
         end




         