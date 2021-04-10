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
  
  .zl_word{
    color:orangered;
    font-weight:bold;
  }
  .zl_string{
    color:cadetblue;
  }
  .zl_comment{
    color:darkgreen;
  }
  .zl_inmed{
    color:red;
  }
  .zl_nasm_dir{
    color:aqua;
  }
  .zl_nasm_inst{
    color:blue;
    font-weight:bold;
  }
</style>

# Get the last version of ZCC
<br>
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
<pre>
<span class="zl_nasm_dir">org</span> 0x7c00
<span class="zl_nasm_dir">bits</span> 16

<span class="zl_word">callf</span> printStr(str_hello)

<span class="zl_nasm_inst">cli</span>
<span class="zl_nasm_inst">hlt</span>

<span class="zl_word">def</span> str_hello = <span class="zl_string">"Hello world!"</span>,0

<span class="zl_word">function</span> printStr(si){
  <span class="zl_word">while</span> (<span class="zl_inmed">$si</span> != 0){
    <span class="zl_word">callk</span> printChar(<span class="zl_nasm_inst">word</span> $si)
    si++
  }
}

<span class="zl_word">#include</span> <span class="zl_string">"myfunctions.z"</span>
<span class="zl_comment">// #include <math>
/*
  Multiline
  comment
*/
  </span>

<span class="zl_word">buf</span>[510-($-$$)]
<span class="zl_nasm_dir">db</span> 0x55,0xAA
</pre>
