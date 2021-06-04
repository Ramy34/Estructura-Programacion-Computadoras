title "mi primer interrupcion"
model small
stack 32
dataseg

codeseg
Start:
mov ax,@data
mov ds,ax
mov ah,06 ; opción 06h
mov al,0 ; # líneas a desplazar si 0 se borra toda la ventana seleccionada
mov cx,00 ; ch: línea donde comienza la ventana de texto cl: columna donde comienza la ventana de texto
mov dh,47 ; línea donde acaba la ventana de texto
mov dl,79 ; columnda donde acaba la ventana de texto
mov bh,0Fh ; atributo a usar en las líneas borradas
int 10h ; int 10 h invocando
mov ah,04ch
int 21h
end Start
