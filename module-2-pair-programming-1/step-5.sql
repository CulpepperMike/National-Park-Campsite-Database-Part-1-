/*
 STEP ONE: Add a new park with the following data:
  ------------------------------
  name: Ohiopyle State Park
  location: Pennsylvania
  establish date: 1965-01-01
  area: 19052
  visitors: 1000000
  description: Ohiopyle State Park is a Pennsylvania state park on 19,052 acres in Dunbar, Henry Clay and Stewart Townships, Fayette County, Pennsylvania in the United States. The focal point of the park is the more than 14 miles of the Youghiogheny River Gorge that passes through the park.
  ------------------------------
*/
insert into park (name, location, establish_date, area, visitors, description)
values ('Ohiopyle State Park', 'Pennsylvania', '01/01/1965', '19052', '1000000', 'Ohiopyle State Park is a Pennsylvania state park on 19,052 acres in Dunbar, Henry Clay and Stewart Townships, Fayette County, Pennsylvania in the United States. The focal point of the park is the more than 14
		miles of the Youghiogheny River Gorge that passes through the park.');

/*
  STEP TWO: You just found out that there was an error with the park data. Please update the park visitors to 1.5 million anually.

*/
update park set visitors = 1500000
where name = 'Ohiopyle State Park';

/*
 STEP THREE: Insert new campground with the following data:
  ------------------------------------------------------------
  park_id: (use the id of the new park you just added)
  name: Youghiogheny
  open_from_mm: 01
  open_to_mm: 12
  daily_fee: 95.00
  ------------------------------------------------------------
*/
insert into campground (park_id, name, open_from_mm, open_to_mm, daily_fee)
values ((select park_id from park where name = 'Ohiopyle State Park'), 'Youghiogheny', 01, 12, '95');

/*
 STEP FOUR: Insert 3 new sites with the following data:
 ------------------------------------------------------------
  site_number: 623, campground_id: (use the id of the new campground you just added)
  site_number: 624, campground_id: (use the id of the new campground you just added)
  site_number: 625, campground_id: (use the id of the new campground you just added)
 ------------------------------------------------------------
*/
insert into site (site_number, campground_id) values
	(623, (select campground_id from campground where name = 'Youghiogheny')),
	(624, (select campground_id from campground where name = 'Youghiogheny')),
	(625, (select campground_id from campground where name = 'Youghiogheny'))
;

/*
 STEP FIVE: Insert 3 reservations, 1 for each site with the following data:
------------------------------------------------------------------------------------
  site_id: (the site_id for site number 623 that you just created), name: Wayne Family, from_date: today + 10 days, to_date: today + 20 days
  site_id: (the site_id for site number 624 that you just created), name: Parker Family, from_date: today + 11 days, to_date: today + 20 days
  site_id: (the site_id for site number 625 that you just created), name: Kent Family, from_date: today + 12 days, to_date: today + 20 days
------------------------------------------------------------------------------------
*/
insert into reservation (site_id, name, from_date, to_date) values
	((select site_id from site where site_number = 623), 'Wayne Family', '11/14/2023', '11/24/2023'),
	((select site_id from site where site_number = 624), 'Parker Family', '11/15/2023', '11/24/2023'),
	((select site_id from site where site_number = 625), 'Kent Family', '11/16/2023', '11/24/2023')
;

/*
 STEP SIX: The Wayne Family called and asked if they could change their reservation to today. Update the from_date to today and the to_date to a week from today.
 */
update reservation set from_date = '11/04/2023', to_date = '11/11/2023'
where name = 'Wayne Family';

/*
 STEP SEVEN: The Kent family called and they would like to cancel their reservation. Delete the reservation for Kent Family.
*/
delete from reservation
where name = 'Kent Family';
