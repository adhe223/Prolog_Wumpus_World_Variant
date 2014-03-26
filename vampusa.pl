:- dynamic ([
	robot_loc,
	visited_rooms,
	room,
	direction
	]).

go :-
	format("Setting up a game of Vamp U.S.A.!"),
	assert(robot_loc([1,1])),
	assert(room([E,_,v,v], [v,p,d,_], [_,_,_,v])),
	assert(direction('East')),
	
	format("Setup is complete, game is beginning!"),
	walk([1,1]).
	
%----------------------------Moves-----------------------------
	
walk(room_to_visit) :-
	visited_rooms(prev_visited),
	retractall(visited_rooms(_)),
	assert(visited_rooms([prev_visited | room_to_visit])).
	
%----------------------------Sensors----------------------------

detect_vampire(bool) :-
	%how to get what is it a specific room location?