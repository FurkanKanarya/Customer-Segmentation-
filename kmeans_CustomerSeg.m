%eksik veri kontrolü
sum(ismissing(data))

%öznitelik seçme
data=data(:,4:5);

%normalizasyon
data.AnnualIncome=(data.AnnualIncome-mean(data.AnnualIncome))/std(data.AnnualIncome);
data.SpendingScore=(data.SpendingScore-mean(data.SpendingScore))/std(data.SpendingScore);

data=table2array(data);
sa=[];
K=[];

for k = 1:20
    [idx c sumd]=kmeans(data,k);
    sa=[sa sum(sumd)];
    K=[K k];
end
plot(K,sa)

idx=kmeans(data,5);
gscatter(data(:,1),data(:,2),idx);
