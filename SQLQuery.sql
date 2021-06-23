create database Vii

Use Vii


CREATE TABLE Account (
    AccountId int IDENTITY(1,1) PRIMARY KEY,
    FirstName varchar(255),
    LastName varchar(255),
    AccountStatusId int,
    
);

Create Table AccountStatus(
	AccountStatusId int Primary Key,
	Description varchar(255)
	)

Alter Table Account
Add foreign key (AccountStatusId) references AccountStatus(AccountStatusId)

Create Table [Transaction](

	TransactionId int IDENTITY(1,1) PRIMARY KEY,
    AccountId int foreign key references Account(AccountId),
    Amount decimal(6,2),
	TransactionTime datetime,
    SettlementDate date,
)

CREATE TABLE [Address] (
    AddressId int IDENTITY(1,1) PRIMARY KEY,
    AccountId int foreign key references Account(AccountId),
    AddressLine1 varchar(255),
	AddressLine2 varchar(255),
    Suburb varchar(255),
    PostCode smallint
);

insert into AccountStatus values(10,'Active')
insert into AccountStatus values(20,'InActive')

insert into Account (FirstName,LastName,AccountStatusId) select 'Stefanie','Buckley', AccountStatus.AccountStatusId from AccountStatus where AccountStatusId = 10;
insert into Account (FirstName,LastName,AccountStatusId) select 'Sandy','McGee', AccountStatus.AccountStatusId from AccountStatus where AccountStatusId = 20;
insert into Account (FirstName,LastName,AccountStatusId) select 'Lee','Warren', AccountStatus.AccountStatusId from AccountStatus where AccountStatusId = 10;

select Account.FirstName, Account.LastName from Account where Account.AccountStatusId=10;

select Account.FirstName, Account.LastName from Account INNER JOIN AccountStatus on Account.AccountStatusId = AccountStatus.AccountStatusId where AccountStatus.Description='Active';

select Account.FirstName, Account.LastName, Address.PostCode from Account inner join Address on Account.AccountId = Address.AccountId;

select [Transaction].AccountId, [Transaction].Amount from [Transaction] inner join (select [Transaction].AccountId, MAX(TransactionTime) as MaxDateTime from [Transaction] group by [Transaction].AccountId) groupAccDtt on [Transaction].AccountId = groupAccDtt.AccountId and [Transaction].TransactionTime = groupAccDtt.MaxDateTime;

select Account.FirstName, Account.LastName from Account where not exists (select null from Address where Address.AccountId = Account.AccountId)