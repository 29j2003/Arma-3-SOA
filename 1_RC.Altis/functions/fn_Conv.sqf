/* fn_Conv.sqf
  Author: R3vo 
  
  Modified by: Doggifast

  Description:
  Modified R3vo's fn_simpleConv.sqf
  Displays a subtitles at the bottom of the screen, or uses sideChat.

  Parameters:
  0: ARRAY
    0: STRING - Name of the person speaking - Default: Speaker
    1: STRING - Subtitle - Default: Subtitle
    2: OBJECT - Character which speaks the subtitle,  used to enable lip movement - Default: objNull
    3: STRING or NUMBER - Path to sound file
        -STRING - VALID PATH
        -NUMBER - TIME COEFFICIENT - In case you don't have a voiceline ready => conversation interval = Param4 + Param3
    4: NUMBER - Conversation interval (How much to wait after the line ends)
    5: STRING - 3D sound or UI
        -UI
        -3D
  1: STRING - Chat type - Default: SIDE
    - SIDE
    - GLOBAL
    - VEHICLE
    - COMMAND
    - GROUP
    - DIRECT
    - CUSTOM
    - SYSTEM
  2: BOOLEAN - Show background
  3: STRING - SIDECHAT/UI switch - Ignores 1 parameter
    -SIDECHAT (false)
    -UI (true)
  Returns:
  Nothing


  Example:
  line1 = ["SOLDIER 1", "Dude... How do you even sleep in a gas mask?", testDude1, "Sounds\Sound1.ogg", 1.5, "3D"];
  line2 = ["SOLDIER 2", "I don't know man, just do.", testDude2, "Sounds\Sound2.ogg", 1.5, "3D"];
  [[line1, line2], "SIDE", true, true] execVM "fn_Conv.sqf";
*/

#define BACKGROUND_COLOUR [0, 0, 0, 0.4]

waitUntil {isNil "R3vo_fnc_simpleConversation_running"};
R3vo_fnc_simpleConversation_running = true;
//private _breakMultiplier = param [2, 0.1, [0]];


private _lines =            param [0, [["Speaker", "Subtitle", objNull, 5, 2]], [[]]];
private _colour =           param [1, "SIDE", [""]];
private _showBackground =   param [2, false, [false]];
private _typeSwitch =       param [3, true, [true]];

