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
  f23 $10,102263 ; split into 3 rows
  ; $10..$12 are the 3 columns

  ; layer 0
  mov $0,$11 ; middle of image

  ; layer 1
  mov $1,$10 ; top of image
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask

  ; layer 2
  mov $1,$12 ; bottom of image
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask
  
  mov $$82,$0
  add $81,100
  add $82,100
  add $83,100
lpe
