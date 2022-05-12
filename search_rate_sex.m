function search_rate_sex_table = search_rate_sex(dataTable)
%This function takes in a data table from the the Stanford Open Polcing
%Dataset and returns a table depicting the search rate of each sex.
sex_and_search = array2table(dataTable{:,["subject_sex", "search_conducted"]});
search_conducted = TF_conversion(sex_and_search.Var2);
sex_and_search = [sex_and_search array2table(search_conducted)];
sex_and_search.Var2 = [];
sex_and_search.Properties.VariableNames{1} = 'subject_sex';
sex_and_search.Properties.VariableNames{2} = 'Search Conducted?';
sex_and_search = groupsummary(sex_and_search, "subject_sex", "mean");
VariableNames = ["subject_sex" "Number of Searches (2015)" "Search Rate (2015)"];
sex_and_search.Properties.VariableNames = VariableNames;
search_rate_sex_table = sex_and_search;

end

