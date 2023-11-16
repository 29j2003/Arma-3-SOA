params ["_trigger", "_height", "_moveObjects"];

_position = getPosWorld _trigger;
_triggerLength = (triggerArea _trigger)#0;
_triggerWidth = (triggerArea _trigger)#1;
_triggerAngle = (triggerArea _trigger)#2;

_pos = [(_position#0 + cos(_triggerAngle) * _triggerLength + sin(_triggerAngle) * _triggerWidth), (_position#1 - sin(_triggerAngle) * _triggerLength + cos(_triggerAngle) * _triggerWidth)];
_positionsAndHeights = [];
_pos pushBack _height;

for "_i" from 0 to (_triggerLength * 8) do {

	_pos2 = _pos;

	for "_j" from 0 to (_triggerWidth * 8) do {
		_positionsAndHeights pushBack _pos2;
		_pos2 = _pos2 vectorAdd [-0.25 * sin(_triggerAngle), -0.25 * cos(_triggerAngle), 0];

	};

	_pos = _pos  vectorAdd [-0.25 * cos(_triggerAngle), 0.25 * sin(_triggerAngle), 0];

};

setTerrainHeight[_positionsAndHeights, _moveObjects];