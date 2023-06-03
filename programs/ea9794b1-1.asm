; Submitted by Simon Strandgaard
; Program Type: advanced

mov $80,$99
mov $81,100 ; address of vector[0].InputImage
mov $82,102 ; address of vector[0].ComputedOutputImage
mov $83,114 ; address of vector[0].InputMostPopularColor
lps $80
  mov $0,$$81 ; input image
  mov $20,$$83 ; most popular color across inputs
  mov $21,0 ; pixel spacing = 0

  mov $10,$$81 ; input image
  mov $11,$21 ; spacing
  f22 $10,102261 ; split into 2 rows
  ; $10..$11 are the 2 rows

  mov $15,$10
  mov $16,$21 ; spacing
  f22 $15,102260 ; split into 2 columns
  ; $15..$16 are the 2 columns

  mov $17,$11
  mov $18,$21 ; spacing
  f22 $17,102260 ; split into 2 columns
  ; $17..$18 are the 2 columns

  ; $15 = cell top left
  ; $16 = cell top right
  ; $17 = cell bottom left
  ; $18 = cell bottom right

  ; layer 0
  mov $0,$15

  ; layer 1
  mov $1,$18
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask

  ; layer 2
  mov $1,$17
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask

  ; layer 3
  mov $1,$16
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask

  mov $$82,$0
  add $81,100
  add $82,100
  add $83,100
lpe
