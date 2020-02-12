

bulk insert tetrika.dbo.users
from 'C:\Users\GTAO\git\Tetrika\3\Data\users2.txt'
with ( codepage = 'ACP', datafiletype = 'char', fieldterminator = '|', rowterminator = '\n', check_constraints);


bulk insert tetrika.dbo.lessons
from 'C:\Users\GTAO\git\Tetrika\3\Data\lessons2.txt'
with ( codepage = 'ACP', datafiletype = 'char', fieldterminator = '|', rowterminator = '\n', check_constraints);

bulk insert tetrika.dbo.participants
from 'C:\Users\GTAO\git\Tetrika\3\Data\participants2.txt'
with ( codepage = 'ACP', datafiletype = 'char', fieldterminator = '|', rowterminator = '\n');

bulk insert tetrika.dbo.quality
from 'C:\Users\GTAO\git\Tetrika\3\Data\quality2.txt'
with ( codepage = 'ACP', datafiletype = 'char', fieldterminator = '|', rowterminator = '\n');