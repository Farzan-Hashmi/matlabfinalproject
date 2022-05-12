function searchRateTable = search_rate(data_table)
%This function takes in the a data table from the Stanford Open Policing
%Dataset and calculates the search rate per race

race_and_search = array2table(data_table{:, ["subject_race", "search_conducted"]});
search_conducted = TF_conversion(race_and_search.Var2);
race_and_search = [race_and_search array2table(search_conducted)];
race_and_search.Var2 = [];
race_and_search.Properties.VariableNames{1} = 'subject_race';
race_and_search.Properties.VariableNames{2} = 'Search Conducted?';
race_and_search = groupsummary(race_and_search, "subject_race", "mean");

VariableNames = ["subject_race" "Number of Searches (2015)" "Search Rate (2015)"];
race_and_search.Properties.VariableNames = VariableNames;

searchRateTable = race_and_search;

end

