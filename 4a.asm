.model small
.stack
.data
 msg db 'enter a key:',0Ah,0Dh,'$'
.code
  mov ax,@data
  mov ds,ax
  mov ah,00h
  mov al,03
  int 10h
  lea dx,msg
  mov ah,09h
  int 21h
  mov ah,01h
  int 21h
  mov bl,al
  mov ah,02h
  mov bh,00
  mov dh,12
  mov dl,40
  int 10h
  mov al,bl
  and al,0F0h
  mov cl,04
  shr al,cl
  call bak
  mov al,bl
  and al,0fh
  call bak
  mov ah,4ch
  int 21h
bak:cmp al,0Ah
   jb skip
   add al,7
skip:add al,30h
     mov dl,al
     mov ah,02
     int 21h
     ret
     end
