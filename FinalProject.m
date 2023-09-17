% Study

% Scrubbing the Data
obtable = readtable ('obesitydata.xlsx', 'Preserve Variable Names', true);
HDItable = readtable('HDIdata.xlsx', 'Preserve Variable Names', true);
lengthofob = length(obtable.ObesityPerc) + 1;
i= 1;
z = {};

% To cycle through the data set and fix the values 
while i < lengthofob
	a = obtable.ObesityPerc(i);
	b = a{1};
	b = b(1:4);
	b = strtrim(b);
	z{i} = str2num(b);
	i=i + 1;
end

% Converting
allobperc = cell2mat(z);

% Plotting 
figure
yofob = (1:length(allobperc));
scatter(yofob, allobperc, ‘*b’);
title('All Obesity Percentages')
xlabel('Countries')
label('Obesity Percentages’)

i = 1;
j= 124; 
t= {};

% To take out the obesity rates for each country in 2016
while j < 24066
	t{i} = allobperc(j);
	j=j + 126;
	i=i + 1;
end

% Converting
allobpercof2016=cell2mat(t);

% Plotting 
figure
yofob2016 = (1:length(allobpercof2016));
scatter(yofob2016, allobpercof2016, ‘*b’);
title('Obesity Percentages in All Countries in 2016')
xlabel('Countries’)
ylabel('Obesity Percentages in 2016')


% Comparisons

% For table used for specific country evaluations
newobtable = readtable ('newforcomp.xlsx', 'PreserveVariableNames', true);

lengthofnewob = 336;
i= 1; 
g = {};

% To cycle through the data set and fix the values 
while i <= lengthofnewob
	a = newobtable.ObesityPerc{i}(1:4);
	b = strtrim(a);
	g{i} = str2num(b);
	i=i+ 1;
end

% Converting
newobperc = cell2mat(g);

% Specific Countries
US = newobperc(1:42);
Canada = newobperc(43:84);
UK = newobperc(85:126);
UAE = newobperc(127:168);
India = newobperc(169:210);
Somalia = newobperc(211:252);
Yemen = newobperc(253:294);
Afghanistan = newobperc(295:336);
Years = [1975:2016];

% Improving the Plots for the Countries Throughout the Years

figure
scatter(Years,US)
hold on
scatter(Years, Canada)
hold on
scatter(Years,UK)
hold on
scatter(Years, UAE)
hold off
title('Obesity Percentages in High GDP Nations')
xlabel('Years')
ylabel('Percent of Population That is Obese')
legend('US', 'Canada', 'UK', 'UAE')

figure
scatter(Years, India)
hold on
scatter(Years, Somalia)
hold on
scatter(Years, Yemen)
hold on
scatter(Years, Afghanistan)
hold off
title('Obesity Percentages in Low GDP Nations’)
xlabel('Years’)
ylabel ('Percent of Population That is Obese')
legend('India', 'Somalia', 'Yemen', 'Afghanistan')

% Comparing the High GDP Nations With the Low GDP Nations figure
scatter(Years, US)
hold on
scatter(Years, Canada)
hold on
scatter(Years, UK)
hold on
scatter(Years, UAE)
hold on
scatter(Years, India)
hold on
scatter(Years, Somalia)
hold on
scatter(Years, Yemen)
hold on
scatter(Years, Afghanistan)
hold off
title('Obesity Percentages in All Selected Nations’)
xlabel('Years')
ylabel('Percent of Population That is Obese')
legend('US', 'Canada', 'UK', 'UAE', 'India', 'Somalia', 'Yemen', 'Afghanistan')


% HDI

HDItable = readtable('HDIdata.xIsx', 'Preserve VariableNames', true);
head(HDItable)

lengthofhdi = length (HDItable.Country) - 3;
hdixvalues = 1:lengthofhdi;
i = 1;
HDIvalues = [];

while i <= lengthofhdi
	HDIvalues(i) = HDItable.HDI(i);
	i=i + 1:
end

scatter(hdixvalues, HDIvalues)
title('HDI Values by Decreasing Order')
xlabel('Countries')
ylabel('HDI Values’)

% Creating a new vector for selected HDI values
selectedcountrieshdi = [];
selectedcountrieshdi(1) = HDItable.HD|(21);
selectedcountrieshdi(2) = HDItable.HDI(15);
selectedcountrieshdi(3) = HDItable.HDI(18);
selectedcountrieshdi(4) = HDItable.HDI(26);
selectedcountrieshdi(5) = HDItable.HDI(132);
selectedcountrieshdi(6) = HDItable.HDI(172);
selectedcountrieshdi(7) = HDItable.HDI(183);
selectedcountrieshdi(8) = HDItable.HDI(180);

countrynames = {'US', 'Canada', 'UK', 'UAE', 'India', 'Somalia', 'Yemen', 'Afghanistan');

bar(selectedcountrieshdi)
set(gca, 'xticklabel',countrynames)
title('HDI Values For Selected Countries')
xlabel(‘Countries’)
ylabel('HDI Values')


% New

newobtable = readtable('newforcomp.xIsx', 'Preserve VariableNames', true);
newobtable2 = readtable('newforcomp2.xIsx', 'PreserveVariableNames', true);

years = [1975:2016, 1975:2016, 1975:2016, 1975:2016];
years = years’;

lengthofnewob = 168;
i = 1;
9 = {};
while i <= lengthofnewob
	a = newobtable.ObesityPerc{i}(1:4);
	b = strtrim(a);
	g{i} = str2num(b);
	i=i+ 1;
end
newobperc = cell2mat(g);
newobperc = newobperc';
hightable = table(years,newobperc);

lengthofnewob2 = 168;
i = 1;
h=0;
while i <= lengthofnewob2
	a = newobtable2.ObesityPerc{iX1:4);
	b = strtrim(a);
	h{i} = str2num(b);
	i=i+ 1;
end
newobperc2 = cell2mat(h);
newobperc2 = newobperc2';
lowtable = table(years,newobperc2);

filename = 'highhdidata.xlsx';
writetable(hightable,filename, 'Sheet', 'HighValues', 'Write Variable Names',false);
filename2 = 'lowhdidata.xlsx';
writetable(lowtable,filename2, 'Sheet', 'LowValues','Write VariableNames',false);