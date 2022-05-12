function [white_hit_rates,black_hit_rates, hispanic_hit_rates, white_black_hit_rates, white_hispanic_hit_rates] = HitRate(dataTable)
%This function takes in a table from the Stanford open policing dataset and
%calculates the hit rate for white, black, and hispanic drivers. It returns
%tables showing the hit rate for each race by police district as well as
%tables comparing the hit rate for white-black and white-hispanic drivers
%by hit rate.

search_happened = dataTable(strcmp(dataTable.search_conducted, 'TRUE'), ["district", "subject_race", "search_conducted", "contraband_found"]);
[search_conducted_int, contraband_found_int] = TF_conversion(search_happened.search_conducted, search_happened.contraband_found);
search_happened = [search_happened array2table(search_conducted_int) array2table(contraband_found_int)];
search_happened(:,3:4) = [];
hit_rate_race_district = groupsummary(search_happened, ["subject_race", "district"], "mean", "contraband_found_int");
hit_rate_race_district(:,3) = [];
hit_rate_race_district.Properties.VariableNames = ["subject_race", "district", "hit rate"];

white_hit_rates = hit_rate_race_district(strcmp(hit_rate_race_district.subject_race, 'white'), :);
white_hit_rates = [white_hit_rates(:,2) white_hit_rates(:,1) white_hit_rates(:,3)];

black_hit_rates = hit_rate_race_district(strcmp(hit_rate_race_district.subject_race, 'black'), :);
black_hit_rates = [black_hit_rates(:,2) black_hit_rates(:,1) black_hit_rates(:,3)];

hispanic_hit_rates = hit_rate_race_district(strcmp(hit_rate_race_district.subject_race, 'hispanic'), :);
hispanic_hit_rates = [hispanic_hit_rates(:,2) hispanic_hit_rates(:,1) hispanic_hit_rates(:,3)];

num_searches_per_district = groupsummary(search_happened, "district");

white_black_hit_rates = join(white_hit_rates, black_hit_rates, 'Keys', 'district');
white_black_hit_rates = join(white_black_hit_rates, num_searches_per_district, 'Keys', 'district');
white_black_hit_rates.Properties.VariableNames = ["district", "subject_race_white", "white_hit_rate", "subject_race_black", "black_hit_rate", "searches_in_district"];


white_hispanic_hit_rates = join(white_hit_rates(~strcmp(white_hit_rates.district,'S'), :), hispanic_hit_rates, 'Keys', 'district');
white_hispanic_hit_rates = join(white_hispanic_hit_rates, num_searches_per_district);
white_hispanic_hit_rates.Properties.VariableNames = ["district", "subject_race_white", "white_hit_rate", "subject_race_hispanic", "hispanic_hit_rate", "searches_in_district"];



end

