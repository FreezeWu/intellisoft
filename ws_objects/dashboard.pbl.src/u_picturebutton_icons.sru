﻿$PBExportHeader$u_picturebutton_icons.sru
forward
global type u_picturebutton_icons from dropdownpicturelistbox
end type
end forward

global type u_picturebutton_icons from dropdownpicturelistbox
integer width = 631
integer height = 888
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean border = false
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 553648127
end type
global u_picturebutton_icons u_picturebutton_icons

on u_picturebutton_icons.create
end on

on u_picturebutton_icons.destroy
end on

event constructor;long i, ll_cnt
String ls_picturenanme[]
ls_picturenanme[] = { &
"AddWatch!" ,+ &
"AddWatch5!" ,+ &
"AlignBottom!" ,+ &
"AlignHCenter!" ,+ &
"AlignLeft!" ,+ &
"AlignRight!" ,+ &
"AlignTop!" ,+ &
"AlignVCenter!" ,+ &
"Application!" ,+ &
"ApplicationIcon!" ,+ &
"ArrangeIcons!" ,+ &
"ArrangeTables!" ,+ &
"ArrangeTables5!" ,+ &
"Arrow!" ,+ &
"AutosizeHeight!" ,+ &
"Average!" ,+ &
"Blob!" ,+ &
"Bold!" ,+ &
"Border3DLowered!" ,+ &
"Border3DRaised!" ,+ &
"BorderBox!" ,+ &
"BorderNone!" ,+ &
"BorderResize!" ,+ &
"BorderShadowBox!" ,+ &
"BorderUnderline!" ,+ &
"BringToFront!" ,+ &
"Browse!" ,+ &
"BrowseClasses!" ,+ &
"BrowseObject!" ,+ &
"BrowseObjects!" ,+ &
"Cascade!" ,+ &
"Center!" ,+ &
"CheckBox!" ,+ &
"CheckBox1!" ,+ &
"CheckBox2!" ,+ &
"CheckDiff!" ,+ &
"CheckIn!" ,+ &
"CheckIn5!" ,+ &
"CheckOut!" ,+ &
"CheckOut5!" ,+ &
"CheckStatus!" ,+ &
"CheckStatus5!" ,+ &
"Clear!" ,+ &
"Close!" ,+ &
"CommandButton!" ,+ &
"CommandButton1!" ,+ &
"CommandButton2!" ,+ &
"Comment!" ,+ &
"Compile!" ,+ &
"Compute!" ,+ &
"Compute5!" ,+ &
"ComputePage!" ,+ &
"ComputePage5!" ,+ &
"ComputeSum!" ,+ &
"ComputeToday!" ,+ &
"ComputeToday5!" ,+ &
"ConfigODBC!" ,+ &
"ConfigODBC5!" ,+ &
"Continue!" ,+ &
"Copy!" ,+ &
"Count!" ,+ &
"CreateForeignKey!" ,+ &
"CreateIndex!" ,+ &
"CreateLibrary!" ,+ &
"CreateRuntime!" ,+ &
"CreateRuntime5!" ,+ &
"CreateTable!" ,+ &
"CreateTable5!" ,+ &
"CrossTab!" ,+ &
"Cursor!" ,+ &
"Custom001!" ,+ &
"Custom002!" ,+ &
"Custom003!" ,+ &
"Custom004!" ,+ &
"Custom005!" ,+ &
"Custom006!" ,+ &
"Custom007!" ,+ &
"Custom008!" ,+ &
"Custom009!" ,+ &
"Custom010!" ,+ &
"Custom011!" ,+ &
"Custom012!" ,+ &
"Custom013!" ,+ &
"Custom014!" ,+ &
"Custom015!" ,+ &
"Custom016!" ,+ &
"Custom017!" ,+ &
"Custom018!" ,+ &
"Custom019!" ,+ &
"Custom020!" ,+ &
"Custom021!" ,+ &
"Custom022!" ,+ &
"Custom023!" ,+ &
"Custom024!" ,+ &
"Custom025!" ,+ &
"Custom026!" ,+ &
"Custom027!" ,+ &
"Custom028!" ,+ &
"Custom029!" ,+ &
"Custom030!" ,+ &
"Custom031!" ,+ &
"Custom032!" ,+ &
"Custom033!" ,+ &
"Custom034!" ,+ &
"Custom035!" ,+ &
"Custom036!" ,+ &
"Custom037!" ,+ &
"Custom038!" ,+ &
"Custom039!" ,+ &
"Custom040!" ,+ &
"Custom041!" ,+ &
"Custom042!" ,+ &
"Custom043!" ,+ &
"Custom044!" ,+ &
"Custom045!" ,+ &
"Custom046!" ,+ &
"Custom047!" ,+ &
"Custom048!" ,+ &
"Custom049!" ,+ &
"Custom050!" ,+ &
"Custom051!" ,+ &
"Custom052!" ,+ &
"Custom053!" ,+ &
"Custom054!" ,+ &
"Custom055!" ,+ &
"Custom056!" ,+ &
"Custom057!" ,+ &
"Custom058!" ,+ &
"Custom059!" ,+ &
"Custom060!" ,+ &
"Custom061!" ,+ &
"Custom062!" ,+ &
"Custom063!" ,+ &
"Custom064!" ,+ &
"Custom065!" ,+ &
"Custom066!" ,+ &
"Custom067!" ,+ &
"Custom068!" ,+ &
"Custom069!" ,+ &
"Custom070!" ,+ &
"Custom071!" ,+ &
"Custom072!" ,+ &
"Custom073!" ,+ &
"Custom074!" ,+ &
"Custom075!" ,+ &
"Custom076!" ,+ &
"Custom077!" ,+ &
"Custom078!" ,+ &
"Custom079!" ,+ &
"Custom080!" ,+ &
"Custom081!" ,+ &
"Custom082!" ,+ &
"Custom083!" ,+ &
"Custom084!" ,+ &
"Custom085!" ,+ &
"Custom086!" ,+ &
"Custom087!" ,+ &
"Custom088!" ,+ &
"Custom089!" ,+ &
"Custom090!" ,+ &
"Custom091!" ,+ &
"Custom092!" ,+ &
"Custom093!" ,+ &
"Custom094!" ,+ &
"Custom095!" ,+ &
"Custom096!" ,+ &
"Custom097!" ,+ &
"Custom098!" ,+ &
"Custom099!" ,+ &
"Custom100!" ,+ &
"Custom101!" ,+ &
"Cut!" ,+ &
"DatabaseProfile!" ,+ &
"DatabaseProfile5!" ,+ &
"DataManip!" ,+ &
"DataWindow!" ,+ &
"DataWindow1!" ,+ &
"DataWindow2!" ,+ &
"DBAdmin!" ,+ &
"DBConnect!" ,+ &
"DBDisconnect!" ,+ &
"Debug!" ,+ &
"DeclareProcedure!" ,+ &
"DeclareVariable!" ,+ &
"DefaultFonts!" ,+ &
"DeleteRow!" ,+ &
"DeleteWatch!" ,+ &
"DeleteWatch5!" ,+ &
"Deploy!" ,+ &
"DesignMode!" ,+ &
"Destination!" ,+ &
"Destination5!" ,+ &
"DosEdit!" ,+ &
"DropDownListBox!" ,+ &
"DropDownListBox1!" ,+ &
"DropDownListBox2!" ,+ &
"EditDataFreeform!" ,+ &
"EditDataGrid!" ,+ &
"EditDataTabular!" ,+ &
"EditFuncDeclare!" ,+ &
"EditMask!" ,+ &
"EditMask1!" ,+ &
"EditMask2!" ,+ &
"EditMask5!" ,+ &
"EditObject!" ,+ &
"EditStops!" ,+ &
"EditStops5!" ,+ &
"EnglishEdit!" ,+ &
"EnglishQuery!" ,+ &
"EnglishQuery5!" ,+ &
"Environment!" ,+ &
"ExecuteSQL!" ,+ &
"ExecuteSQL5!" ,+ &
"Exit!" ,+ &
"Export!" ,+ &
"Export5!" ,+ &
"Find!" ,+ &
"FindNext!" ,+ &
"FormatDollar!" ,+ &
"FormatPercent!" ,+ &
"FullBuild!" ,+ &
"Globals!" ,+ &
"Graph!" ,+ &
"Graph1!" ,+ &
"Graph2!" ,+ &
"Group!" ,+ &
"GroupBox!" ,+ &
"GroupBox1!" ,+ &
"GroupBox2!" ,+ &
"Having!" ,+ &
"Help!" ,+ &
"Horizontal!" ,+ &
"HOW!" ,+ &
"HProgressBar!" ,+ &
"HProgressBar1!" ,+ &
"HProgressBar2!" ,+ &
"HScrollBar!" ,+ &
"HScrollBar1!" ,+ &
"HScrollBar2!" ,+ &
"HTrackBar!" ,+ &
"HTrackBar1!" ,+ &
"HTrackBar2!" ,+ &
"Import!" ,+ &
"Import5!" ,+ &
"IncrementalBuild!" ,+ &
"Inherit!" ,+ &
"Insert!" ,+ &
"Insert5!" ,+ &
"InsertReturn!" ,+ &
"Italic!" ,+ &
"Join!" ,+ &
"Justify!" ,+ &
"Layer!" ,+ &
"Left!" ,+ &
"Library!" ,+ &
"LibraryList!" ,+ &
"Line!" ,+ &
"Line1!" ,+ &
"Line2!" ,+ &
"ListBox!" ,+ &
"ListBox1!" ,+ &
"ListBox2!" ,+ &
"ListView!" ,+ &
"ListView1!" ,+ &
"ListView2!" ,+ &
"Menu!" ,+ &
"MostRecentObject!" ,+ &
"Move!" ,+ &
"Move5!" ,+ &
"MoveMode!" ,+ &
"MultiLineEdit!" ,+ &
"MultiLineEdit1!" ,+ &
"MultiLineEdit2!" ,+ &
"MultiLineEdit5!" ,+ &
"NestedReport!" ,+ &
"NestedReturn!" ,+ &
"New!" ,+ &
"NewspaperColumns!" ,+ &
"Next!" ,+ &
"Next5!" ,+ &
"NotFound!" ,+ &
"Ole!" ,+ &
"Ole1!" ,+ &
"Ole2!" ,+ &
"Ole5!" ,+ &
"Open!" ,+ &
"Options!" ,+ &
"Output!" ,+ &
"OutputNext!" ,+ &
"OutputPrevious!" ,+ &
"OutputSkip!" ,+ &
"OutputStop!" ,+ &
"Oval!" ,+ &
"Oval1!" ,+ &
"Oval2!" ,+ &
"Parameter!" ,+ &
"Paste!" ,+ &
"PasteArgument!" ,+ &
"PasteFunction!" ,+ &
"PasteGlobal!" ,+ &
"PasteInstance!" ,+ &
"PasteObject!" ,+ &
"PasteShared!" ,+ &
"PasteSpecial!" ,+ &
"PasteSQL!" ,+ &
"PasteSQL5!" ,+ &
"PasteStatement!" ,+ &
"PasteWindow!" ,+ &
"Picture!" ,+ &
"Picture1!" ,+ &
"Picture2!" ,+ &
"Picture5!" ,+ &
"PictureButton!" ,+ &
"PictureButton1!" ,+ &
"PictureButton2!" ,+ &
"PictureDropDownListBox!" ,+ &
"PictureDropDownListBox1!" ,+ &
"PictureDropDownListBox2!" ,+ &
"PictureHyperLink!" ,+ &
"PictureHyperLink1!" ,+ &
"PictureHyperLink2!" ,+ &
"PictureListBox!" ,+ &
"PictureListBox1!" ,+ &
"PictureListBox2!" ,+ &
"PlaceColumn!" ,+ &
"PlaceColumn5!" ,+ &
"Preferences!" ,+ &
"Preview!" ,+ &
"Print!" ,+ &
"Prior!" ,+ &
"Prior5!" ,+ &
"Properties!" ,+ &
"Query!" ,+ &
"QueryGovernor!" ,+ &
"QueryLibraryList!" ,+ &
"QueryLibraryList5!" ,+ &
"RadioButton!" ,+ &
"RadioButton1!" ,+ &
"RadioButton2!" ,+ &
"Rectangle!" ,+ &
"Rectangle1!" ,+ &
"Rectangle2!" ,+ &
"Redo!" ,+ &
"Regenerate!" ,+ &
"Regenerate5!" ,+ &
"RegistrationDir!" ,+ &
"RegistrationDir5!" ,+ &
"Replace!" ,+ &
"Report!" ,+ &
"Retrieve!" ,+ &
"Retrieve5!" ,+ &
"RetrieveCancel!" ,+ &
"RichTextEdit!" ,+ &
"RichTextEdit1!" ,+ &
"RichTextEdit2!" ,+ &
"Right!" ,+ &
"RoundRectangle!" ,+ &
"RoundRectangle1!" ,+ &
"RoundRectangle2!" ,+ &
"Run!" ,+ &
"RunReport!" ,+ &
"RunSCC!" ,+ &
"RunToCursor!" ,+ &
"RunWindow!" ,+ &
"Save!" ,+ &
"SaveAs!" ,+ &
"ScriptNo!" ,+ &
"ScriptYes!" ,+ &
"Search!" ,+ &
"SelectAll!" ,+ &
"SelectAndDebug!" ,+ &
"SelectAndRun!" ,+ &
"SelectApplication!" ,+ &
"SelectLibrary!" ,+ &
"SelectObject!" ,+ &
"SelectReturn!" ,+ &
"SelectScript!" ,+ &
"SelectStart!" ,+ &
"SelectStartRemote!" ,+ &
"SelectTable!" ,+ &
"SelectTable5!" ,+ &
"SendToBack!" ,+ &
"SetDefaultClass!" ,+ &
"SetNextStatement!" ,+ &
"SetVariable!" ,+ &
"ShowVariables!" ,+ &
"ShowWatch!" ,+ &
"ShowWatch5!" ,+ &
"SingleLineEdit!" ,+ &
"SingleLineEdit1!" ,+ &
"SingleLineEdit2!" ,+ &
"SingleLineEdit5!" ,+ &
"SingletonReturn!" ,+ &
"SizeBoth!" ,+ &
"SizeHorizontal!" ,+ &
"SizeVertical!" ,+ &
"SlideAllAbove!" ,+ &
"SlideDirectlyAbove!" ,+ &
"SlideLeft!" ,+ &
"SlideNoneAbove!" ,+ &
"Sort!" ,+ &
"SpaceHorizontal!" ,+ &
"SpaceVertical!" ,+ &
"SQL!" ,+ &
"Start!" ,+ &
"Start5!" ,+ &
"StartPipeline!" ,+ &
"StartRemoteDebugging!" ,+ &
"StaticHyperLink!" ,+ &
"StaticHyperLink1!" ,+ &
"StaticHyperLink2!" ,+ &
"StaticText!" ,+ &
"StaticText1!" ,+ &
"StaticText2!" ,+ &
"Step!" ,+ &
"StepIn!" ,+ &
"StepOut!" ,+ &
"StepOver!" ,+ &
"StopDebugging!" ,+ &
"Strikethrough!" ,+ &
"Structure!" ,+ &
"StyleLibraryList!" ,+ &
"StyleLibraryList5!" ,+ &
"Synchronizer!" ,+ &
"SystemTree!" ,+ &
"Tab!" ,+ &
"Tab1!" ,+ &
"Tab2!" ,+ &
"Table!" ,+ &
"Tables!" ,+ &
"TabOrder!" ,+ &
"Tile!" ,+ &
"ToDoList!" ,+ &
"TreeView!" ,+ &
"TreeView1!" ,+ &
"TreeView2!" ,+ &
"Uncomment!" ,+ &
"Underline!" ,+ &
"Undo!" ,+ &
"UnionReturn!" ,+ &
"Update!" ,+ &
"Update5!" ,+ &
"UpdateReturn!" ,+ &
"UserObject!" ,+ &
"UserObject1!" ,+ &
"UserObject2!" ,+ &
"VCRFirst!" ,+ &
"VCRLast!" ,+ &
"VCRNext!" ,+ &
"VCRPrior!" ,+ &
"ViewPainter!" ,+ &
"VProgressBar!" ,+ &
"VProgressBar1!" ,+ &
"VProgressBar2!" ,+ &
"VScrollBar!" ,+ &
"VScrollBar1!" ,+ &
"VScrollBar2!" ,+ &
"VTrackBar!" ,+ &
"VTrackBar1!" ,+ &
"VTrackBar2!" ,+ &
"Watcom!" ,+ &
"Where!" }

ll_cnt = UpperBound(ls_picturenanme[])
For i = 1 To ll_cnt
	This.AddPicture(ls_picturenanme[i])
	This.AddItem(ls_picturenanme[i],i)
Next



end event

