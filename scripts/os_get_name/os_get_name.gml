/// @desc Convert os_type to string name.
/// @param {Constant.OperatingSystem} system_index - Use os_type for it
/// @return {String}
function os_get_name(system_index) {
	var result = "";
	
	switch (system_index) {
	   case os_windows:      result = "Windows OS"; break;
	   case os_uwp:	         result = "Windows 10 Universal Windows Platform"; break;
	   case os_win8native:   result = "Windows 8 Native"; break;
	   case os_operagx:	     result = "Opera GX"; break;
	   case os_linux:        result = "Linux" break;
	   case os_macosx:       result = "macOS X" break;
	   case os_ios:	         result = "iOS" break;
	   case os_tvos:	     result = "Apple tvOS" break;
	   case os_android:      result = "Android" break;
	   case os_ps5:		     result = "Sony PlayStation 5" break;
	   case os_ps4:		     result = "Sony PlayStation 4" break;
	   case os_ps3:		     result = "Sony PlayStation 3" break;
	   case os_psvita:       result = "Sony PlayStation Vita" break;
	   case os_xboxone:      result = "Microsoft XBox One" break;
	   case os_switch:       result = "Nintendo Switch" break;
	   case os_winphone:     result = "Linux" break;
	   case os_xboxseriesxs: result = "Microsoft Xbox Series X/S" break;
	   case os_unknown:      result = "Unknown OS"; break;
	   default:				 result = "Unkown OS"; break;
	}
	
	return result;
}