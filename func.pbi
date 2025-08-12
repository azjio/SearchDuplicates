
; Declare SplitL(String.s, List StringList.s(), Separator.s = " ")


CompilerIf  #PB_Compiler_OS = #PB_OS_Windows
Procedure HideCheckBox(gadget, item)
  Protected lvi.LVITEM
  lvi\iItem = item
  lvi\mask = #LVIF_STATE
  lvi\stateMask = #LVIS_STATEIMAGEMASK
  SendMessage_(GadgetID(gadget), #LVM_SETITEM, 0, @lvi)
EndProcedure
CompilerEndIf


Procedure IsHex(*text)
	Protected flag = 1, *c.Character = *text
	
	If *c\c = 0
		ProcedureReturn 0
	EndIf
	
	Repeat
		If Not ((*c\c >= '0' And *c\c <= '9') Or (*c\c >= 'a' And *c\c <= 'f') Or (*c\c >= 'A' And *c\c <= 'F'))
			flag = 0
			Break
		EndIf
		*c + SizeOf(Character)	
	Until Not *c\c
	
; 	Debug flag
	ProcedureReturn flag
EndProcedure

Procedure RGBtoBGR(c)
	ProcedureReturn RGB(Blue(c), Green(c), Red(c))
EndProcedure

; вычисление цвета
Procedure ColorValidate(Color$, def)
	Protected tmp$, tmp2$, i
; 	Debug Color$
	If IsHex(@Color$) 
		Select Len(Color$)
			Case 6
				def = Val("$" + Color$)
				def = RGBtoBGR(def)
			Case 1
				def = Val("$" + LSet(Color$, 6, Color$))
			Case 2
				Color$ + Color$ + Color$
				def = Val("$" + Color$)
			Case 3
				For i = 1 To 3
					tmp$ = Mid(Color$, i, 1)
					tmp2$ + tmp$ + tmp$
				Next
				def = Val("$" + tmp2$)
				def = RGBtoBGR(def)
		EndSelect
	EndIf
; 	Debug Hex(def)
	ProcedureReturn def
EndProcedure


Procedure IsDigital(*text)
    Protected flag = #True, *c.Character = *text

    If *c = 0 Or *c\c = 0
        ProcedureReturn 0
    EndIf

    Repeat
        If *c\c < '0' Or *c\c > '9'
            flag = #False
            Break
        EndIf
        *c + SizeOf(Character)
    Until Not *c\c

    ProcedureReturn flag
EndProcedure


Procedure.s GetPseudoHash(Path$, Shift.q)
	Protected res$, length, file_id
	file_id = ReadFile(#PB_Any, Path$)
	If file_id
		length = Lof(file_id)
		FileSeek(file_id, 4, #PB_Relative)
; 		res$ = Hex(ReadByte(file_id), #PB_Byte) + " "
	    While Eof(file_id) = 0
	        res$ + Hex(ReadByte(file_id), #PB_Byte)
			FileSeek(file_id, Shift, #PB_Relative)
	    Wend
		FileSeek(file_id, length - 1, #PB_Absolute)
	     res$ + Hex(ReadByte(file_id), #PB_Byte)
	    CloseFile(file_id)
	EndIf
	ProcedureReturn res$
EndProcedure

Procedure.s FormTime(time)
	Protected res$, h, m, s, ms
	If time >= 3600000
		h = time/3600000
		time % 3600000
		res$ + Str(h) + " ч "
	EndIf
	If time >= 60000
		m = time/60000
		time % 60000
		res$ + Str(m) + " м "
	EndIf
	If time >= 1000
		s = time/1000
		time % 1000
		res$ + Str(s) + " с "
	EndIf
	If time > 0
; 		res$ + Str(time) + " мс "
		res$ + "0 с "
	EndIf
	ProcedureReturn RTrim(res$)
EndProcedure


Procedure.s _ShortFileSize(Bytes.q)
	Protected res.s
	Select Bytes
; 		Case 10995116277760 To 109951162777600 ; 10 - 100 TB
; 			res = StrD(Round(Bytes / 109951162777.6, #PB_Round_Nearest)/10.0) + " TB"
		Case 1000000000000 To 10995116277759 ; 1000 GB - 10 TB
			res = StrD(Round(Bytes / 10995116277.76, #PB_Round_Nearest)/100.0) + " TB"
		Case 107374182400 To 999999999999 ; 100 - 999 GB
			res = StrD(Round(Bytes / 1073741824, #PB_Round_Nearest)) + " GB"
		Case 10737418240 To 107374182399 ; 10 - 100 GB
			res = StrD(Round(Bytes / 107374182.4, #PB_Round_Nearest)/10.0) + " GB"
		Case 1000000000 To 10737418239 ; 1000 MB - 10 GB
			res = StrD(Round(Bytes / 10737418.24, #PB_Round_Nearest)/100.0) + " GB"
		Case 104857600 To 999999999 ; 100 - 999 MB
			res = StrD(Round(Bytes / 1048576, #PB_Round_Nearest)) + " MB"
		Case 10485760 To 104857599 ; 10 - 100 MB
			res = StrD(Round(Bytes / 104857.6, #PB_Round_Nearest)/10.0) + " MB"
		Case 1000000 To 10485759 ; 1000 KB - 10 MB
			res = StrD(Round(Bytes / 10485.76, #PB_Round_Nearest)/100.0) + " MB"
		Case 102400 To 999999 ; 100 - 999 KB
			res = StrD(Round(Bytes / 1024, #PB_Round_Nearest)) + " KB"
		Case 10240 To 102399 ; 10 - 100 KB
			res = StrD(Round(Bytes / 102.4, #PB_Round_Nearest)/10.0) + " KB"
		Case 1000 To 10239 ; 1000 B - 10 KB
			res = StrD(Round(Bytes / 10.24, #PB_Round_Nearest)/100.0) + " KB"
		Case 0 To 999
			res = StrD(Bytes )+ " B"
	EndSelect
	ProcedureReturn res
EndProcedure


; wilbert
; https://www.purebasic.fr/english/viewtopic.php?p=486382#p486382
Procedure SplitL(String.s, List StringList.s(), Separator.s = " ")

	Protected S.String, *S.Integer = @S
	Protected.i p, slen
	slen = Len(Separator)
	ClearList(StringList())

	*S\i = @String
	Repeat
		AddElement(StringList())
		p = FindString(S\s, Separator)
		StringList() = PeekS(*S\i, p - 1)
		*S\i + (p + slen - 1) << #PB_Compiler_Unicode
	Until p = 0
	*S\i = 0

EndProcedure


;==================================================================
;
; Author:    ts-soft
; Date:       March 5th, 2010
; Explain:
;     modified version from IBSoftware (CodeArchiv)
;     on vista and above check the Request for "User mode" or "Administrator mode" in compileroptions
;    (no virtualisation!)
;==================================================================
Procedure ForceDirectories(Dir.s)
	Static tmpDir.s, Init, delim$
	Protected result
	CompilerSelect #PB_Compiler_OS
		CompilerCase #PB_OS_Windows
			delim$ = "\"
		CompilerCase #PB_OS_Linux
			delim$ = "/"
	CompilerEndSelect

	If Len(Dir) = 0
		ProcedureReturn #False
	Else
		If Not Init
			tmpDir = Dir
			Init   = #True
		EndIf
		If (Right(Dir, 1) = delim$)
			Dir = Left(Dir, Len(Dir) - 1)
		EndIf
		If (Len(Dir) < 3) Or FileSize(Dir) = -2 Or GetPathPart(Dir) = Dir
			If FileSize(tmpDir) = -2
				result = #True
			EndIf
			tmpDir = ""
			Init = #False
			ProcedureReturn result
		EndIf
		ForceDirectories(GetPathPart(Dir))
		ProcedureReturn CreateDirectory(Dir)
	EndIf
EndProcedure


Procedure SaveFile_Buff(File.s, *Buff, Size)
	Protected Result = #False
	Protected ID = CreateFile(#PB_Any, File)
	If ID
		If WriteData(ID, *Buff, Size) = Size
			Result = #True
		EndIf
		CloseFile(ID)
	EndIf
	ProcedureReturn Result
EndProcedure

; IDE Options = PureBasic 5.72 (Windows - x86)
; CursorPosition = 11
; Folding = ---
; EnableAsm
; EnableXP