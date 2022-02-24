use HouseShare
Go

insert into AccommodationStatus(decsription)
values ('Available'),('Unavailable')
go

insert into Accommodation (locationID, statusID, propertyTypeID, [description],roomCount, bathroomCount,parking,petsAllowed,area)
values
(1,1,2,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 1, 1, 2, 0,94),
(2,1,1,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 3, 2, 3, 1,120),
(4,1,4,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 3, 2, 2, 0,115),
(5,1,3,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 2, 1, 0,107),
(6,1,2,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 1, 1, 0,104),
(7,1,2,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 1, 1, 1, 0,93),
(8,1,3,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 1, 2, 0,101),
(9,1,3,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 2, 2, 0,110),
(10,1,1,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 4, 3,4, 1,150),
(11,1,1,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 3, 1, 2, 0,125),
(12,1,4,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 2, 1, 0,94),
(13,1,4,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 1, 2, 0,90),
(14,1,2,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 2, 2, 0,102),
(15,1,2,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 1, 2, 0,105),
(16,1,3,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 1, 2, 0,94),
(17,1,3,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 2, 2, 0,94),
(18,1,1,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 3, 2, 2, 0,140),
(19,1,4,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 1, 2, 0,94),
(20,1,2,'Lovely place to stay close to A KICKASS IT company that goes by the name of BBD', 2, 1, 2, 0,94);
GO