assume cs:code
code segment
start:  
        mov bx,0
printyear:
        push bx

        mov al,9
        out 70h,al
        in al,71h

        ;用BCD码存的年份，所以ah右移四位得到月份的十位数值，al与00001111b得到月份的个位数值
        mov ah,al
        mov cl,4
        shr ah,cl
        and al,00001111b

        ;把数字变成字符
        add ah,30h
        add al,30h

        ;屏幕彩色显示段
        mov bx,0b800h
        mov es,bx

        pop bx
        ; 一行占160字节，字符一个存两个字节（高属性低数据）
        mov byte ptr es:[160*12+40*2+bx],ah
        mov byte ptr es:[160*12+40*2+bx+2],al
        mov al,'/'
        mov byte ptr es:[160*12+40*2+bx+4],al
        add bx,6
printmonth:
        push bx

        mov al,8
        out 70h,al
        in al,71h

        ;用BCD码存的年份，所以ah右移四位得到月份的十位数值，al与00001111b得到月份的个位数值
        mov ah,al
        mov cl,4
        shr ah,cl
        and al,00001111b

        add ah,30h
        add al,30h

        mov bx,0b800h
        mov es,bx

        pop bx
        ; 一行占160字节，字符一个存两个字节（高属性低数据）
        mov byte ptr es:[160*12+40*2+bx],ah
        mov byte ptr es:[160*12+40*2+bx+2],al
        mov al,'/'
        mov byte ptr es:[160*12+40*2+bx+4],al
        add bx,6
printday:  
        push bx

        mov al,7
        out 70h,al
        in al,71h

        ;用BCD码存的年份，所以ah右移四位得到月份的十位数值，al与00001111b得到月份的个位数值
        mov ah,al
        mov cl,4
        shr ah,cl
        and al,00001111b

        add ah,30h
        add al,30h

        mov bx,0b800h
        mov es,bx

        pop bx
        ; 一行占160字节，字符一个存两个字节（高属性低数据）
        mov byte ptr es:[160*12+40*2+bx],ah
        mov byte ptr es:[160*12+40*2+bx+2],al
        mov al,' '
        mov byte ptr es:[160*12+40*2+bx+4],al
        add bx,6
printhour:
        push bx

        mov al,4
        out 70h,al
        in al,71h

        ;用BCD码存的年份，所以ah右移四位得到月份的十位数值，al与00001111b得到月份的个位数值
        mov ah,al
        mov cl,4
        shr ah,cl
        and al,00001111b

        add ah,30h
        add al,30h

        mov bx,0b800h
        mov es,bx

        pop bx
        ; 一行占160字节，字符一个存两个字节（高属性低数据）
        mov byte ptr es:[160*12+40*2+bx],ah
        mov byte ptr es:[160*12+40*2+bx+2],al
        mov al,':'
        mov byte ptr es:[160*12+40*2+bx+4],al
        add bx,6
printmin:
        push bx

        mov al,2
        out 70h,al
        in al,71h

        ;用BCD码存的年份，所以ah右移四位得到月份的十位数值，al与00001111b得到月份的个位数值
        mov ah,al
        mov cl,4
        shr ah,cl
        and al,00001111b

        add ah,30h
        add al,30h

        mov bx,0b800h
        mov es,bx

        pop bx
        ; 一行占160字节，字符一个存两个字节（高属性低数据）
        mov byte ptr es:[160*12+40*2+bx],ah
        mov byte ptr es:[160*12+40*2+bx+2],al
        mov al,':'
        mov byte ptr es:[160*12+40*2+bx+4],al
        add bx,6
printsec:
        push bx
        mov al,0
        out 70h,al
        in al,71h

        ;用BCD码存的年份，所以ah右移四位得到月份的十位数值，al与00001111b得到月份的个位数值
        mov ah,al
        mov cl,4
        shr ah,cl
        and al,00001111b

        add ah,30h
        add al,30h

        mov bx,0b800h
        mov es,bx

        pop bx
        ; 一行占160字节，字符一个存两个字节（高属性低数据）
        mov byte ptr es:[160*12+40*2+bx],ah
        mov byte ptr es:[160*12+40*2+bx+2],al

        mov ax,4c00h
        int 21h
code ends
end start