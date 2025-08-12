
; AZJIO
; 30.06.2022
; 07.08.2021

EnableExplicit


CompilerSelect #PB_Compiler_OS
	CompilerCase #PB_OS_Windows
		Global UserIntLang, *Lang
		If OpenLibrary(0, "kernel32.dll")
			*Lang = GetFunction(0, "GetUserDefaultUILanguage")
			If *Lang
				UserIntLang = CallFunctionFast(*Lang)
			EndIf
			CloseLibrary(0)
		EndIf
	CompilerCase #PB_OS_Linux
		Global UserIntLang$
		If ExamineEnvironmentVariables()
		    While NextEnvironmentVariable()
		    	If Left(EnvironmentVariableName(), 4) = "LANG"
; 		    		LANG=ru_RU.UTF-8
; 		    		LANGUAGE=ru
					UserIntLang$ = Left(EnvironmentVariableValue(), 2)
					Break
				EndIf
		    Wend
		EndIf
CompilerEndSelect


Global Dim Lng.s(54)
Lng(1) = "Name"
Lng(2) = "Level"
Lng(3) = "Path"
Lng(4) = "Add File"
Lng(5) = "Add Folder"
Lng(6) = "Add CSV List"
Lng(7) = "Save to CSV List"
Lng(8) = "All"
Lng(9) = "Select"
Lng(10) = "Start Duplicate Search"
Lng(11) = "Delete duplicates marked with the checkbox"
Lng(12) = "Clear both lists"
Lng(13) = "Mask"
Lng(14) = "Found"
Lng(15) = "Remove from list"
Lng(16) = "-2 - Complete prohibition of deletion"
Lng(17) = "-1 - Will not be marked with a deletion checkbox"
Lng(18) = "0 - Deletion last"
Lng(19) = "1 - Deletion level"
Lng(20) = "2 - Deletion first"
Lng(21) = "Set Level"
Lng(22) = "Open location"
Lng(23) = "Open file"
Lng(24) = "Save Results"
Lng(25) = "A number from 0 and up"
Lng(26) = "All (*.*)|*.*"
Lng(27) = "Open"
Lng(28) = "Save CSV from result?"
Lng(29) = "Yes - Save from search results (fast, but duplicates)"
Lng(30) = "No - recalculate for all files in the top list"
Lng(31) = "List (*.csv)|*.csv"
Lng(32) = "Set Mask"
Lng(33) = "Enumeration png;gif;jpg or mask *.htm*"
Lng(34) = "Possible error"
Lng(35) = "A filter must not contain mask elements. A filter is an enumeration of extensions, and a mask is a wildcard."
Lng(36) = "Save"
Lng(37) = "List of duplicates.txt"
Lng(38) = "Text (*.txt)|*.txt"
Lng(39) = "Text (*.csv)|*.csv"
Lng(40) = "Cancel"
Lng(41) = "Such path already exists"
Lng(42) = "Is part of the path"
Lng(43) = "Open file as CSV?"
Lng(44) = "Delete errors"
Lng(45) = "More than 20 deletion errors, so copied to clipboard"
Lng(46) = "File search"
Lng(47) = "Continue?"
Lng(48) = "Calculate MD5 for "
Lng(49) = "Top files by size:"
Lng(50) = "Preparing output"
Lng(51) = "Completed! Groups: "
Lng(52) = ", duplicates: "
Lng(53) = ", marked: "
Lng(54) = ", completed for "

CompilerSelect #PB_Compiler_OS
	CompilerCase #PB_OS_Windows
		If UserIntLang = 1049
    CompilerCase #PB_OS_Linux
		If UserIntLang$ = "ru"
CompilerEndSelect
	Lng(1) = "Имя"
	Lng(2) = "Уровень"
	Lng(3) = "Путь"
	Lng(4) = "Добавить файл"
	Lng(5) = "Добавить папку"
	Lng(6) = "Добавить список CSV"
	Lng(7) = "Сохранить в список CSV"
	Lng(8) = "Все"
	Lng(9) = "Выделить"
	Lng(10) = "Начать поиск дубликатов"
	Lng(11) = "Удалить дубликаты отмеченные флажком"
	Lng(12) = "Очистить оба списка"
	Lng(13) = "Маска"
	Lng(14) = "Найдено"
	Lng(15) = "Убрать из списка"
	Lng(16) = "-2 - Полный запрет удаления"
	Lng(17) = "-1 - Не будет отмечаться галочкой удаления"
	Lng(18) = "0 - Удаление в последнюю очередь"
	Lng(19) = "1 - Уровень удаления"
	Lng(20) = "2 - Удаление в первую очередь"
	Lng(21) = "Задать уровень"
	Lng(22) = "Открыть расположение"
	Lng(23) = "Открыть файл"
	Lng(24) = "Сохранить результаты"
	Lng(25) = "Число от 0 и выше"
	Lng(26) = "Все (*.*)|*.*"
	Lng(27) = "Открыть"
	Lng(28) = "Сохранить CSV из результата?"
	Lng(29) = "Да - Сохранить из результатов поиска (быстро, но дубликаты)"
	Lng(30) = "Нет - заново вычислить для всех файлов верхнего списка"
	Lng(31) = "Список (*.csv)|*.csv"
	Lng(32) = "Задать маску"
	Lng(33) = "Перечисление png;gif или маску *.jpg*"
	Lng(34) = "Возможная ошибка"
	Lng(35) = "Фильтр не должен содержать элементы маски. Фильтр это перечисление расширений, а маска это wildcard."
	Lng(36) = "Сохранить"
	Lng(37) = "Список дубликатов.txt"
	Lng(38) = "Текст (*.txt)|*.txt"
	Lng(39) = "Текст (*.csv)|*.csv"
	Lng(40) = "Отмена"
	Lng(41) = "Такой путь уже существует"
	Lng(42) = "Является частью пути"
	Lng(43) = "Открыть файл как CSV?"
	Lng(44) = "Ошибки удаления"
	Lng(45) = "Ошибок удаления больше 20, поэтому скопированы в буфер обмена"
	Lng(46) = "Поиск файлов"
	Lng(47) = "Продолжить?"
	Lng(48) = "Вычислить MD5 для "
	Lng(49) = "Топовые файлы по размеру:"
	Lng(50) = "Подготовка вывода результатов"
	Lng(51) = "Завершено! Групп: "
	Lng(52) = ", дубликатов: "
	Lng(53) = ", отмеченных: "
	Lng(54) = ", выполнено за "
EndIf


UseMD5Fingerprint()

XIncludeFile "func.pbi"

Structure Lst1
	Path.s ; Путь файла
	Level.i ; какой уровень удаления
	idx.i ; какому списку принадлежит
EndStructure

Structure DataFSL
	Size.q ; размер числом
	md5.s ; размер числом
	List Lst1.Lst1()
EndStructure


#LevelCSV = -3
#LevelLVGroup = -4

; CompilerSelect #PB_Compiler_OS
; 	CompilerCase #PB_OS_Windows
; 		#delim$ = " "
; 	CompilerCase #PB_OS_Linux
; 		#delim$ = #TAB$
; CompilerEndSelect

#File = 0
#Window = 0
#Menu1 = 0
#Menu2 = 1
; #RegExp = 0

;- Перечисления
Enumeration Gadget
	#Container1
	#Container2
	#ListIcon1
	#ListIcon2
	#StatusBar
	#Splitter
	#BtnSearch
	#BtnDelete
	#BtnClear
	#BtnSet
	#BtnAddFolder
	#BtnAddFile
	#BtnAddCSV
	#BtnSaveCSV
	#ChAutoSel
EndEnumeration

