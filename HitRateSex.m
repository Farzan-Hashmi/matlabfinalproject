function HitRateTableSex = HitRateSex(dataTable)
%This function takes a data table from the stanford open policing data set
%and returns a table with the hit rates for each each sex
search_happened_sex = dataTable(strcmp(dataTable.search_conducted, 'TRUE'), ["subject_sex", "search_conducted", "contraband_found"]);
[search_conducted_int, contraband_found_int] = TF_conversion(search_happened_sex.search_conducted, search_happened_sex.contraband_found);
search_happened_sex = [search_happened_sex array2table(search_conducted_int) array2table(contraband_found_int)];
search_happened_sex(:,2:3) = [];
hit_rate_sex = groupsummary(search_happened_sex, "subject_sex", "mean", "contraband_found_int");
hit_rate_sex = [hit_rate_sex(:,1) hit_rate_sex(:,3) hit_rate_sex(:,2)];
hit_rate_sex.Properties.VariableNames = ["subject_sex", "Hit Rate", "Number of Searches"];
HitRateTableSex = hit_rate_sex;
end

