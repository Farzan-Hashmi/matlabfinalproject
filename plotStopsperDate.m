function individual_dates = plotStopsperDate(NonGroupedTable,groupedColumn)
%The function recieves a table with a 'date' column. It then groups the
%table by date, and plots the number of stops for each date

copy = NonGroupedTable;
individual_dates = eval(sprintf("groupsummary(copy, {'%s'})", groupedColumn));
plot(individual_dates.date, individual_dates.GroupCount)

end

