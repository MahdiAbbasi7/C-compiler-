%{
    #include<stdio.h>
	#include<stdlib.h>

    int sym[30];
    
%}


/* bison declarations */

%token NUM VAR IF ELSE ARRAY MAIN INT FLOAT CHAR BRACKETSTART BRACKETEND FOR WHILE ODDEVEN PRINTFUNCTION DEFAULT FUNCTION
%nonassoc IFX
%nonassoc ELSE

%left '<' '>'
%left '+' '-'
%left '*' '/'

/* Grammer rules */

%%

program: MAIN ':' BRACKETSTART  line BRACKETEND {printf("Main function END\n");}
	 ;

line: /* NULL */

	| line statement
	;

statement: ';'			
	| declaration ';'		{ printf("Declaration\n");}

	| expression ';' 			{   printf("\nvalue of expression: %d\n", $1); $$=$1;
        printf("\n.........................................\n");
        }

	| VAR '=' expression ';' { 
						printf("\nValue of the variable: %d\n",$3);
						sym[$1]=$3;
						$$=$3;
						printf("\n.........................................\n");
						}
	| WHILE '(' NUM '<' NUM ')' BRACKETSTART statement BRACKETEND  {
                                int i;
                                printf("WHILE Loop execution");
                                for(i=$3 ; i<$5 ; i++) {printf("\nvalue of the loop: %d expression value: %d\n", i,$8);}
                                printf("\n.........................................\n");									              
				               }
	| IF '(' expression ')' BRACKETSTART statement BRACKETEND %prec IFX {
							if($3){
								printf("\nvalue of expression in IF: %d\n",$6);
							}
							else{
								printf("\ncondition value zero in IF block\n");
							}

							printf("\n.........................................\n");
							}
	| IF '(' expression ')' BRACKETSTART statement BRACKETEND ELSE BRACKETSTART statement BRACKETEND {
								if($3){
									printf("value of expression in IF: %d\n",$6);
								}
								else{
									printf("value of expression in ELSE: %d\n",$11);
								}
								printf("\n.........................................\n");
							}
	| PRINTFUNCTION '(' expression ')' ';' {printf("\nPrint Expression %d\n",$3);
		printf("\n.........................................\n");}
	
    | FUNCTION VAR '(' expression ')' BRACKETSTART statement BRACKETEND {
		printf("FUNCTION found :  \n");
		printf("Function Parameter : %d\n",$4);
		printf("Function internal block statement : %d\n",$7);
		printf("\n.........................................\n");
	}

	| ARRAY TYPE VAR '(' NUM ')' ';' {
		printf("ARRAY Declaration\n");
		
		printf("Size of the ARRAY is : %d\n",$5);
		printf("\n.........................................\n");
	}

	| FOR '(' NUM ',' NUM ',' NUM ')' BRACKETSTART  statement BRACKETEND {
                                int i;
                                printf("FOR Loop execution");
                                for(i=$3 ; i<$5 ; i=i+$7 ) 
                                {printf("\nvalue of the  i: %d expression value : %d\n", i,$10);}
                                printf("\n.........................................\n");
				               }
    ;


declaration : TYPE ID1   {printf("\nvariable Dection\n");
		printf("\n.........................................\n");}
            ;

TYPE : INT   {printf("interger declaration\n");}
    | FLOAT  {printf("float declaration\n");}
    | CHAR   {printf("char declaration\n");}
    ;

ID1 : ID1 ',' VAR  
    |VAR  
    ;


expression: NUM					{ printf("\nNumber :  %d\n",$1 ); $$ = $1;  }

	| VAR						{ $$ = sym[$1]; }
	
	| expression '+' expression	{printf("\nAddition :%d+%d = %d \n",$1,$3,$1+$3 );  $$ = $1 + $3;}

	| expression '-' expression	{printf("\nSubtraction :%d-%d=%d \n ",$1,$3,$1-$3); $$ = $1 - $3; }

	| expression '*' expression	{printf("\nMultiplication :%d*%d \n ",$1,$3,$1*$3); $$ = $1 * $3; }

	| expression '/' expression	{ if($3){
				     					printf("\nDivision :%d/%d \n ",$1,$3,$1/$3);
				     					$$ = $1 / $3;
				     					
				  					}
				  					else{
										$$ = 0;
										printf("\ndivision by zero\n\t");
				  					} 	
				    			}
	| expression '%' expression	{ if($3){
				     					printf("\nMod :%d % %d \n",$1,$3,$1 % $3);
				     					$$ = $1 % $3;
				     					
				  					}
				  					else{
										$$ = 0;
										printf("\nMOD by zero\n");
				  					} 	
				    			}
	| expression '<' expression	{printf("\nLess Than :%d < %d \n",$1,$3,$1 < $3); $$ = $1 < $3 ; }
	
	| expression '>' expression	{printf("\nGreater than :%d > %d \n ",$1,$3,$1 > $3); $$ = $1 > $3; }

	| '(' expression ')'		{	 $$ = $2; }
	;

%%

int  yyerror(char *s){
	printf( "%s\n", s);
}
int yywrap()
{
	return 1;
}

int main(){

	freopen("input.txt","r",stdin);

	freopen("output.txt","w",stdout);
	yyparse();

	printf("\n**********************************\n");

	printf("All the input parsing complete \n");
	
	printf("\n**********************************\n");
	printf("\n**********************************\n");

	printf("Name : MahdiAbbasi\n");
	printf("NumberofStudent :1607048\n");
	printf("Proffesor : E.Musavi\n");
	printf("Department : CE\n");
	printf("University : ShahedUniversity\n");
	printf("Email : abbasimahdi782@gmail.com\n");
	printf("\n**********************************\n");    
	return 0;

}
