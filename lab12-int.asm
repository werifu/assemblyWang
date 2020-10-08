assume cs:code
code segment
start: 
        ;安装do0处理程序
        ;↓源代码do0代码地址
        mov ax,cs
        mov ds,ax
        mov si,offset do0
        ;↓把do0复制到0000:0200h
        mov ax,0
        mov es,ax
        mov di,200h

        mov cx,offset do0end-offset do0
        cld ;设置传输的方向为正
        rep movsb   ;偏移cx位的复制

        ;把do0的地址放到中断向量表里（在0:0),0:0存放偏移地址，0:2存放段地址
        mov ax,0
        mov es,ax
        mov word ptr es:[0*4],200h
        mov word ptr es:[0*4+2],0

        ;执行0号中断（直接div 0过不了编译的）
        int 0

        mov ax,4c00h
        int 21h

do0:    
        ;显示"overflow!"
        jmp short do0start
        db "overflow!"
do0start:
        mov ax,cs
        mov ds,ax
        mov si,202h ;ds:si指向字符串
        
        mov ax,0b800h
        mov es,ax
        mov di,12*160+36*2  ;es:di指向显存空间的中间位置

        ;↓把overflow信息打印出来
        mov cx,9  ;字符串9个字节
s:      mov al,ds:[si]
        mov es:[di],al
        inc si
        add di,2
        loop s


        mov ax,4c00h
        int 21h
do0end: nop
code ends
end start