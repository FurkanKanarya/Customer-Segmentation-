data=data(:,4:5);

data.AnnualIncome=(data.AnnualIncome-mean(data.AnnualIncome))/std(data.AnnualIncome);
data.SpendingScore=(data.SpendingScore-mean(data.SpendingScore))/std(data.SpendingScore);

data=table2array(data);
treefigure1=linkage(data,'ward');

dendrogram(treefigure1)
grid on;

I=inconsistent(treefigure1,7);
[ax bx]=max(I(:,4));
c=cluster(treefigure1,'cutoff',treefigure1(bx,3)-0.1,'Criterion','distance');
gscatter(data(:,1),data(:,2),c);