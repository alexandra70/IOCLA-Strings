# IOCLA-Strings

**Tema este formată din mai multe subpuncte, fiecare subpunct constând in implementarea unei funcţii de criptare sau de prelucrare a unui şir de caractere.**

**Parametrii funcţiilor sunt plasaţi în registre, în cadrul scheletului. Rezultatul fiecărei funcţii se va plasa în primul parametru al funcţiei.
în tema finală este interzisă apelarea funcţiilor externe.**

**1. One Time Pad - Algoritmul constă in efectuarea operţiei XOR între un mesaj(plain) şi o cheie(key), de aceeaşi lungime cu mesajul.
 cipher[i] = plain[i] ^ key[i]. Antetul funcţiei, în C, este - void otp(char *ciphertext, char *plaintext, char *key, int length).**
 
**2. Caesar Cipher -Acesta primeşte un mesaj şi o cheie, reprezentată de un număr, şi deplasează circular fiecare literă din mesaj cu valoarea specificată de cheie.
Antetul funcţiei, în C, este - void caesar(char *ciphertext, char *plaintext, int key, int length). Caracterele care nu sunt litere nu vor fi criptate.**
 
**3. Vigenere Cipher - Acesta primeşte mesajul ce urmeaza să fie criptat şi o cheie, reprezentată de un şir de majuscule. În cazul în care cheia este mai scurtă decât
mesajul, aceasta se extinde la lungimea mesajului, prin repetarea cheii initiale. Apoi, fiecare literă din mesaj este deplasată circular la dreapta de un număr de ori
egal cu poziţia în alfabet (începând de la poziţia 0) a literei corespunzătoare din cheie.
Antetul funcţiei, în C, este - void vigenere(char *ciphertext, char *plaintext, char *key, int key_len);**

**4. StrStr - SrtStr este o funcție ce găsește prima apariție a unui subșir intr-un șir sursă. Se cere implementarea sa in assembley.
Antetul funcţiei, în C, este - void my_strstr(int *substr_index, char *haystack, char *needle, int haystack_len, int needle_len);**

**5. Binary to Hexadecimal - Scopul este realizarea unei funcții ce va trece numerele din baza 2 in baza 16.
Antetul funcţiei, în C, este: void bin_to_hex(char *hexa_value, char *bin_sequence, int length);
Transforma secventa de biti primita ca parametru in corespondenta sa din baza 16.  Ex:(1011111011101111 -->    1011 1110 1110 1111    --> beef).**
