


------------------- Sliding Partitions -----------------------------------


Alter table SampleData
Switch partition 2 to SampleData_2016


Alter partition function pFunc()
Merge Range ('1/1/2016')

Alter Partition Scheme pScheme
Next used FG2

Alter partition function pFunc()
Split Range ('1/1/2019')


Insert into SampleData values('1/20/2019')


select * from SampleData
