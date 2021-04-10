# ZCC Official site

<br>
<link rel="shortcut icon" type="image/x-icon" href="favicon.png">
<style>
  #download-any{
    background: transparent url("https://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/32/Actions-go-down-icon.png") 12px 50% no-repeat;
  }
  #download-zip, #download-tar-gz {
    display: block;
  }
</style>

# Get the last version of ZCC
## Download for Windows
<section id="downloads" class="clearfix">
  <a target="_blank" href="https://github.com/bruneo32/zcc/tree/main/download/windows/v1.25/installer" id="download-any" class="button">
    <span>Download setup</span>
  </a>
  <a target="_blank" href="https://github.com/bruneo32/zcc/tree/main/download/windows/v1.25/portable" id="download-zip" class="button">
    <span>Portable .zip</span>
  </a>
</section>

## Download for Linux
Especial thanks to <a target="_blank" href="https://github.com/arf20">@arf20</a>
<section id="downloads" class="clearfix">
  &ensp;&ensp;&ensp;<code style="font-size:1.25em;padding:6px 12px;">apt install zcc</code>
  <br><br>
  <a href="https://github.com/bruneo32/zcc/tree/main/download/linux/v1.25/installer" id="download-any" class="button">
    <span>Download deb</span>
  </a>
  <a href="https://github.com/bruneo32/zcc/tree/main/download/linux/v1.25/portable" id="download-tar-gz" class="button">
    <span>Portable .tar.gz</span>
  </a>
</section>

# Z language
Z is a programming language which extends Assembly to a

### Syntax
Example of a simple Boot sector in Z:
```
org 0x7c00
bits 16

callf printStr(str_hello)

cli
hlt

def str_hello = "Hello world!",0

function printStr(si){
  while ($si != 0){
    callf printChar(word $si)
    si++
  }
}

#include "myfunctions.z"
// #include <math>
/*
  Multiline
  comment
*/

buf[510-($-$$)]
db 0x55,0xAA
```

&copy; 2021
