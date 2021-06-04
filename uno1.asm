title "mi primer interrupcion"
model small
stack 32
dataseg
puntos1 db ':'
puntos2 db 03Ah
ten db 10
cad db 'HOLAS MUNDOS','$'
reloj db '           ','$','aqui toy' 
codeseg
Start:
mov ax,@data
mov ds,ax
mov dh,0Ch
mov dl,34
mov bh,0
mov ah,02
int 10h
lea dx,cad
mov ah,09
int 21h

;=====================
; quitando cursor
; Set text-mode cursor shape
;=====================
mov ah,01h
mov cx,2607h ; invisible
;mov cx,0007 ; bloque
int 10h
;===================
;mostrando reloj
;===================
et1:
mov dh,0Dh ;moviendo renglon
mov dl,34 ;manteniendo columna
mov ah,02
int 10h
; poniendo apuntador a cadena reloj
lea si,reloj
; ______ llamando al tiempo _____
mov ah,02ch
int 21h
xor ax,ax ; limpia AX 
mov al,ch ; al = horas
div ten; separando los digitos
or al,00110000b ;convierte digito MS a su ASCII
or ah,00110000b ;convierte digito LS a su ASCII
mov [si],ax ; pasando digitos a cadena reloj
inc si
inc si
mov al,puntos1
mov[si],al
xor ax,ax
mov al,cl; minutos
div ten
or al,00110000b ;convierte digito MS a su ASCII
or ah,00110000b ;convierte digito LS a su ASCII
inc si
mov [si],ax

inc si
inc si
mov al,puntos2
mov[si],al
xor ax,ax
mov al,dh; segundos
div ten
or al,00110000b ;convierte digito MS a su ASCII
or ah,00110000b ;convierte digito LS a su ASCII
inc si
mov [si],ax

inc si
inc si
mov al,puntos1
mov[si],al
xor ax,ax
mov al,dl; segundos
div ten
or al,00110000b ;convierte digito MS a su ASCII
or ah,00110000b ;convierte digito LS a su ASCII
inc si
mov [si],ax
inc si
inc si
mov byte PTR[si],'$'

lea dx,reloj
mov ah,09
int 21h
in al,060h
dec al
jnz et1
mov ah,04ch
int 21h
end Start
