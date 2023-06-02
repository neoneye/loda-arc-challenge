; Submitted by Simon Strandgaard
; Program Type: advanced

mov $80,$99
mov $81,100 ; address of vector[0].InputImage
mov $82,102 ; address of vector[0].ComputedOutputImage
mov $83,114 ; address of vector[0].InputMostPopularColor
lps $80
  mov $0,$$81 ; input image
  mov $20,$$83 ; most popular color across inputs

  mov $8,$0
  f11 $8,101001 ; Get height of image
  div $8,3
  ; $8 is 1/3 height

  mov $11,$0
  mov $12,$8
  f21 $11,101220 ; get N top rows
  ; $11 is top 1/3 of the image

  mov $12,$0
  mov $13,$8
  f21 $12,101221 ; get N bottom rows
  ; $12 is bottom 1/3 of the image

  mov $13,$0
  mov $14,$8
  f21 $13,101224 ; remove N top rows
  f21 $13,101225 ; remove N bottom rows
  ; $13 is middle 1/3 of the image

  ; layer 0
  mov $0,$13 ; middle of image

  ; layer 1
  mov $1,$11 ; top of image
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