Enumeration mItem
	#mDelElem
	#mLevelm2
	#mLevelm1
	#mLevel0
	#mLevel1
	#mLevel2
	#mLevelSet
	#mOpenFo
	#mOpenFi
	#mSaveRes
EndEnumeration

Define w, h, w3, h3, w1, w2, h1, h2, tmp, event1, i, tmp$, tmp2$
Define ListIconStyle
; Define tmp$, EvGad

;- Деклар
Declare AddList(tmp$, type = 0)
Declare ChAll()
Declare Align()
Declare SaveRes()
Declare Compare(*Valie)
Declare DeleteFileList2()
Declare SaveCSV()
Declare SaveCSV2()
Declare OpenFileMenu(mode)
Declare FileSearch(Map DataFSL.DataFSL(), sPath.s, level.i = 0, idx.i = 0)

CompilerIf  #PB_Compiler_OS = #PB_OS_Linux
	; https://www.purebasic.fr/english/viewtopic.php?p=531374#p531374
	ImportC ""
		gtk_window_set_icon(a.l,b.l)
	EndImport
CompilerEndIf

InitNetwork()
UseGIFImageDecoder()

DataSection
	CompilerIf  #PB_Compiler_OS = #PB_OS_Linux
		IconTitle:
		IncludeBinary "images" + #PS$ + "Search_duplicates.gif"
		IconTitleend:
	CompilerEndIf
	Icon1:
	IncludeBinary "images" + #PS$ + "1.gif"
	Icon1end:
	Icon2:
	IncludeBinary "images" + #PS$ + "2.gif"
	Icon2end:
	Icon3:
	IncludeBinary "images" + #PS$ + "3.gif"
	Icon3end:
	Icon4:
; 	IncludeBinary "images" + #PS$ + "4.gif"
	IncludeBinary "images" + #PS$ + "Filter.gif"
	Icon4end:
	Icon5:
	IncludeBinary "images" + #PS$ + "5.gif"
	Icon5end:
	Icon6:
	IncludeBinary "images" + #PS$ + "6.gif"
	Icon6end:
	Icon7:
	IncludeBinary "images" + #PS$ + "7.gif"
	Icon7end:
	Icon8:
	IncludeBinary "images" + #PS$ + "8.gif"
	Icon8end:
	Icon9:
	IncludeBinary "images" + #PS$ + "9.gif"
	Icon9end:
	Icon10:
	IncludeBinary "images" + #PS$ + "10.gif"
	Icon10end:
	Icon11:
	IncludeBinary "images" + #PS$ + "11.gif"
	Icon11end:
	Icon12:
	IncludeBinary "images" + #PS$ + "12.gif"
	Icon12end:
	Icon13:
	IncludeBinary "images" + #PS$ + "13.gif"
	Icon13end:
	Icon14:
	IncludeBinary "images" + #PS$ + "14.gif"
	Icon14end:
	Icon15:
	IncludeBinary "images" + #PS$ + "15.gif"
	Icon15end:
	ini:
	IncludeBinary "sample.ini"
	iniend:
EndDataSection

CompilerIf  #PB_Compiler_OS = #PB_OS_Linux
	CatchImage(0, ?IconTitle)
CompilerEndIf
CatchImage(1, ?Icon1)
CatchImage(2, ?Icon2)
CatchImage(3, ?Icon3)
CatchImage(4, ?Icon4)
CatchImage(5, ?Icon5)
CatchImage(6, ?Icon6)
CatchImage(7, ?Icon7)
CatchImage(8, ?Icon8)
CatchImage(9, ?Icon9)
CatchImage(10, ?Icon10)
CatchImage(11, ?Icon11)
CatchImage(12, ?Icon12)
CatchImage(13, ?Icon13)
CatchImage(14, ?Icon14)
CatchImage(15, ?Icon15)
; CatchImage(5, ?Icon5)


Global CSV2$
Global NewList mask.s()
Global MaskMem$ = "*"

Global ini$
Global PseudoHashSize = 50000
Global GrColor = $8080ff

Define w = 600
Define h = 500
Define SplitterPos = 200
Define SplitterPos3
; Define tagS.String


