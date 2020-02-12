

bulk insert tetrika.dbo.users
from '.\Data\users2.txt' -- full path required
with ( codepage = 'ACP', datafiletype = 'char', fieldterminator = '|', rowterminator = '\n', check_constraints);


bulk insert tetrika.dbo.lessons
from '.\Data\lessons2.txt' -- full path required
with ( codepage = 'ACP', datafiletype = 'char', fieldterminator = '|', rowterminator = '\n', check_constraints);

bulk insert tetrika.dbo.participants
from '.\Data\participants2.txt' -- full path required
with ( codepage = 'ACP', datafiletype = 'char', fieldterminator = '|', rowterminator = '\n'); -- check_constraints has been removed to be able to load the data with incorrect foreign keys

bulk insert tetrika.dbo.quality
from '.\Data\quality2.txt' -- full path required
with ( codepage = 'ACP', datafiletype = 'char', fieldterminator = '|', rowterminator = '\n'); -- check_constraints has been removed to be able to load the data with incorrect foreign keys