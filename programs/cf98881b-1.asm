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
  f11 $8,101000 ; Get width of image
  sub $8,2
  div $8,3
  ; $8 is 1/3 width

  mov $11,$0
  mov $12,$8
  f21 $11,101222 ; get N left columns
  ; $11 is left 1/3 of the image

  mov $12,$0
  mov $13,$8
  f21 $12,101223 ; get N right columns
  ; $12 is right 1/3 of the image

  mov $13,$0
  mov $14,$8
  add $14,1
  f21 $13,101226 ; left N left columns
  f21 $13,101227 ; left N right columns
  ; $13 is middle 1/3 of the image

  ; layer 0
  mov $0,$12 ; right of image

  ; layer 1
  mov $1,$13 ; middle of image
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask

  ; layer 2
  mov $1,$11 ; left of image
  mov $2,$20 ; most popular color
  f31 $0,101150 ; Image: Overlay another image by using a color as mask
  
  mov $$82,$0
  add $81,100
  add $82,100
  add $83,100
lpe
