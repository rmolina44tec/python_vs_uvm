#include <svdpi.h> 
#include <stdio.h>
#include "vc_hdrs.h"
#include <stdlib.h>
#include <string.h>
//#define maxsize 3

// void chequeoC(int destino0, int destino1){
// 	printf ("destino0 es : %u \n", destino0);
// 	printf("destino1 es : %u \n", destino1);
// 	printf("Holiiiiiiis desde C\n");
// 	destino0 =destino1;
// }

char * binaryconverter (int , int , int , int );

int chequeoC ( 	int destino0,
				int destino1, 
				int destino2, 
				int destino3,  
				int fuente0,
				int fuente1, 
				int fuente2, 
				int fuente3, 
				int parte10, 
				int parte20, 
				int parte11, 
				int parte21, 
				int parte12, 
				int parte22, 
				int parte13, 
				int parte23, 
				int push_device0, 
	      		int push_device1, 
	      		int push_device2, 
	      		int push_device3, 
	      		int pndng_device0, 
	      		int pndng_device1, 
	      		int pndng_device2, 
	      		int pndng_device3, 
	      		int pop_device0, 
	      		int pop_device1, 
      			int pop_device2, 
      			int pop_device3, 
      			int D_pop_device0_fuente,
				int D_pop_device0_destino,
				int D_pop_device0_parte1,
				int D_pop_device0_parte2,
				int D_pop_device1_fuente,
				int D_pop_device1_destino,
				int D_pop_device1_parte1,
				int D_pop_device1_parte2,
				int D_pop_device2_fuente,
				int D_pop_device2_destino,
				int D_pop_device2_parte1,
				int D_pop_device2_parte2,
				int D_pop_device3_fuente,
				int D_pop_device3_destino,
				int D_pop_device3_parte1,
				int D_pop_device3_parte2,
				int i,
				int * resultado
		 	  	)

{
				printf("D_push_destino0 :%d \n", destino0);
				printf("PNDNG DEVICE1 :%d \n", pndng_device1);
				printf("POP_DEVICE1  :%d \n", pop_device1);
			  	//return veredicto;
			  	int j=0;
			  	int n=0;
			  	int l=0;
			  	char * fifo0_0;
			  	char * fifo0_1;
				char * fifo0_2;
				char * fifo1_0;
			  	char * fifo1_1;
				char * fifo1_2;
				char * fifo2_0;
			  	char * fifo2_1;
				char * fifo2_2;
				char * fifo3_0;
			  	char * fifo3_1;
				char * fifo3_2;
   	  			char * buffer_final;
   	  			char * D_popsi;
   	  			char pred [65] =""; 
   	  			D_popsi= binaryconverter(D_pop_device1_destino, D_pop_device1_fuente, D_pop_device1_parte1, D_pop_device1_parte2);
   	  			buffer_final= binaryconverter(destino0, fuente0, parte10, parte20);	
   	  			printf("BUFFER FINAL: %s \n", buffer_final);
			  	printf("CONCATENACIÓN del DPOPSI %s \n", D_popsi );
				printf("El valor de i:%d ", i);
			  	i=i++;
			  	printf("El valor de i:%d ", i);

			  	if (push_device0==1) { 
			        switch (destino0)
			        {
				    case 0: {return resultado=0;break;}						
						
					case 1: {return resultado=1;break;}

					case 2: {return resultado=2;break;}

					case 3: {return resultado=3;break;}

					default: {return resultado=4;break;}
					}
				}
				if (push_device1==1){
					switch (destino1)
			        {
 					case 0: {return resultado=5;break;}						
						
					case 1: {return resultado=6;break;}

					case 2: {return resultado=7;break;}

					case 3: {return resultado=8;break;}

					default: {return resultado=9;break;}
					}
				}
				if (push_device2==1){
					switch (destino2)
			        {
 					case 0: {return resultado=10;break;}						
						
					case 1: {return resultado=11;break;}

					case 2: {return resultado=12;break;}

					case 3: {return resultado=13;break;}

					default: {return resultado=14;break;}
					}
				}
				if (push_device3==1){
					switch (destino3)
			        {
 					case 0: {return resultado=15;break;}						
						
					case 1: {return resultado=16;break;}

					case 2: {return resultado=17;break;}

					case 3: {return resultado=18;break;}

					default: {return resultado=19;break;}
					}
				}
}
  				

  

char * binaryconverter (int destino, int fuente, int parte1, int parte2){
static char buffer [65] = ""; //string custom
int k ;
int c;
memset(buffer, 0, sizeof buffer);
//strcpy(buffer,"");
for (c = 2; c >= 0; c--)
  {
    k = destino >> c;
 
    if (k & 1)
      strcat(buffer, "1");
   
    else
      strcat(buffer, "0");
  }

for (c = 1; c >= 0; c--)
  {
    k = fuente >> c;
 
    if (k & 1)
     strcat(buffer, "1");
    
    else
      strcat(buffer, "0");
  }
for (c = 29; c >= 0; c--)
  {
    k = parte1 >> c;
 
    if (k & 1)
     strcat(buffer, "1");
      
    else
     strcat(buffer, "0");
  }
for (c = 29; c >= 0; c--)
  {
    k = parte2 >> c;
 
    if (k & 1)
      strcat(buffer, "1");
      
    else
      strcat(buffer, "0");
  }
  return buffer;
}









				          		// printf("ESTOY DESPUÉS DEL IF %d \n", i);
				          		// sprintf(reemplazo, "%d", destino0);
				            //   	strcat(buffer, reemplazo);
				            //   	printf("Haciendo una prueba con el printf %s \n", reemplazo );

				            //   	sprintf(reemplazo, "%d", fuente0); //itoa(fuente0, reemplazo,2);
				            //   	strcat(buffer, reemplazo);

				            //   	printf("Haciendo una prueba con el printf %s \n", reemplazo );
				            //   	sprintf(reemplazo, "%d", parte10);//itoa(parte10, reemplazo);
				            //   	strcat(buffer, reemplazo);
				            //   	printf("Haciendo una prueba con el printf %s \n", reemplazo );

				            //   	sprintf(reemplazo, "%d", parte20);//itoa(parte20, reemplazo);
				            //   	strcat(buffer, reemplazo);
				            //   	printf("Haciendo una prueba con el printf %s \n", reemplazo );
				            //   	printf("Este es el resultado final : %s\n", buffer);




