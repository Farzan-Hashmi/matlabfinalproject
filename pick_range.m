function [year_data,month_data] = pick_range(data_table,year)
%input arguments will be a data table and year
%convet table into time table
time_data = table2timetable(data_table);

%filter out data for specific year given by user
eval(sprintf('year_data=time_data(timerange(''%d-01-01'',''years''),:);',year));
%filter data by month
for m=1:12
    eval(sprintf('month_data(%d)=struct(''month'',year_data(timerange(''%d-%d-01'',''months''),:))',m,year,m));
end
end

% 