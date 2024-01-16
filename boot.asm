section .data
    buffer db 100   ; bufor na wpisywane znaki
    buffer_len equ $ - buffer   ; długość bufora

section .text
    global _start

_start:
    ; Wypisanie komunikatu zachęcającego do wprowadzania znaków
    mov ah, 0x0e   ; funkcja 0eh - wyświetlanie znaku w tekście
    mov al, '>'
    mov bh, 0      ; numer strony
    mov bl, 0x0F   ; kolor tekstu
    int 0x10       ; wywołanie przerwania 10h

input_loop:
    mov ah, 0     ; zerowanie rejestru ah
    int 0x16      ; wywołanie przerwania 16h - pobranie wciskanego klawisza

    cmp al, 13    ; sprawdzenie, czy to klawisz Enter
    je process_input  ; jeśli Enter, przetwarzamy wprowadzone dane

    mov [buffer], al  ; zapisanie wciskanego klawisza do bufora
    mov ah, 0x0e   ; funkcja 0eh - wyświetlanie znaku w tekście
    mov al, [buffer]  ; kod ASCII wciskanego klawisza
    mov bh, 0      ; numer strony
    mov bl, 0x0F   ; kolor tekstu
    int 0x10       ; wywołanie przerwania 10h

    inc byte [buffer] ; przesunięcie wskaźnika bufora
    jmp input_loop ; powrót do nasłuchiwania klawiszy

process_input:
    ; Tutaj możesz dodać kod do obsługi wprowadzonych danych
    ; np. zapis do pamięci, analiza komendy, etc.

    ; Na potrzeby przykładu wypisz wprowadzone dane
    mov ah, 0x0e   ; funkcja 0eh - wyświetlanie znaku w tekście
    mov al, 10     ; kod ASCII znaku nowej linii
    mov bh, 0      ; numer strony
    mov bl, 0x0F   ; kolor tekstu
    int 0x10       ; wywołanie przerwania 10h

    ; Wypisz zawartość bufora
    mov si, buffer ; ustaw wskaźnik źródłowy
    print_char_loop:
        mov al, [si]   ; wczytaj znak z bufora
        cmp al, 0      ; sprawdź, czy to koniec bufora
        je print_char_end   ; jeśli tak, zakończ
        mov ah, 0x0e   ; funkcja 0eh - wyświetlanie znaku w tekście
        mov bh, 0      ; numer strony
        mov bl, 0x0F   ; kolor tekstu
        int 0x10       ; wywołanie przerwania 10h
        inc si         ; przesunięcie wskaźnika bufora
        jmp print_char_loop ; przejdź do następnego znaku w buforze

    print_char_end:
    ; Czyszczenie bufora
    mov byte [buffer], 0
    ; Powrót do nasłuchiwania klawiszy
    jmp input_loop
    
    ; Z tego co widać ten system jest bardzo robiony na taśme xD
    ; Nie powinno to działać wgl
    ; Próbowałem dodać komendy i gówno z tego wyszło.
    ; Dobrej zabawy z tym kodem.

