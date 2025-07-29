/* Show a center screen text */
_textToShow = param[0];
[[_textToShow], {
    params ["_msg"];
    [[[_msg, "<t align='center' size='1'>%1</t><br/>"]]] spawn BIS_fnc_typeText;
}] remoteExec ["call", 0];