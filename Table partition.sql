
use NugDB

------------------------ Partition Function ------------------------------------

create partition function pFunc(Date)
as Range Right for values
('1/1/2016', '1/1/2017', '1/1/2018')
------------------------------------------------------------------------

------------------------ Partition Scheme ------------------------------------------------------------------------

create partition SCHEME pScheme
as Partition pFunc
to (FG1, FG1, FG2, FG2)
------------------------------------------------------------------------------------------------

------------------------ Creating a table ------------------------------------------------

create table SampleData
(
	SampleDate Date
) on pScheme(SampleDate)


------------------------------------------------------------------------------------



alter database NugDB

add file(
NAME = [file1],
FILENAME = 'D:\Softwares\SSMS 2016\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\file1.ndf',
SIZE = 5 MB,  
MAXSIZE = UNLIMITED, 
FILEGROWTH = 10 MB
) TO FILEGROUP FG1 
--GO


alter database NugDB
add file(
NAME = [file2],
FILENAME = 'D:\Softwares\SSMS 2016\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\file2.ndf',
SIZE = 5 MB,  
MAXSIZE = UNLIMITED, 
FILEGROWTH = 10 MB
) TO FILEGROUP  FG1 
--GO


alter database NugDB
add file(
NAME = [file3],
FILENAME = 'D:\Softwares\SSMS 2016\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\file3.ndf',
SIZE = 5 MB,  
MAXSIZE = UNLIMITED, 
FILEGROWTH = 10 MB
) TO FILEGROUP  FG2 
--GO


alter database NugDB
add file(
NAME = [file4],
FILENAME = 'D:\Softwares\SSMS 2016\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\file4.ndf',
SIZE = 5 MB,  
MAXSIZE = UNLIMITED, 
FILEGROWTH = 10 MB
) TO FILEGROUP  FG2 
--GO



--ADD FILE
--(
--  NAME = [File_012020],
--  FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.JRAIYANI\MSSQL\DATA\File_012020.ndf',
--    SIZE = 5 MB,  
--    MAXSIZE = UNLIMITED, 
--    FILEGROWTH = 10 MB
--) TO FILEGROUP FG_01_2020
--GO





Insert into SampleData values('1/20/2015')

Insert into SampleData values('1/20/2016')

Insert into SampleData values('1/20/2017')

Insert into SampleData values('1/20/2018')


----------------------------------------------------  ------------------------------------------------------------

select *

from sys.dm_db_partition_stats
where object_id = object_id('dbo.SampleData')

