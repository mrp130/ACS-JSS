sequences = [2,1,5,4,3;1,4,5,3,2;4,5,2,3,1;2,1,5,3,4;1,4,3,2,5;2,3,5,1,4;4,5,2,3,1;3,1,2,4,5;4,2,5,1,3;5,4,3,2,1];
time = [53,21,34,55,95;21,71,26,52,16;12,42,31,39,98;55,77,66,77,79;83,19,64,34,37;92,54,43,62,79;93,87,87,69,77;60,41,38,24,83;44,49,98,17,25;96,75,43,79,77;];

n_machine = size(sequences,2);
n_job = size(sequences,1);

job_done = zeros(n_job,1);
job_time = zeros(n_job,1);
machine_time =  zeros(n_machine,1);

result = zeros(n_job, n_machine);

max_cycle = 100;

while min(job_done) < n_machine
   for machine = 1:n_machine
       target_job = [];
       while size(target_job) == 0
            target_job = [];
            next_job = [];
            target_time = [];
            for job = 1:n_job
              if job_done(job,end) >= n_machine
                  continue
              end
              if machine ~= sequences(job, job_done(job)+1)
                  continue
              end
              next_job(end+1) = job;
              if machine_time(machine) >= job_time(job)
                  target_job(end+1) = job;
                  target_time(end+1) = time(job, job_done(job)+1);
              end
            end
            if size(next_job) == 0
                break
            end
            if machine_time(machine) < min(job_time(next_job)) 
                machine_time(machine) = min(job_time(next_job));
            end
       end
       selected_idx = find(target_time == min(target_time));
       if size(selected_idx) == 0
           continue
       end
       selected_idx = selected_idx(1);
       selected_job = target_job(selected_idx);
       machine_time(machine) = machine_time(machine) + target_time(selected_idx);
       job_time(selected_job) = machine_time(machine);
       job_done(selected_job) = job_done(selected_job)+1;
       job_done
       result(find(result(:,machine)==0,1), machine) =  selected_job;
   end
end