DROP TABLE IF EXISTS leader;

 	CREATE TABLE leader (

 	id SERIAL PRIMARY KEY,
 	name VARCHAR(50),
 	global_bonus TEXT,
 	active_bonus TEXT

 	);

 	INSERT INTO leader (name , global_bonus, active_bonus) VALUES ('Ubol Grol', 'When Ubol loses a unit roll a die. On a roll of 1 or 3 the unit is added to Ubol"s crypt.' , 'Ubol may hit 2 non-cannon units on a roll of 6' );
 	INSERT INTO leader (name , global_bonus, active_bonus) VALUES ('Black Hand Gnarg', 'The attack must use the same number of dice as Gnarg' , 'Gnarg may add the last killed unit to his units, this piece is taken from the opponents stash' );
 	INSERT INTO  leader (name , global_bonus, active_bonus) VALUES ('Kyron', 'Kyron"s capital heals at a rate of 2 units per turn', 'Kyron may sacrifice himself to end combat early, after he may return at half cost' );
