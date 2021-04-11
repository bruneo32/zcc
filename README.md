<br>
<link rel="shortcut icon" type="image/x-icon" href="favicon.png?">
<style>
  header,section#downloads,div.inner>hr{display:none;}
  
  #download-any{
    background: transparent url("https://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/32/Actions-go-down-icon.png") 12px 50% no-repeat;
  }
  #download-npp{
    background: transparent url("https://notepad-plus-plus.org/images/logo.svg") 12px 50% no-repeat;
  }
  #download-zip, #download-tar-gz {
    display: block;
  }
  
  .scode{
    font-size:1.25em;
    padding:6px 12px;
    margin:auto 32px;
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
    color:gold;
  }
  .zl_nasm_dir{
    color:aqua;
  }
  .zl_nasm_inst{
    color:dodgerblue;
    font-weight:bold;
  }
</style>

# Get the last version of ZCC
<br><code class="scode">version 0.25</code>
<br><br>

## Download for Windows
<div id="downloads" class="clearfix">
  <a target="_blank" href="https://github.com/bruneo32/zcc/tree/main/download/windows/installer" id="download-any" class="button">
    <span>Download Setup</span>
  </a>
  <a target="_blank" href="https://github.com/bruneo32/zcc/tree/main/download/windows/zip" id="download-zip" class="button">
    <span>Portable .zip</span>
  </a>
</div>

## Download for Linux
Especial thanks to <a target="_blank" href="https://github.com/arf20">@arf20</a>
<div id="downloads" class="clearfix">
  <code class="scode">apt install zcc</code>
  <br><br>
  <a target="_blank" href="https://github.com/bruneo32/zcc/tree/main/download/linux/deb" id="download-any" class="button">
    <span>Download Deb</span>
  </a>
  <a target="_blank" href="https://github.com/bruneo32/zcc/tree/main/download/linux/targz" id="download-tar-gz" class="button">
    <span>Portable .tar.gz</span>
  </a>
</div>

## Extras

<div id="downloads" class="clearfix">
  <a target="_blank" href="https://github.com/bruneo32/zcc/tree/main/download/source" id="download-any" class="button">
    <span>Source code</span>
  </a>
  <a target="_blank" href="https://github.com/bruneo32/zcc/tree/main/download/extra" id="download-npp" class="button">
    <span>Notepad++ UDL</span>
  </a>
</div>

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
    <span class="zl_word">callk</span> printChar(<span class="zl_nasm_inst">word</span> <span class="zl_inmed">$si</span>)
    si++
  }
}

<span class="zl_word">#include</span> <span class="zl_string">"myfunctions.z"</span>
<span class="zl_comment">// #include &lt;math&gt;
/*
  Multiline
  comment
*/</span>
  

<span class="zl_word">buf</span>[510-($-$$)]
<span class="zl_nasm_dir">db</span> 0x55,0xAA
</pre>

`zcc main.z main.asm -nasm:{-f bin main.flp}`

![](example_boot.png)

<br>
Example of a little messy "Hello world!" executable
<pre>
<span class="zl_nasm_dir">global</span> _start

<span class="zl_nasm_dir">bits</span> 32

<span class="zl_nasm_dir">section</span> .text
_start:
  <span class="zl_word">for</span>(cx=0, cx<5, cx++){
    <span class="zl_word">callf</span> printstr(str_hello)
  }
  
  <span class="zl_word">callk</span> end0()

<span class="zl_nasm_dir">section</span> .data
<span class="zl_word">def</span> str_hello = <span class="zl_string">"Hello, world!"</span>,10,0

<span class="zl_word">#include</span> <span class="zl_string">&lt;stdio&gt;</span>
</pre>

Linux:

`zcc main.z main.asm -nasm:{-f elf32 main.o} -link:{main.o -o progra -melf_i386}`

![](example_helloworld2.png)

Windows:

`zcc main.z main.asm -nasm:{-f win32 main.o} -link:{main.o -o prog.exe}`

![](example_helloworld.png)
