$PBExportHeader$w_photo_data_settings.srw
forward
global type w_photo_data_settings from w_popup
end type
type cb_ok from commandbutton within w_photo_data_settings
end type
type cb_close from commandbutton within w_photo_data_settings
end type
type dw_data from u_dw within w_photo_data_settings
end type
end forward

global type w_photo_data_settings from w_popup
integer x = 214
integer y = 221
integer width = 3497
integer height = 1844
string title = "Photo Data Settings"
boolean controlmenu = false
boolean resizable = false
long backcolor = 33551856
boolean center = true
cb_ok cb_ok
cb_close cb_close
dw_data dw_data
end type
global w_photo_data_settings w_photo_data_settings

on w_photo_data_settings.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_close=create cb_close
this.dw_data=create dw_data
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.dw_data
end on

on w_photo_data_settings.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_close)
destroy(this.dw_data)
end on

event open;call super::open;dw_data.settransobject(sqlca)
dw_data.retrieve()
end event

type cb_ok from commandbutton within w_photo_data_settings
integer x = 2830
integer y = 12
integer width = 311
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Ok"
end type

event clicked;dw_data.update()
close(parent)
end event

type cb_close from commandbutton within w_photo_data_settings
integer x = 3154
integer y = 12
integer width = 311
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Close"
end type

event clicked;close(parent)
end event

type dw_data from u_dw within w_photo_data_settings
integer x = 14
integer y = 128
integer width = 3474
integer height = 1632
integer taborder = 10
string dataobject = "d_personal_data_settings"
boolean hscrollbar = true
end type

event buttonclicked;call super::buttonclicked;long ll_color

ll_color = this.getitemnumber(row, "set_color")

openwithparm(w_photo_data_pick_color, ll_color)

if message.doubleparm = -1 then
	//cancel
else
	this.setitem(row,"set_color", message.doubleparm)
end if
	



end event