;- ini
ini$ = GetPathPart(ProgramFilename()) + "Search_duplicates.ini"
If FileSize(ini$) < 8
	; 	Если рядом с прогой файла нет, то прога не портабельная и ищем конфиг в папках конфигов
	; 		Создаём в AppData\Roaming, если в текущей не удалось
	CompilerSelect #PB_Compiler_OS
		CompilerCase #PB_OS_Windows
			ini$ = GetUserDirectory(#PB_Directory_ProgramData) + "Search_duplicates\" + GetFilePart(ProgramFilename(), #PB_FileSystem_NoExtension) + ".ini"
		CompilerCase #PB_OS_Linux
			ini$ = GetHomeDirectory() + ".config/Search_duplicates/Search_duplicates.ini"
	CompilerEndSelect
	; 	Создаёт ini если не существует
	If FileSize(ini$) < 8 And ForceDirectories(GetPathPart(ini$))
		SaveFile_Buff(ini$, ?ini, ?iniend - ?ini)
	EndIf
EndIf
; Debug ini$
If FileSize(ini$) > 3 And OpenPreferences(ini$)
	PreferenceGroup("Set")
	; 	ini$ = ReadPreferenceString("ini$", ini$)
	GrColor = ColorValidate(ReadPreferenceString("GrColor", ""), GrColor)
	PseudoHashSize = ReadPreferenceInteger("PseudoHashSize", PseudoHashSize)
	If PseudoHashSize < 310
		PseudoHashSize = 50000
	EndIf
	h = ReadPreferenceInteger("WinHeight", h)
	w = ReadPreferenceInteger("WinWidth", w)
	SplitterPos = ReadPreferenceInteger("SplitterPos", SplitterPos)
	If SplitterPos < 100 Or SplitterPos > h - 100
		SplitterPos = h/2
	EndIf
	ClosePreferences()
EndIf


CompilerSelect #PB_Compiler_OS
	CompilerCase #PB_OS_Windows
		ListIconStyle = #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection | #LVS_NOCOLUMNHEADER
	CompilerCase #PB_OS_Linux
		ListIconStyle = #PB_ListIcon_FullRowSelect | #PB_ListIcon_AlwaysShowSelection
CompilerEndSelect

w3 = w
h3 = h
SplitterPos3 = SplitterPos

;- GUI
If OpenWindow(#Window, 0, 0, w, h, "Search duplicates", #PB_Window_SystemMenu | #PB_Window_SizeGadget | #PB_Window_MaximizeGadget | #PB_Window_MinimizeGadget | #PB_Window_ScreenCentered)
	CompilerIf  #PB_Compiler_OS = #PB_OS_Linux
		gtk_window_set_icon_(WindowID(#Window), ImageID(0)) ; назначаем иконку в заголовке
	CompilerEndIf

	WindowBounds(#Window, 390, 250, #PB_Ignore, #PB_Ignore)

	ContainerGadget(#Container1, 0, 0, 0, 0)



	ListIconGadget(#ListIcon1, 3, 5, w - 6, 200, Lng(1), 120, ListIconStyle)
	AddGadgetColumn(#ListIcon1, 1 , Lng(2) , 30)
	AddGadgetColumn(#ListIcon1, 2 , Lng(3) , 400)
	; ButtonGadget(#BtnINI, 550, 220, 28, 28, "ini")
	ButtonImageGadget(#BtnAddFile, 50, 220, 28, 28, ImageID(6))
	GadgetToolTip(#BtnAddFile, Lng(4))
	ButtonImageGadget(#BtnAddFolder, 10, 220, 28, 28, ImageID(5))
	GadgetToolTip(#BtnAddFolder, Lng(5))
	ButtonImageGadget(#BtnAddCSV, 90, 220, 28, 28, ImageID(7))
	GadgetToolTip(#BtnAddCSV, Lng(6))
	ButtonImageGadget(#BtnSaveCSV, 130, 220, 28, 28, ImageID(8))
	GadgetToolTip(#BtnSaveCSV, Lng(7))
; 	DisableGadget(#BtnSaveCSV, 1) ; отключен так как не прописано действие
; 	HideGadget(#BtnSaveCSV, 1)	  ; отключен так как не прописано действие
								  ; GadgetToolTip(#BtnClear, "Очистить" + #delim$ + "Ctrl+Del")

	CheckBoxGadget(#ChAutoSel, 170, 220, 90, 28, Lng(8))
	GadgetToolTip(#ChAutoSel, Lng(9))
; 	HideGadget(#ChAutoSel, #True)

	ButtonImageGadget(#BtnSearch, 550, 220, 28, 28, ImageID(1))
	GadgetToolTip(#BtnSearch, Lng(10))
	ButtonImageGadget(#BtnDelete, 510, 220, 28, 28, ImageID(2))
	GadgetToolTip(#BtnDelete, Lng(11))
	ButtonImageGadget(#BtnClear, 470, 220, 28, 28, ImageID(3))
	GadgetToolTip(#BtnClear, Lng(12))
	ButtonImageGadget(#BtnSet, 430, 220, 28, 28, ImageID(4))
	GadgetToolTip(#BtnSet, Lng(13))
; 	GadgetToolTip(#BtnSet, "Настройка")
; 	DisableGadget(#BtnSet, 1) ; отключен так как не прописано действие
; 	HideGadget(#BtnSet, 1)	  ; отключен так как не прописано действие

	CloseGadgetList()

	ContainerGadget(#Container2, 0, 0, 0, 0)

	ListIconGadget(#ListIcon2, 3, 5, w - 6, 200, Lng(14), 500, ListIconStyle | #PB_ListIcon_CheckBoxes | #PB_ListIcon_ThreeState)
	; GadgetToolTip(#BtnCopySel, "Скопировать снизу вверх" + #delim$ + "Ctrl+Стрелка вверх")
							  ; GadgetToolTip(#BtnTranslator, "Перевести" + #delim$ + "Ctrl+Enter")
; 	TextGadget(#StatusBar, 4, 220, 420, 28, "AZJIO   2021.08.11", #PB_Text_Border)

	CloseGadgetList()
	CreateStatusBar(#StatusBar, WindowID(#Window))
	AddStatusBarField(#PB_Ignore)
	StatusBarText(#StatusBar, 0, "AZJIO   v9.5   2022.06.30")




	; 	TextGadget(#StatusBar, 300, 462, 180, 30, "", #PB_Text_Border)

	SplitterGadget(#Splitter, 0, 0, w, h, #Container1, #Container2, #PB_Splitter_Separator)
	SetGadgetAttribute(#Splitter, #PB_Splitter_FirstMinimumSize, 120)
	SetGadgetAttribute(#Splitter, #PB_Splitter_SecondMinimumSize, 120)

	ResizeGadget(#Splitter, #PB_Ignore, #PB_Ignore, w, h - 20)
	SetGadgetState(#Splitter , SplitterPos)

	;- Menu
	If CreatePopupImageMenu(#Menu1) ; Создаёт всплывающее меню
		MenuItem(#mDelElem, Lng(15), ImageID(2))
		MenuBar()
		MenuItem(#mLevelm2, Lng(16), ImageID(11))
		MenuItem(#mLevelm1, Lng(17), ImageID(10))
		MenuItem(#mLevel0, Lng(18), ImageID(9))
		MenuItem(#mLevel1, Lng(19), ImageID(9))
		MenuItem(#mLevel2, Lng(20), ImageID(9))
		MenuItem(#mLevelSet, Lng(21), ImageID(9))
	EndIf
	If CreatePopupImageMenu(#Menu2) ; Создаёт всплывающее меню
		MenuItem(#mOpenFo, Lng(22), ImageID(12))
		MenuItem(#mOpenFi, Lng(23), ImageID(14))
		MenuItem(#mSaveRes, Lng(24), ImageID(8))
	EndIf
	; 	Select EventType()
	; 		Case #PB_EventType_RightClick
	; 			DisplayPopupMenu(#MenuCont, WindowID(#Window))
	; 	EndSelect

	; 	SetGadgetText(#Edit1, "привет") ; для быстрого теста
	; 	SetGadgetText(#Edit1, "Hello") ; для быстрого теста
	; 	SetGadgetText(#Edit1, "Привет ребята") ; для быстрого теста

	If CountProgramParameters()
		AddList(ProgramParameter(0), 0)
	EndIf

	; 				регистрируем быстрые клавиши
	AddKeyboardShortcut(#Window, #PB_Shortcut_Control | #PB_Shortcut_Return , 0) ; перевести
	AddKeyboardShortcut(#Window, #PB_Shortcut_Control | #PB_Shortcut_Up , 1)	 ; перетащить выделенное вверх
	AddKeyboardShortcut(#Window, #PB_Shortcut_Control | #PB_Shortcut_Delete , 2) ; перетащить выделенное вверх

	; 	Активируем гаджеты, которые допускают перетаскивание на себя
	EnableGadgetDrop(#ListIcon1, #PB_Drop_Files, #PB_Drag_Copy)
	EnableGadgetDrop(#ListIcon2, #PB_Drop_Files, #PB_Drag_Copy)

;- цикл



	Repeat
		Select WaitWindowEvent()
			Case #PB_Event_GadgetDrop ; событие перетаскивания
				Select EventGadget()
					Case #ListIcon1, #ListIcon2 ; гаджеты, которые получили событие перетаскивания файлов/папок
						AddList(EventDropFiles(), 0)
				EndSelect
				; 			Case #PB_Event_ActivateWindow
				; 				SetActiveGadget(#ListIcon1)
			Case #PB_Event_Menu
				event1 = EventMenu()
				Select event1
					Case #mLevelm2 To #mLevel2
						i = GetGadgetState(#ListIcon1)
						If i <> -1
							SetGadgetItemText(#ListIcon1, i, Str(event1 - 3), 1)
						EndIf

						CompilerIf  #PB_Compiler_OS = #PB_OS_Windows
							Align()
						CompilerEndIf

					Case #mLevelSet
						i = GetGadgetState(#ListIcon1)
						If i <> -1
							tmp$ = InputRequester(Lng(21), Lng(25), "")
							If IsDigital(@tmp$)
								SetGadgetItemText(#ListIcon1, i, tmp$, 1)
							EndIf
						EndIf

					Case #mDelElem
						i = GetGadgetState(#ListIcon1)
						If i <> -1
							RemoveGadgetItem(#ListIcon1, i)
						EndIf

					Case #mSaveRes
						SaveRes()

					Case #mOpenFo
						OpenFileMenu(1)
					Case #mOpenFi
						OpenFileMenu(2)
				EndSelect


			Case #PB_Event_SizeWindow
				w = WindowWidth(#Window)
				h = WindowHeight(#Window)
				; 				Debug h
				ResizeGadget(#Splitter, #PB_Ignore, #PB_Ignore, w, h - 20)
			Case #PB_Event_Gadget
				; 				EvGad = EventGadget()
				; 				Select EvGad
				Select EventGadget()
					Case #ListIcon2
						Select EventType()
							Case #PB_EventType_LeftClick
								i = GetGadgetState(#ListIcon2)
								If i <> -1
									tmp = GetGadgetItemData(#ListIcon2 , i)
									If tmp <= -4
										CompilerIf  #PB_Compiler_OS <> #PB_OS_Windows
											SetGadgetItemState(#ListIcon2, i, #PB_ListIcon_Inbetween | #PB_ListIcon_Selected)
										CompilerEndIf
									ElseIf tmp <= -2
										SetGadgetItemState(#ListIcon2, i, #PB_Checkbox_Unchecked | #PB_ListIcon_Selected)
									EndIf
								EndIf
							Case #PB_EventType_LeftDoubleClick
								OpenFileMenu(2)
							Case #PB_EventType_RightClick
								i = GetGadgetState(#ListIcon2)
								If i <> -1
									DisplayPopupMenu(#Menu2, WindowID(#Window))
								EndIf
						EndSelect
					Case #ListIcon1
						If EventType() = #PB_EventType_RightClick
							i = GetGadgetState(#ListIcon1)
							If i <> -1
								DisplayPopupMenu(#Menu1, WindowID(#Window))
							EndIf
						EndIf
					Case #ChAutoSel
						ChAll()
					Case #BtnSearch
						Compare(2)
; 						CreateThread(@Compare(), 1)
					Case #BtnDelete
						DeleteFileList2()
					Case #BtnAddFile
						tmp$ = OpenFileRequester(Lng(23), "", Lng(26), 0, #PB_Requester_MultiSelection)
						If Asc(tmp$)
							tmp2$ = ""
							While tmp$
								tmp2$ + tmp$ + Chr(10)
								tmp$ = NextSelectedFileName()
							Wend
							tmp2$ = RTrim(tmp2$, Chr(10))
							AddList(tmp2$, 2)
						EndIf
					Case #BtnAddFolder
						tmp$ = PathRequester(Lng(27), GetCurrentDirectory())
						If Asc(tmp$)
							tmp$ = RTrim(tmp$, #PS$)
							AddList(tmp$, 1)
						EndIf
					Case #BtnSaveCSV
						If CountGadgetItems(#ListIcon2) And MessageRequester(Lng(28), Lng(29) + #LF$ + Lng(30), #PB_MessageRequester_YesNo) = #PB_MessageRequester_Yes
							SaveCSV()
						Else
							SaveCSV2()
						EndIf
					Case #BtnAddCSV
						tmp$ = OpenFileRequester(Lng(23), "", Lng(31), 0)
						If Asc(tmp$)
							AddList(tmp$, 3)
						EndIf
					Case #BtnSet
						MaskMem$ = InputRequester("Задать фильтр или маску", "Перечисление jpg;png;gif или маску *.htm*", MaskMem$)
						ClearList(mask())
						If FindString(MaskMem$, ";")
							If FindString(MaskMem$, "*")
								MessageRequester(Lng(34),  Lng(35))
							EndIf
							SplitL(MaskMem$, mask(), ";")
						Else
							If AddElement(mask())
								mask() = MaskMem$
							EndIf
						EndIf

						
					Case #BtnClear
						ClearGadgetItems(#ListIcon1)
						ClearGadgetItems(#ListIcon2)
						SetGadgetState(#ChAutoSel, #PB_Checkbox_Unchecked)
						StatusBarText(#StatusBar, 0, "")
					Case #Container1
						If EventType() = #PB_EventType_Resize
							w1 = GadgetWidth(#Container1)
							h1 = GadgetHeight(#Container1)
							ResizeGadget(#ListIcon1, #PB_Ignore, #PB_Ignore, w1 - 6, h1 - 45)
							ResizeGadget(#BtnAddFile, #PB_Ignore, h1 - 37, #PB_Ignore, #PB_Ignore)
							ResizeGadget(#BtnAddFolder, #PB_Ignore, h1 - 37, #PB_Ignore, #PB_Ignore)
							ResizeGadget(#BtnAddCSV, #PB_Ignore, h1 - 37, #PB_Ignore, #PB_Ignore)
							ResizeGadget(#BtnSaveCSV, #PB_Ignore, h1 - 37, #PB_Ignore, #PB_Ignore)
							ResizeGadget(#ChAutoSel, #PB_Ignore, h1 - 35, #PB_Ignore, #PB_Ignore)

							ResizeGadget(#BtnSearch, w1-50, h1 - 37, #PB_Ignore, #PB_Ignore)
							ResizeGadget(#BtnDelete, w1-90, h1 - 37, #PB_Ignore, #PB_Ignore)
							ResizeGadget(#BtnClear, w1-130, h1 - 37, #PB_Ignore, #PB_Ignore)
							ResizeGadget(#BtnSet, w1-170, h1 - 37, #PB_Ignore, #PB_Ignore)
						EndIf
					Case #Container2
						If EventType() = #PB_EventType_Resize
							w2 = GadgetWidth(#Container2)
							h2 = GadgetHeight(#Container2)
							ResizeGadget(#ListIcon2, #PB_Ignore, #PB_Ignore, w2 - 6, h2 - 12)
; 							ResizeGadget(#StatusBar, 4, h2 - 37, w2 - 174, #PB_Ignore)
							SplitterPos = GetGadgetState(#Splitter)
						EndIf
				EndSelect
			Case #PB_Event_CloseWindow
				; 				Сохранение размеров окна только при его изменении относительно стартовых значений
				If w3 <> w Or h3 <> h Or SplitterPos3 <> SplitterPos
					If FileSize(ini$) > 3 And OpenPreferences(ini$) And PreferenceGroup("Set")
						WritePreferenceInteger("WinHeight", h)
						WritePreferenceInteger("WinWidth", w)
						WritePreferenceInteger("SplitterPos", SplitterPos)
						ClosePreferences()
					EndIf
				EndIf
				CloseWindow(#Window)
				Break
		EndSelect
	ForEver
EndIf

Procedure OpenFileMenu(mode)
	Protected i, tmp$
	If CountGadgetItems(#ListIcon2)
		i = GetGadgetState(#ListIcon2)
		If i <> -1
			tmp$ = GetGadgetItemText(#ListIcon2 , i)
			Select mode
				Case 2
					CompilerSelect #PB_Compiler_OS
						CompilerCase #PB_OS_Windows
							RunProgram(tmp$)
						CompilerCase #PB_OS_Linux
							RunProgram("xdg-open", Chr(34) + tmp$ + Chr(34), GetPathPart(tmp$))
					CompilerEndSelect
				Case 1
					CompilerSelect #PB_Compiler_OS
						CompilerCase #PB_OS_Windows
							RunProgram("explorer.exe", "/select," + Chr(34) + tmp$ + Chr(34), "")
						CompilerCase #PB_OS_Linux
							RunProgram("xdg-open", Chr(34) + GetPathPart(tmp$) + Chr(34), "")
					CompilerEndSelect
			EndSelect
		EndIf
	EndIf
EndProcedure

Procedure ChAll()
	Protected CountLV, i, n

	CountLV = CountGadgetItems(#ListIcon2)
	If CountLV
		If GetGadgetState(#ChAutoSel) = #PB_Checkbox_Checked
			For i = 0 To CountLV - 1

; 				s = GetGadgetState(#ListIcon2)

				Select GetGadgetItemData(#ListIcon2 , i)
					Case -1, -2, #LevelCSV
						SetGadgetItemState(#ListIcon2, i, #PB_Checkbox_Unchecked)
					Case #LevelLVGroup
						n = -1
						CompilerIf  #PB_Compiler_OS <> #PB_OS_Windows
							SetGadgetItemState(#ListIcon2, i, #PB_ListIcon_Inbetween)
						CompilerEndIf
					Default
						n + 1
						If n
							SetGadgetItemState(#ListIcon2, i, #PB_ListIcon_Checked)
						EndIf
				EndSelect
; 				SetGadgetItemState(#ListIcon2, i, #PB_ListIcon_Checked)
			Next
		Else
			For i = 0 To CountLV - 1
				SetGadgetItemState(#ListIcon2, i, #PB_Checkbox_Unchecked)
			Next
		EndIf
	EndIf
EndProcedure



CompilerIf  #PB_Compiler_OS = #PB_OS_Windows
	Procedure Align()
		Protected i
		If CountGadgetItems(#ListIcon1)
			; 			Выравниваем 3 колонки по содержимому
			For i = 0 To 2
				SetGadgetItemAttribute(#ListIcon1 , 0 , #PB_ListIcon_ColumnWidth , -1, i)
			Next
		EndIf
	EndProcedure
CompilerEndIf


CompilerIf  #PB_Compiler_OS = #PB_OS_Windows
; https://www.purebasic.fr/english/viewtopic.php?p=492378#p492378
Procedure.s GetStatusBarText(StatusbarNumber, FieldNumber)

   Protected StringBufferLength.l, StringBuffer.s

   StringBufferLength = SendMessage_(StatusBarID(StatusbarNumber), #SB_GETTEXTLENGTH, FieldNumber, 0)

   If StringBufferLength
      StringBuffer = Space(StringBufferLength)
      SendMessage_(StatusBarID(StatusbarNumber), #SB_GETTEXT, FieldNumber, @StringBuffer)
      If Asc(StringBuffer) <> ' '
         ProcedureReturn StringBuffer
      Else
         ProcedureReturn ""
      EndIf
   Else
      ProcedureReturn ""
   EndIf

EndProcedure
CompilerEndIf


Procedure SaveRes()
	Protected CountLV, i, tmp$, File$, file_id, Pos

	CountLV = CountGadgetItems(#ListIcon2)
	If Not CountLV
	    ProcedureReturn
	EndIf
	File$ = SaveFileRequester(Lng(36), Lng(37), Lng(38), 0)
	If Asc(File$)
		If Right(File$, 4) <> ".txt"
			File$ + ".txt"
		EndIf
	Else
	    ProcedureReturn
	EndIf

	file_id = CreateFile(#PB_Any, File$)
	If file_id
		WriteStringFormat(file_id, #PB_UTF8)
		For i = 0 To CountLV - 1
			tmp$ = GetGadgetItemText(#ListIcon2 , i)
			WriteStringN(file_id , tmp$, #PB_UTF8)
		Next
		CompilerIf  #PB_Compiler_OS = #PB_OS_Windows
			tmp$ =GetStatusBarText(#StatusBar, 0)
			; tmp$ = GetGadgetText(#StatusBar)
			WriteStringN(file_id , tmp$, #PB_UTF8)
		CompilerEndIf
		CloseFile(file_id)
	EndIf
EndProcedure

Procedure SaveCSV()
	Protected CountLV, i, tmp$, File$, file_id, Pos

	CountLV = CountGadgetItems(#ListIcon2)
	If Not CountLV
	    ProcedureReturn
	EndIf
	File$ = SaveFileRequester(Lng(36), "", Lng(39), 0)
	If Asc(File$)
		If Right(File$, 4) <> ".csv"
			File$ + ".csv"
		EndIf
	Else
	    ProcedureReturn
	EndIf

	file_id = CreateFile(#PB_Any, File$)
	If file_id
		WriteStringFormat(file_id, #PB_UTF8)
		For i = 0 To CountLV - 1
			If GetGadgetItemData(#ListIcon2 , i) = #LevelLVGroup
				tmp$ = GetGadgetItemText(#ListIcon2 , i)
				Pos = FindString(tmp$, "    ::", 17)
				If Pos
					WriteStringN(file_id , Mid(tmp$, Pos + 6), #PB_UTF8)
				EndIf
			EndIf
		Next
		CloseFile(file_id)
	EndIf
EndProcedure

Procedure SaveCSV2()
	Protected CountLV, File$, file_id

	CountLV = CountGadgetItems(#ListIcon1)
	If Not CountLV
	    ProcedureReturn
	EndIf
	File$ = SaveFileRequester(Lng(36), "", Lng(39), 0)
	If Asc(File$)
		If Right(File$, 4) <> ".csv"
			File$ + ".csv"
		EndIf
	Else
	    ProcedureReturn
	EndIf

	file_id = CreateFile(#PB_Any, File$)
	If file_id
		Compare(3) ; переделать, так как функция сравнения уже не подходит
		WriteStringFormat(file_id, #PB_UTF8)
		WriteString(file_id, CSV2$, #PB_UTF8)
		CloseFile(file_id)
	EndIf
	CSV2$ = ""
EndProcedure

Procedure AddList(tmp$, type = 0)
	Protected i, Count
	Protected NewList items.s()
	; 	Protected NewList itemsOld.s()
	; 	tmp$ = EventDropFiles() ; получаем список
	; 	tmp$ = StringField(tmp$, 1, Chr(10)) ; берём только первый элемент
	SplitL(tmp$, items(),  Chr(10)) ; импортируем текст в список

	; 	tmp$ = ""
	Count = CountGadgetItems(#ListIcon1) ; если список не пуст то проверяем, чтобы не добавить одно и тоже повторно
	If Count
		For i = 0 To Count - 1
			tmp$ = GetGadgetItemText(#ListIcon1, i, 2)
			ForEach items()
				If items() = tmp$
					MessageRequester(Lng(40), Lng(41) + #LF$ + tmp$)
					ProcedureReturn
				Else
					If Len(tmp$) > Len(items())
						If FindString(Chr(1) + tmp$, Chr(1) + items() + #PS$, 1, #PB_String_NoCase) ; Windows без учёта регистра
							MessageRequester(Lng(40), Lng(42) + #LF$ + items())
							ProcedureReturn
						EndIf
					Else
						If FindString(Chr(1) + items(), Chr(1) + tmp$ + #PS$, 1, #PB_String_NoCase) ; Windows без учёта регистра
							MessageRequester(Lng(40), Lng(42) + #LF$ + tmp$)
							ProcedureReturn
						EndIf
					EndIf
				EndIf
				; 				If AddElement(itemsOld())
				; 					itemsOld() = GetGadgetItemText(#ListIcon1, i, 2)
				; 				EndIf
			Next
		Next
	EndIf

	i = Count
	ForEach items()
		If FileSize(items()) = -2 ; если папка, то вставляем, иначе очищаем
								  ; 			SetGadgetItemImage(#ListIcon1 , -1 ,  ImageID(12))
			AddGadgetItem(#ListIcon1, i, GetFilePart(items()), ImageID(12)) ; имя файла
			SetGadgetItemText(#ListIcon1, i, "0", 1)
			SetGadgetItemText(#ListIcon1, i, items(), 2)
			SetGadgetItemData(#ListIcon1, i, 1)
		Else
			If LCase(GetExtensionPart(items())) = "csv"
				If type = 3 Or MessageRequester("CSV?", Lng(43), #PB_MessageRequester_YesNo) = #PB_MessageRequester_Yes
					; 				AddGadgetItem(#ListIcon1, -1, items(), ImageID(15))
					AddGadgetItem(#ListIcon1, i, "<" + GetFilePart(items()) + ">", ImageID(15)) ; имя файла
					SetGadgetItemText(#ListIcon1, i, "0", 1)
					SetGadgetItemText(#ListIcon1, i, items(), 2)
					SetGadgetItemData(#ListIcon1, i, 3)
				Else
					AddGadgetItem(#ListIcon1, i, GetFilePart(items()), ImageID(14)) ; имя файла
					SetGadgetItemText(#ListIcon1, i, "0", 1)
					SetGadgetItemText(#ListIcon1, i, items(), 2)
					SetGadgetItemData(#ListIcon1, i, 2)
				EndIf
			Else
				; 				AddGadgetItem(#ListIcon1, -1, items(), ImageID(14))
				AddGadgetItem(#ListIcon1, i, GetFilePart(items()), ImageID(14)) ; имя файла
				SetGadgetItemText(#ListIcon1, i, "0", 1)
				SetGadgetItemText(#ListIcon1, i, items(), 2)
				SetGadgetItemData(#ListIcon1, i, 2)
			EndIf
		EndIf
		i + 1
	Next

	CompilerIf  #PB_Compiler_OS = #PB_OS_Windows
		Align()
	CompilerEndIf

EndProcedure



Procedure DeleteFileList2()
	Protected CountLV, i, file$, Error$ = ""

	CountLV = CountGadgetItems(#ListIcon2)
	If CountLV
		For i = 0 To CountLV-1
			If GetGadgetItemState(#ListIcon2, i) & #PB_ListIcon_Checked
				If GetGadgetItemData(#ListIcon2 , i) < -1 ; пункт с красным замком игнорируется, а также CSV и номера групп
					Continue
				EndIf
				file$ = GetGadgetItemText(#ListIcon2, i)
				If Asc(file$) = 32 ;  пробел в начале групп, а нужна ли вторая защита, игнор групп уже осуществлён в проверке GetGadgetItemData()
					Continue
				EndIf
				If FileSize(file$) > -1
					If Not DeleteFile(file$)
						Error$ = "1 " + file$ + #LF$ ; ошибка 1 - файл не удалось удалить
					EndIf
				Else
					Error$ = "2 " + file$ + #LF$ ; ошибка 2 - файл не существует
				EndIf
			EndIf
		Next
	EndIf
	If Asc(Error$)
		If CountString(Error$, #LF$) > 20
			SetClipboardText(Error$)
			MessageRequester(Lng(44), Lng(45))
		Else
			MessageRequester(Lng(44), RTrim(Error$, #LF$))
		EndIf
	EndIf
EndProcedure



Procedure Compare(*Valie)
	Protected CountLV, i, k, type, item_txt$, md5$, Size$, level, n, idx, ch, tmp, tmp$, sz.q, tsz.q, tmpSt.DataFSL
	Protected file_id, Format, Pos
	Protected TimeCompare
	Protected NewMap DataFSL.DataFSL()
	Protected NewMap DataMD5.DataFSL()
	Protected NewMap TmpMD5.DataFSL()
	Protected NewList LstMD5.DataFSL()

	TimeCompare = ElapsedMilliseconds()


	ClearGadgetItems(#ListIcon2)

	StatusBarText(#StatusBar, 0, Lng(46))

	CountLV = CountGadgetItems(#ListIcon1)
	If CountLV = 0
		ProcedureReturn
	EndIf

	For i = 0 To CountLV
		type = GetGadgetItemData(#ListIcon1, i)
		level = Val(GetGadgetItemText(#ListIcon1, i, 1))
		item_txt$ = GetGadgetItemText(#ListIcon1, i, 2)
		Select type
			Case 1 ; папка
				FileSearch(DataFSL(), item_txt$, level, i)

			Case 2 ; файл
; 					Добавление файла в карту
				tmp = FileSize(item_txt$)
				Size$ = Str(tmp)
				If FindMapElement(DataFSL(), Size$) ; Если существует, то добавляем только путь
; 						FindMapElement устанавливает указатель на данный элемент, поэтому просто добавляем к нему элемент списка
					If AddElement(DataFSL()\Lst1())
						DataFSL()\Lst1()\Path = item_txt$
						DataFSL()\Lst1()\Level = level
						DataFSL()\Lst1()\idx = i
					EndIf
				Else ; иначе добавляем новый элемент
					If AddMapElement(DataFSL(), Size$)
						DataFSL()\Size = tmp
						If AddElement(DataFSL()\Lst1())
							DataFSL()\Lst1()\Path = item_txt$
							DataFSL()\Lst1()\Level = level
							DataFSL()\Lst1()\idx = i
						EndIf
					EndIf
				EndIf
			Case 3 ; csv
; 				MD5 надо сравнивать на стадии размеров, иначе будут удаляться только дубликаты.
				If FileSize(item_txt$) > -1
					file_id = ReadFile(#PB_Any, item_txt$)
					If file_id
						Format = ReadStringFormat(file_id)
						CompilerIf #PB_Compiler_OS = #PB_OS_Linux
							If Format = #PB_Ascii
								Format = #PB_UTF8
							EndIf
						CompilerEndIf
; 						CSV$ = ReadString(file_id, Format | #PB_File_IgnoreEOL)
						While Eof(file_id) = 0
							tmp$ = ReadString(file_id, Format)
							; 							Debug "|" + CSV$ + "|"
							Pos = FindString(tmp$, "|", 2)
; 							If AddMapElement(DataFSL(), StringField(tmp$, 2, "|"))
; 								DataFSL()\Size = Val(StringField(tmp$, 1, "|"))
							md5$ = Mid(tmp$, Pos + 1)
							tmp = Val(Left(tmp$, Pos - 1))
							Size$ = Str(tmp)
; 							MD5 ещё не вычислялся, а уже надо напичкать DataFSL() данными
							If Pos
								If FindMapElement(DataFSL(), Size$) ; Если существует, то добавляем только путь
				; 						FindMapElement устанавливает указатель на данный элемент, поэтому просто добавляем к нему элемент списка
									If AddElement(DataFSL()\Lst1())
										DataFSL()\Lst1()\Path = "*" + md5$ ; звёздочкой обозначим md5 от CSV, вместо пути
										DataFSL()\Lst1()\Level = #LevelCSV
										DataFSL()\Lst1()\idx = i
									EndIf
								Else ; иначе добавляем новый элемент
									If AddMapElement(DataFSL(), Size$)
										DataFSL()\Size = tmp
; 										DataFSL()\md5 = Mid(tmp$, Pos + 1) ; невозможно сейчас ставить md5, так как это список путей по размеру с разными md5
										If AddElement(DataFSL()\Lst1())
											DataFSL()\Lst1()\Path = "*" + md5$ ; звёздочкой обозначим md5 от CSV, вместо пути
											DataFSL()\Lst1()\Level = #LevelCSV
											DataFSL()\Lst1()\idx = i
										EndIf
									EndIf
								EndIf
							EndIf
						Wend
						CloseFile(file_id)
					EndIf
				EndIf


; DataMD5()
		EndSelect
	Next

; 		LSize$ = Str(MapSize(DataFSL()))
; 		SortStructuredList(FilesPS(), #PB_Sort_Ascending , OffsetOf(Files\Size) , TypeOf(Files\Size))

; 	Показать одинаковые файлы, сериал из 200 серий содержит 158 одинаковых по размеру, по 420 Мб файлов и
; 	вычисление MD5 происходит слишком долго, было бы выгоднее сравнить первые 2 Мб или по 100кб в разных позициях
; 	ForEach DataFSL()
; 		If ListSize(DataFSL()\Lst1()) <> 1
; 			ForEach DataFSL()\Lst1()
; 				Debug DataFSL()\Size
; 				Debug DataFSL()\Lst1()\Path
; 			Next
; 		EndIf
; 	Next
; 	ProcedureReturn
; 	Конец: Показать одинаковые файлы

	; 	 сейчас вычисляет с CSV, а это неправильно, сделать новый алгоритм, если есть CSV, то проверять число элементов CSV
	; 	 может отдельный список CSV сделать в карте DataFSL()  ? или добавить флаг, сколько элементов CSV в списке?

	; 	Вычисление тотального размера данных для вычисления MD5 и предложить не выполнять операцию если превысит 100 Мб,
	; 	при этом недостаточная скорость чтения со съёмного устройства.
	tsz = 0
	ForEach DataFSL()
		sz = ListSize(DataFSL()\Lst1())
		If sz <> 1
; 			ForEach DataFSL()\Lst1()
; 				Debug DataFSL()\Lst1()
; 			Next
			tsz + (sz * DataFSL()\Size)
		EndIf
	Next
	If tsz > 100000000
		sz = 0
		ForEach DataFSL()
			If DataFSL()\Size > sz And ListSize(DataFSL()\Lst1()) > 1
				sz = DataFSL()\Size
				tmpSt = DataFSL()
			EndIf
		Next
		tmp$ = ""
		ForEach tmpSt\Lst1()
			tmp$ + tmpSt\Lst1()\Path + #LF$
		Next
		If MessageRequester(Lng(47), Lng(48) + _ShortFileSize(tsz) + "?" + #LF$ + #LF$ +  Lng(49) + #LF$ + tmp$, #PB_MessageRequester_YesNo) = #PB_MessageRequester_No
			FreeMap(DataFSL())
			ProcedureReturn
		EndIf
	EndIf
; 	вывести статистику по большим файлам, чтобы видеть причину

	; 	Флаг для сохранения CSV файла, то есть часть обработки выполняется функцией сравнения,
	; 	а здесь разветвление на операцию сохранения CSV и выпрыг с возвратом результатов.
	If *Valie = 3
		CSV2$ = ""
		ForEach DataFSL()
; 			SelectElement(DataFSL()\Lst1(), 0)
; 			md5$ + DataFSL()\Size + "|" + FileFingerprint(DataFSL()\Lst1()\Path, #PB_Cipher_MD5) + #LF$ ; это добавлял только размер 1 раз, а надо MD5
			ForEach DataFSL()\Lst1()
				If Asc(DataFSL()\Lst1()\Path) = '*'
					md5$ = Mid(DataFSL()\Lst1()\Path, 2)
				Else
					md5$ = FileFingerprint(DataFSL()\Lst1()\Path, #PB_Cipher_MD5)
				EndIf
; 				У FindMapElement() преимущество перед #PB_Map_ElementCheck, что он не обновляет элемент, а игнорирует
				If Not FindMapElement(DataMD5(), md5$) ; Если не существует, то добавляем
					If Asc(md5$) ; если файл недоступен для чтения, то будет пустая строка, такое не добавляется
						CSV2$ + DataFSL()\Size + "|" + md5$ + #LF$
					EndIf
					AddMapElement(DataMD5(), md5$)
				EndIf
			Next
		Next
		ProcedureReturn
	EndIf










; 	Перебираем списки одного размера, получая 32 байта из разных позиций
	ForEach DataFSL()
		tmp = 1
		If ListSize(DataFSL()\Lst1()) = 1
; 			удаление элемента из карты, который не имеет дубликатов (один элемент в списке)
			DeleteMapElement(DataFSL())
		Else
			If DataFSL()\Size > PseudoHashSize
				ForEach DataFSL()\Lst1()
; 					Debug DataFSL()\Lst1()\Path
					; если в списке есть элемент CSV, то надо получать хеш, так как любой файл может оказаться дубликатом
					; поэтому выпрыгиваем из этого перечисления списка файлов
					If Asc(DataFSL()\Lst1()\Path) = '*'
						tmp = 0
						Break
					Else
						md5$ = GetPseudoHash(DataFSL()\Lst1()\Path, DataFSL()\Size / 31)
; 						Debug DataFSL()\Size
; 						Debug md5$
					EndIf
					; 				Debug Str(DataFSL()\Size) + "|" + md5$
	; 				Создание временной карты дубликатов по псевдохешу
					If FindMapElement(TmpMD5(), md5$) ; Если существует, то добавляем только путь
	; 						FindMapElement устанавливает указатель на данный элемент, поэтому просто добавляем к нему элемент списка
						If AddElement(TmpMD5()\Lst1())
							TmpMD5()\Lst1() = DataFSL()\Lst1()
						EndIf
					Else ; иначе добавляем новый элемент
						If AddMapElement(TmpMD5(), md5$)
; 							TmpMD5()\Size = DataFSL()\Size
							If AddElement(TmpMD5()\Lst1())
								TmpMD5()\Lst1() = DataFSL()\Lst1()
							EndIf
						EndIf
					EndIf
				Next

				If tmp
					ClearList(DataFSL()\Lst1())
					; копирование путей
					ForEach TmpMD5()
						If ListSize(TmpMD5()\Lst1()) <> 1
							ForEach TmpMD5()\Lst1()
								If AddElement(DataFSL()\Lst1())
									DataFSL()\Lst1() = TmpMD5()\Lst1()
								EndIf
							Next
						EndIf
					Next
				EndIf
				ClearMap(TmpMD5())

			EndIf
		EndIf
	Next










; 	i = 0
; 	StatusBarText(#StatusBar, 0, "Вычисление MD5")
; 	Перебираем списки одного размера, получая md5
	ForEach DataFSL()
; 		i + 1
		If ListSize(DataFSL()\Lst1()) <> 1
			ForEach DataFSL()\Lst1()
; 				StatusBarText(#StatusBar, 0, Str(i) + " " + DataFSL()\Lst1()\Path)
				If Asc(DataFSL()\Lst1()\Path) = '*'
					md5$ = Mid(DataFSL()\Lst1()\Path, 2)
				Else
					md5$ = FileFingerprint(DataFSL()\Lst1()\Path, #PB_Cipher_MD5)
				EndIf
; 				Debug Str(DataFSL()\Size) + "|" + md5$

				If FindMapElement(DataMD5(), md5$) ; Если существует, то добавляем только путь
; 						FindMapElement устанавливает указатель на данный элемент, поэтому просто добавляем к нему элемент списка
					If AddElement(DataMD5()\Lst1())
							DataMD5()\Lst1() = DataFSL()\Lst1()
					EndIf
				Else ; иначе добавляем новый элемент
					If AddMapElement(DataMD5(), md5$)
						DataMD5()\Size = DataFSL()\Size
						If AddElement(DataMD5()\Lst1())
							DataMD5()\Lst1() = DataFSL()\Lst1()
						EndIf
					EndIf
				EndIf

			Next
		EndIf
	Next


		; сортируем по колонке MD5 этот короткий список файлов с одинаковыми размерами
; 			SortStructuredList(MD5Lst(), #PB_Sort_Ascending , OffsetOf(MD5Lst\MD5) , TypeOf(MD5Lst\MD5))
		; 					тут надо выделить группы с одинаковыми MD5
	ForEach DataMD5()
		If ListSize(DataMD5()\Lst1()) <> 1
			If AddElement(LstMD5())
				; 				CopyStructure(@DataMD5(), @LstMD5(), DataFSL)
; 				Вместо копирования ссылаемся на указатель - элемент другой структуры
				LstMD5() = DataMD5()
				LstMD5()\md5 = MapKey(DataMD5())
; 				Debug LstMD5()\md5
				; 				Debug LstMD5()\Lst1()\Level
; 				Сортировка по уровню
				SortStructuredList(LstMD5()\Lst1(),  #PB_Sort_Ascending, OffsetOf(Lst1\Level) , TypeOf(Lst1\Level))
			EndIf
		EndIf
	Next
; 	Сортировка групп по размеру
	SortStructuredList(LstMD5(),  #PB_Sort_Descending, OffsetOf(DataFSL\Size) , TypeOf(DataFSL\Size))

CompilerIf  #PB_Compiler_OS = #PB_OS_Windows
	SendMessage_(GadgetID(#ListIcon2), #WM_SETREDRAW, 0, 0)
CompilerEndIf
	k = 0
	idx = -1
	ch = 0
	ForEach LstMD5()
		k + 1 ; счётчик групп
			  ; 				Debug Str(k) + "_________________________"
		idx + 1
; 		пробел в начале имени группы необходим при удалении, то есть группа игнорируется
		AddGadgetItem(#ListIcon2, idx, " --- " + Str(k) + " ---|  " + _ShortFileSize(LstMD5()\Size) + "    ::" +  Str(LstMD5()\Size) + "|" + LstMD5()\md5) ; разделитель, номер группы
		SetGadgetItemData(#ListIcon2 , idx , #LevelLVGroup)
		CompilerIf  #PB_Compiler_OS = #PB_OS_Windows
			HideCheckBox(#ListIcon2, idx)
		CompilerElse
			SetGadgetItemState(#ListIcon2, idx, #PB_ListIcon_Inbetween)
		CompilerEndIf
		SetGadgetItemColor(#ListIcon2, idx, #PB_Gadget_FrontColor, GrColor)
		n = -1
		ForEach LstMD5()\Lst1() ; перечисляем элементы одного MD5
			; тут наполнение элементами
			; 					Debug MD5Lst()\MD5 + #TAB$ + MD5Lst()\Path
			idx + 1

			Select LstMD5()\Lst1()\Level
				Case -2, -3
					AddGadgetItem(#ListIcon2, idx, LstMD5()\Lst1()\Path, ImageID(11))
				Case -1
					AddGadgetItem(#ListIcon2, idx, LstMD5()\Lst1()\Path, ImageID(10))
; 				Case 0 To 9
				Default
					AddGadgetItem(#ListIcon2, idx, LstMD5()\Lst1()\Path, ImageID(9))
			EndSelect
			SetGadgetItemData(#ListIcon2 , idx , LstMD5()\Lst1()\Level)

; 			AddGadgetItem(#ListIcon2, idx, LstMD5()\Lst1()\Path)
			n + 1
			If n And LstMD5()\Lst1()\Level >= 0
				SetGadgetItemState(#ListIcon2, idx, #PB_ListIcon_Checked)
				ch + 1
			EndIf
		Next
	Next
CompilerIf  #PB_Compiler_OS = #PB_OS_Windows
	SendMessage_(GadgetID(#ListIcon2), #WM_SETREDRAW, 1, 0)
CompilerEndIf
	SetGadgetState(#ChAutoSel, #PB_Checkbox_Checked)

	FreeMap(DataFSL())
	FreeMap(DataMD5())
	FreeList(LstMD5())


	TimeCompare = (ElapsedMilliseconds() - TimeCompare)
; 	StatusBarText(#StatusBar, 0, Lng(51) + Str(k) + ", файлов: " + LSize$ + Lng(52) + Str(k+ch) + Lng(53) + Str(ch))
; 	StatusBarText(#StatusBar, 0, Lng(51) + Str(k) + Lng(52) + Str(k+ch) + Lng(53) + Str(ch))
	StatusBarText(#StatusBar, 0, Lng(51) + Str(k) + Lng(52) + Str(idx - k + 1) + Lng(53) + Str(ch) + Lng(54) + FormTime(TimeCompare))


	CompilerIf  #PB_Compiler_OS = #PB_OS_Windows
		If CountGadgetItems(#ListIcon2)
			; 			Выравниваем колонку по содержимому
			SetGadgetItemAttribute(#ListIcon2, 0, #PB_ListIcon_ColumnWidth, -1, 0)
		EndIf
	CompilerEndIf
EndProcedure

Procedure FileSearch(Map DataFSL.DataFSL(), sPath.s, level.i = 0, idx.i = 0)

	Protected sName.s, c = 0, LenSPath, tmp$, Size$, CurPath$, tmp, InitFind, NotFind, Mask$
	#depth = 130
	Protected Dim aExaDir(#depth)
	Protected Dim aSePath.s(#depth)

	If  Right(sPath, 1) <> #PS$
		sPath + #PS$
	EndIf
	LenSPath = Len(sPath)

	aSePath(c) = sPath
	
	
	Select ListSize(mask())
		Case 1
			FirstElement(mask()) 
			Mask$ = mask()
			InitFind = 0
		Case 0
			Mask$ = "*"
			InitFind = 0
		Default
			Mask$ = "*"
			InitFind = 1
	EndSelect

; 	If ListSize(mask()) = 1
; 		FirstElement(mask()) 
; 		Mask$ = mask()
; 		InitFind = 0
; 	Else
; 		Mask$ = "*"
; 		InitFind = 1
; 	EndIf
	
	aExaDir(c) = ExamineDirectory(#PB_Any, sPath, Mask$)
	If Not aExaDir(c)
		ProcedureReturn
	EndIf

	Repeat
		While NextDirectoryEntry(aExaDir(c))
			sName=DirectoryEntryName(aExaDir(c))
			If sName = "." Or sName = ".."
				Continue
			EndIf
			If DirectoryEntryType(aExaDir(c)) = #PB_DirectoryEntry_Directory
; 				If c >= depth
; 					Continue
; 				EndIf
				sPath = aSePath(c)
				c + 1
				aSePath(c) = sPath + sName + #PS$
				aExaDir(c) = ExamineDirectory(#PB_Any, aSePath(c), Mask$)
				If Not aExaDir(c)
					c - 1
				EndIf
			Else
				
				If InitFind
					NotFind = 1
					ForEach mask()
						If mask() = GetExtensionPart(sName)
							NotFind = 0
							Break
						EndIf
					Next
					If NotFind
						Continue
					EndIf
				EndIf

; 				Добавление файла в карту
				CurPath$ = aSePath(c) + sName
				tmp = FileSize(CurPath$)
				tmp$ = Str(tmp)
				If FindMapElement(DataFSL(), tmp$) ; Если существует, то добавляем только путь
; 					FindMapElement устанавливает указатель на данный элемент, поэтому просто добавляем к нему элемент списка
					If AddElement(DataFSL()\Lst1())
						DataFSL()\Lst1()\Path = CurPath$
						DataFSL()\Lst1()\Level = level
						DataFSL()\Lst1()\idx = idx
					EndIf
				Else ; иначе добавляем новый элемент
					If AddMapElement(DataFSL(), tmp$)
						DataFSL()\Size = tmp
						If AddElement(DataFSL()\Lst1())
							DataFSL()\Lst1()\Path = CurPath$
							DataFSL()\Lst1()\Level = level
							DataFSL()\Lst1()\idx = idx
						EndIf
					EndIf
				EndIf

			EndIf
		Wend
		FinishDirectory(aExaDir(c))
		c - 1
	Until c < 0
EndProcedure

; IDE Options = PureBasic 5.72 (Windows - x86)
; CursorPosition = 94
; FirstLine = 68
; Folding = -----
; EnableAsm
; EnableXP
; DPIAware
; UseIcon = images\Search_duplicates.ico
; Executable = Search_duplicates
; EnableBuildCount = 0
; IncludeVersionInfo
; VersionField0 = 0.9.5.%BUILDCOUNT
; VersionField2 = AZJIO
; VersionField3 = Search duplicates
; VersionField4 = 0.9.5
; VersionField6 = Search duplicates
; VersionField9 = AZJIO