

use WideWorldImportersDW

select * from [Dimension].[Customer]



select 
Customer, 
count(Customer)

from [Dimension].[Customer]

group by
Customer


select * from Dimension.City

-------------------------------------- ROWSTORE NonCluster INDEX------------------------------------

create nonClustered index IX_Province
on Dimension.City ([State Province])
include ([City])

------------------------------------------------------------------------------------


----------------------------- COLUMN STORE INDEX -------------------------------------------------------

create nonclustered columnstore index IX_columnstore
on Dimension.City ([City])

------------------------------------------------------------------------------------



