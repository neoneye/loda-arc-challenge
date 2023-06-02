; Submitted by Simon Strandgaard
; Program Type: advanced

mov $80,$99
mov $81,100 ; address of vector[0].InputImage
mov $82,102 ; address of vector[0].ComputedOutputImage
mov $83,114 ; address of vector[0].InputMostPopularColor
lps $80
  mov $20,$$83 ; most popular color across inputs

  mov $10,$$81 ; input image
  mov $11,0 ; no spacing
  f24 $10,102261 ; split into 4 rows
  ; $10..$13 are the 4 rows

  ; layer 0
  mov $0,$12

  ; layer 1
  mov $1,$13
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask

  ; layer 2
  mov $1,$11
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask

  ; layer 3
  mov $1,$10
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask

  mov $$82,$0
  add $81,100
  add $82,100
  add $83,100
lpe