switch (_typeSwitch) do
{
    case false: 
    {
        _fnc_showSubtitles =
        {
            private _currentSubtitleArray = _this;
            private _nameSpeaker =  _currentSubtitleArray # 0;
            private _text =         _currentSubtitleArray # 1;
            private _speaker =      _currentSubtitleArray param [2, objNull, [objNull]];
            private _voiceline =    _currentSubtitleArray param [3, 5, ["Path", 5]];
            private _interval =     _currentSubtitleArray param [4, 2, [1]];
            private _soundType =    _currentSubtitleArray param [5, "UI", [""]];
            private _soundHandle = -1;
            private _textHandler = "NAN";
            private _group = "NAN";
            private _endInterval = -1;

            if !(isNull _speaker) then 
            {
                _speaker setRandomLip true;
                if (_voiceline isEqualType "") then
                {
                    if (_soundType isEqualTo "UI") then 
                    {
                        _soundHandle = playSoundUI [getMissionPath _voiceline];
                    } else 
                    {
                        _soundHandle = playSound3D [getMissionPath _voiceline, _speaker];
                    };
                    
                };
                
                _speaker sideChat _text;
            } else
            {
                _group = createGroup [(side player), false];
                _textHandler = _group createUnit ["C_man_polo_1_F", [0,0,0], [], 0, "NONE"];
                _textHandler addItem "ItemRadio";
                _textHandler assignItem "ItemRadio";
                _textHandler setGroupId [_nameSpeaker];
                _soundHandle = playSoundUI [getMissionPath _voiceline];
                _textHandler sideChat _text;
            };
            
            waitUntil {soundParams _soundHandle isEqualTo []};
            
            if (isNull _speaker) then 
            {
                deleteVehicle _textHandler;
                deleteGroup _group;
            };
            
            if !(isNull _speaker) then {_speaker setRandomLip false;};
            if !(_voiceline isEqualType "") then
            {
                _endInterval = (_interval + _voiceline);
            }
            else
            {
                _endInterval = _interval;
            };
            sleep _endInterval;
        };
        {
            
            _currentSubtitleArray = _x;
            _handle = _currentSubtitleArray spawn _fnc_showSubtitles;
            waitUntil {scriptDone _handle};

            sleep 0.5;
        } forEach _lines;

        R3vo_fnc_simpleConversation_running = nil;
    };
    case true: 
    {
        //Select HEX colour from given string
        private _colourHTML = call
        {
          if (_colour == "SIDE") exitWith {"#00ccff"};
          if (_colour == "GLOBAL") exitWith {"#d7d7d9"};
          if (_colour == "VEHICLE") exitWith {"#fbd40b"};
          if (_colour == "COMMAND") exitWith {"#e5e760"};
          if (_colour == "DIRECT") exitWith {"#beee7e"};
          if (_colour == "CUSTOM") exitWith {"#ec5a29"};
          if (_colour == "SYSTEM") exitWith {"#8a8a88"};
          if (_colour == "BLUFOR") exitWith {([WEST, false] call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML};
          if (_colour == "OPFOR") exitWith {([EAST, false] call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML};
          if (_colour == "GUER") exitWith {([INDEPENDENT, false] call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML};
          if (_colour == "CIV") exitWith {([CIVILIAN, false] call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML};
          if (_colour == "SIDE") exitWith {([CIVILIAN, false] call BIS_fnc_sideColor) call BIS_fnc_colorRGBtoHTML};
        };
        _fnc_showSubtitles =
        {
            params ["_nameSpeaker", "_textInput", "_speaker", "_voiceline", "_interval", "_soundType", "_colourHTML", "_showBackground"];
            private _endInterval = "NAN";
            private _soundHandle = ["NAN"];
            //Create display and control
            disableSerialization;

            ("R3vo_fnc_conversation_layer" call BIS_fnc_rscLayer) cutRsc ["RscDynamicText", "PLAIN"];
            private _display = uiNamespace getVariable "BIS_dynamicText";

            private _ctrlStructuredText = _display displayCtrl 9999;
            private _ctrlBackground = _display ctrlCreate ["ctrlStaticFooter", 99999];

            //Position control
            private _w = 0.4 * safeZoneW;
            private _x = safeZoneX + (0.5 * safeZoneW - (_w / 2));
            private _y = safeZoneY + (0.83 * safeZoneH);
            private _h = safeZoneH;

            //Show subtitle
            private _text = parseText format ["<t align = 'center' shadow = '2' size = '0.65'><t color = '%1'>" + _nameSpeaker + ":</t> <t color = '#d0d0d0'>" + _textInput + "</t></t>", _colourHTML];
            _ctrlStructuredText ctrlSetStructuredText _text;
            _ctrlStructuredText ctrlSetPosition [_x, _y, _w, _h];
            _ctrlStructuredText ctrlSetFade 0;
            _ctrlStructuredText ctrlCommit 0;

            if (_showBackground) then
            {
                _ctrlBackground ctrlSetPosition [_x, _y, _w, ctrlTextHeight _ctrlStructuredText];
                _ctrlBackground ctrlSetFade 0;
                _ctrlBackground ctrlCommit 0;
            };
            
            if (_voiceline isEqualType "") then
            {
                if (_soundType isEqualTo "UI") then 
                {
                    _soundHandle = playSoundUI [getMissionPath _voiceline];
                } else
                {
                    if (isNull _speaker) exitWith {"fn_conv: Can't have 3D sound with UI without speaker!" call BIS_fnc_Error;};
                    _soundHandle = playSound3D [getMissionPath _voiceline, _speaker];
                };
                waitUntil {soundParams _soundHandle isEqualTo []};
            };

            if !(_voiceline isEqualType "") then
            {
                _endInterval = (_interval + _voiceline);
            }
            else
            {
                _endInterval = _interval;
            };

            sleep _endInterval;

            //Hide all controls
            _display closeDisplay 0;
        };

        //Loop through all given lines
        {
            private _currentSubtitleArray = _x;
            private _nameSpeaker =  _currentSubtitleArray # 0;
            private _text =         _currentSubtitleArray # 1;
            private _speaker =      _currentSubtitleArray param [2, objNull, [objNull]]; 
            private _voiceline =    _currentSubtitleArray param [3, 5, ["Path", 5]];
            private _interval =     _currentSubtitleArray param [4, 2, [1]];
            private _soundType =    _currentSubtitleArray param [5, "UI", [""]];

            if !(isNull _speaker) then {_speaker setRandomLip true};

            private _handle = [_nameSpeaker, _text, _speaker, _voiceline, _interval, _soundType, _colourHTML, _showBackground] spawn _fnc_showSubtitles;
            waitUntil {scriptDone _handle};

            if !(isNull _speaker) then {_speaker setRandomLip false};

            sleep 0.5;
        } forEach _lines;

        R3vo_fnc_simpleConversation_running = nil;
    };
};
