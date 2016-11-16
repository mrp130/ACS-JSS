sequences = [2,1,5,4,3;1,4,5,3,2;4,5,2,3,1;2,1,5,3,4;1,4,3,2,5;2,3,5,1,4;4,5,2,3,1;3,1,2,4,5;4,2,5,1,3;5,4,3,2,1];
time = [53,21,34,55,95;21,71,26,52,16;12,42,31,39,98;55,77,66,77,79;83,19,64,34,37;92,54,43,62,79;93,87,87,69,77;60,41,38,24,83;44,49,98,17,25;96,75,43,79,77;];

current_job_sequence = zeros(10,1);
current_machine_sequence = zeros(5,1);

max_cycle = 100;
cycle = 0;
n_machine = 5;
current_time = 0;

while cycle < max_cycle
   for i = 1:n_machine
      if current_time <= current_machine_sequence(i)
          
      end
   end
   cycle = cycle + 1;
end