#Using flex/bison for create C compiler

<h2>Mahdi Abbasi </h2>
<h3>Professor Ehsan Mousavi </h3>
<h4>Shahed University - 2023 </h4>


<h2>Features of the Project</h2>
<ol>
	<li>header file</li>
	<li>Main function</li>
	<li>Comments</li>
	<li>Variable declaration</li>
	<li>IF ELSE  Block</li>
	<li>Variable assignment</li>
	<li>Array Declaration</li>
	<li>For loop</li>
	<li>While loop </li>
	<li>Print function</li>
	<li>Functions</li>

</ol>

<h2>How to use</h2>

1- for create the lex.yy.c
```bash
   bison -d main.y
```
2- for create the main.tab.c and main.tab.y files
```bash
   flex main.l
```
3- for create the a.out file
```bash
   gcc lex.yy.c main.tab.c
```
3.1- for windows user :
```bash
   gcc lex.yy.c main.tab.c -o a.exe
```
4- after below commands run 
```bash
    ./a.out < input.txt
```

<h3>see result in output.txt </h3>
<h4>Note: if you want to see another result after your changes delete output.txt and run again commands.</h4>


