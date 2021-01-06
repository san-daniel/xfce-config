--[[
		Created by Brad Heffernan
]]

require 'cairo'

function conky_day()
	if conky_window == nil then return end
	local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	local cr = cairo_create(cs)
	local cr2 = cairo_create(cs)
	local crt = cairo_create(cs)
	local crt2 = cairo_create(cs)
	local crd = cairo_create(cs)
	local crd2 = cairo_create(cs)

	local day_x = 350
	local day_y = 68

	local time_x = 340
	local time_y = 185

	local date_x = 320
	local date_y = 123

	-- Start of output
	local ext = cairo_text_extents_t:create()
	cairo_select_font_face (cr, "Anurati", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
	cairo_set_font_size (cr, 84)
	cairo_select_font_face (cr2, "Anurati", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
	cairo_set_font_size (cr2, 84)

	cairo_select_font_face (crt, "Quicksand", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
	cairo_set_font_size (crt, 30)
	cairo_select_font_face (crt2, "Quicksand", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
	cairo_set_font_size (crt2, 30)

	cairo_select_font_face (crd, "Quicksand", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
	cairo_set_font_size (crd, 30)
	cairo_select_font_face (crd2, "Quicksand", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
	cairo_set_font_size (crd2, 30)

	local text = string.upper(conky_parse ("${time %A}"))
	-- text = "WEDNESDAY"
	cairo_text_extents(cr, text, ext)
	cairo_text_extents(cr2, text, ext)
	local length = (day_x - (ext.width / 2))
	

	cairo_set_source_rgba(cr2, 0, 0, 0, 0.5)--SHADOW
	cairo_move_to(cr2, length, day_y - 2)  --SHADOW
	-- cairo_rotate (cr2, -90 * (math.pi / 180))  --SHADOW
	cairo_show_text(cr2, text)--SHADOW

	cairo_set_source_rgba (cr,255,255,255,1)
	cairo_move_to (cr,length, day_y)
	-- cairo_rotate (cr, -90 * (math.pi / 180))

	cairo_show_text(cr,text)
	

	local time = string.upper(conky_parse ("- ${time %I}:${time %M}${time %P} -"))
	
	-- text = "Friday"
	cairo_text_extents(crt, time, ext)
	cairo_text_extents(crt2, time, ext)
		
	local length = (time_x - (ext.width / 2))
	cairo_set_source_rgba(crt2, 0, 0, 0, 0.5)--SHADOW
	cairo_move_to(crt2, length, time_y - 2)  --SHADOW
	cairo_show_text(crt2, time)--SHADOW

	cairo_set_source_rgba (crt,255,255,255,1)
	cairo_move_to (crt,length - 2,time_y)

	cairo_show_text(crt,time)
	

	local timed = conky_parse ("${time %e} ${time %B}, ${time %Y}")
	
	-- text = "Friday"
	cairo_text_extents(crd, timed, ext)
	cairo_text_extents(crd2, timed, ext)
		
	local length2 = (date_x - (ext.width / 2))
	cairo_set_source_rgba(crd2, 0, 0, 0, 0.5)--SHADOW
	cairo_move_to(crd2, length2, date_y - 2)  --SHADOW
	cairo_show_text(crd2, timed)--SHADOW

	cairo_set_source_rgba (crd,255,255,255,1)
	cairo_move_to (crd,length2 - 2,date_y)

	cairo_show_text(crd,timed)
	
	
	-- End of output
	cairo_destroy(crd)
	cairo_destroy(crd2)
	cairo_destroy(cr)
	cairo_destroy(cr2)
	cairo_destroy(crt)
	cairo_destroy(crt2)
	cairo_surface_destroy(cs)
	cr=nil
	cr2=nil
	crt=nil
	crt2=nil
	crd=nil
	crd2=nil
end
