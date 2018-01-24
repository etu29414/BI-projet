drop table BIDatawharehouse.FactSale;
drop table BIDatawharehouse.DimCustomer;
drop table BIDatawharehouse.DimProduct;
drop table BIDatawharehouse.DimDate;
drop table BIDatawharehouse.DimStore;

create table BIDatawharehouse.DimCustomer(
	id_dimCustomer bigint not null identity(1,1),
    id_source int not null,
    lastName varchar(30) not null,
    firstName varchar(30) not null,
    streetAndNumber varchar(120) not null,
    postalCode int not null,
    cityName varchar(50)not null,
    province varchar(50) not null,
    statutMartitalFr varchar(20) not null,
    statutMartitalEn varchar(20) not null,
    statutMartitalDutch varchar(20) not null,
    statutMartitalGerman varchar(20) not null,
    primary key (id_dimCustomer)
);

create table BIDatawharehouse.DimProduct(
	id_dimProduct bigint not null identity(1,1),
    id_source int not null,
    categoryNameFr varchar(40) not null,
    categoryNameEn varchar(40) not null,
    categoryNameDutch varchar(40) not null,
    categoryNameGerman varchar(40) not null,
    productNameFr varchar(50) not null,
    productNameEn varchar(50) not null,
    productNameDutch varchar(50) not null,
    productNameGerman varchar(50) not null,
    departementNameFr varchar(50) not null,
    departementNameEn varchar(50) not null,
    departementNameDutch varchar(50) not null,
    departementNameGerman varchar(50) not null,
    unitPriceExcludingVAT decimal(5,2) not null,
    VATRate decimal(5,2) not null,
	primary key (id_dimProduct)
);

create table BIDatawharehouse.DimStore(
	id_dimStore bigint not null identity(1,1),
    id_source int not null,
    name varchar(50) not null,
    streetAndNumber varchar(120) not null,
	cityNameFr varchar(50)not null,
	cityNameEn varchar(50)not null,
	cityNameDutch varchar(50)not null,
	cityNameGerman varchar(50)not null,
    province varchar(50) not null,
	countryNameFr varchar(20) not null,
	countryNameEn varchar(20) not null,
	countryNameDutch varchar(20) not null,
	countryNameGerman varchar(20) not null,
	salesAreaSquareMeters decimal(5,2) not null,
    primary key (id_dimStore)
);

CREATE TABLE BIDatawharehouse.DimDate
(
	dateKey bigint not null,
    dayNameFr varchar(50) not null,
    dayNameEn varchar(50) not null,
    dayNameDutch varchar(50) not null,
    dayNameGerman varchar(50) not null,
    monthNameFr varchar(50) not null,
    monthNameEn varchar(50) not null,
    monthNameDutch varchar(50) not null,
    monthNameGerman varchar(50) not null,
	[date] date not null,
    primary key (dateKey)
);

create table BIDatawharehouse.FactSale(
	id_factSale bigint not null identity(1,1),
    id_source int not null,
    id_receipt bigint not null,
    id_dimCustomer bigint not null,
    id_dimProduct bigint not null,
    id_dimStore bigint not null,
    dateKey bigint not null,
    quantity int not null,
    momentDayFr varchar(20) not null,
	momentDayEn varchar(20) not null,
	momentDayDutch varchar(20) not null,
	momentDayGerman varchar(20) not null,
    primary key (id_factSale),
    constraint fk_dimCustomer foreign key(id_dimCustomer) references BIDatawharehouse.DimCustomer(id_dimCustomer),
    constraint fk_dimProduct foreign key(id_dimProduct) references BIDatawharehouse.DimProduct(id_dimProduct),
    constraint fk_dimStore foreign key(id_dimStore) references BIDatawharehouse.DimStore(id_dimStore),
    constraint fk_dimDate foreign key(dateKey) references BIDatawharehouse.DimDate(dateKey)
);