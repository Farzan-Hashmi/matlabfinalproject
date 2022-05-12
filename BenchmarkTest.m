function stopRateTable = BenchmarkTest(dataTable,population)
%This function takes in a data table, as well as a struct with population
%data by ethnicity. It then calculates the stop rate for each ethnicity by
%dividing the number of police stops per ethnicity by the ethnicity's
%respective population.

%creating array of population values from struct
grouped_by_race = groupsummary(dataTable, {'subject_race'});
grouped_by_race = [grouped_by_race array2table(population)];
stop_rates = grouped_by_race.(2)./population;

stopRateTable = [grouped_by_race array2table(stop_rates)];
