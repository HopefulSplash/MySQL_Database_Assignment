SELECT      s.staff_Title, s.staff_FName, s.staff_SName, s.staff_PNumber, s.staff_Email, s.staff_Role, 
				Address_Details.address_Postcode, Address_Details.address_County ,
                         Contract_Details.contract_Type, Contract_Details.contract_SDate, Address_Details.address_Street, Address_Details.address_City, 
                          dbo.getNumberDays_udf(Contract_Details.contract_SDate) AS 'Days Employed',
					CASE
						WHEN dbo.getNumberDays_udf(Contract_Details.contract_SDate) < = 120 THEN 'Employed Recently'
						WHEN dbo.getNumberDays_udf(Contract_Details.contract_SDate) < = 365 THEN 'Employed Within The Last Years'
						WHEN dbo.getNumberDays_udf(Contract_Details.contract_SDate) < = 730 THEN 'Employed Within The Last 2 Years'
						WHEN dbo.getNumberDays_udf(Contract_Details.contract_SDate) < = 1095 THEN 'Employed Within The Last 3 Years'
						WHEN dbo.getNumberDays_udf(Contract_Details.contract_SDate) < = 1460 THEN 'Employed Within The Last  4 Years'
					END AS 'Staff Status' , songsPlayed.*, dbo.getShowOccurrence_udf (s.staff_FName, s.staff_SName) AS 'Shows Played'
				

FROM Staff_Details  s 	
				CROSS APPLY 
								getStaffSongPlayCount_udf (s.staff_FName, s.staff_SName) songsPlayed
				INNER JOIN
                         Staff_Contract_Map ON s.staff_Details_ID = Staff_Contract_Map.staff_Details_ID INNER JOIN
                         Contract_Details ON Staff_Contract_Map.contract_Details_ID = Contract_Details.contract_Details_ID INNER JOIN
                         Address_Details ON s.address_Details_ID = Address_Details.address_Details_ID

									WHERE Contract_Details.contract_FDate IS NULL AND Contract_Details.contract_Type = 'Full Time Permanent'
									AND dbo.getShowOccurrence_udf (s.staff_FName, s.staff_SName) >= (SELECT Count(Show_Instance.show_Instance_ID) AS 'Show Played' FROM  Show_Instance) / 4
									ORDER BY s.staff_Details_ID


									