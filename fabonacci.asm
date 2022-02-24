; Compute Fibonacci 1 to 30
; Lab3 Homework 


.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
INCLUDE Irvine32.inc

.data 
  Fibonacci    DWORD 30 DUP(?) ;assign 30 DWORD

.code
main proc ;
   
 mov esi, OFFSET Fibonacci ;esi = Fibonacci[0]

 	;F1 = 1, F2 = 
 mov [ Fibonacci] ,1		; Fibonacci[1] = 1
 mov [ Fibonacci +4] ,1		; Fibonacci[2] = 1
  
 mov ecx,28	; need loop 28 times from Fibonacci[3] to Fibonacci[30]

	;print Fibonacci[1] and Fibonacci[2]
 mov eax,1

 call WriteDec
 call Crlf
 call WriteDec
 call Crlf

 mov eax,2	; eax = Fibonacci[3]
 add esi,8	; esi point to Fibonacci[3]
 ; print FIBNum to  f(30)
	; i = 3
L1:
	
 mov [esi],eax	; move eax to Fibonacci[i]
  
 call WriteDec                                           ;print int 
 call Crlf              ;chang line
 
 add eax,[esi-4]	; eax = Fabonacci[i]+Fabonacci[i-1]
 add esi,4	; esi point to next Fibonacci number, i++

 loop L1
  
 invoke ExitProcess,0
main endp
end main