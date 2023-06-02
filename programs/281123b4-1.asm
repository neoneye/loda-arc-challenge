; Submitted by Simon Strandgaard
; Program Type: advanced

mov $80,$99
mov $81,100 ; address of vector[0].InputImage
mov $82,102 ; address of vector[0].ComputedOutputImage
mov $83,114 ; address of vector[0].InputMostPopularColor
lps $80
  mov $0,$$81 ; input image
  mov $20,$$83 ; most popular color across inputs

  mov $1,1 ; spacing is 1 pixel
  f24 $0,102260 ; split into 4 columns
  ; $0..$3 are the 4 columns

  ; layer 0
  mov $10,$1

  ; layer 1
  mov $11,$0
  mov $12,$20 ; most popular color
  f31 $10,101150 ; Image: Overlay another image by using a color as mask

  ; layer 2
  mov $11,$3
  mov $12,$20 ; most popular color
  f31 $10,101150 ; Image: Overlay another image by using a color as mask

  ; layer 3
  mov $11,$2
  mov $12,$20 ; most popular color
  f31 $10,101150 ; Image: Overlay another image by using a color as mask

  mov $0,$10
  
  mov $$82,$0
  add $81,100
  add $82,100
  add $83,100
lpe
