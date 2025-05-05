// #include <stdio.h>
// #include <stdlib.h>
// #include <Python.h>
// #include "svdpi.h"
// #include <string.h>

// void clanguage()
// {
//     FILE *fp;
//     char path[1035];
//      printf("Otro holaaa HOLAAAAAaAaAaAaAaA\n");
//      fp = popen("python2.6 output2.py", "r");
//      if (fp == NULL) {
//          printf("Failed to run command\n" );
//          exit(1);
//     }
//     printf("Probando esto %s\n",fgets(path, sizeof(path),fp) ); // ESTE FUNCIONA
//    return 0;
// }

// ESTO DE ARRIBA SIRVEEEEE ...



#include <stdio.h>
#include <stdlib.h>
#include <Python.h>
#include "svdpi.h"
#include <string.h>


// int clanguage(int argc, char *argv[]){
//     FILE *fp;
//     char filename[] = "output.py";
//     Py_SetProgramName(argv[0]);
//     Py_Initialize();
//     PyRun_SimpleFile(fp, filename);
//     //PyRun_SimpleString("print 'Hello!!!!!'");
//     Py_Finalize();
//     return 0;

// }
 int clanguage (){
 	PyObject *pName, *pModule, *pArgs, *pValue, *pFunc;
	Py_Initialize();
	PyRun_SimpleString("import sys");
	PyRun_SimpleString("sys.path.append('')");
	pName = PyString_FromString("addition");
    pModule = PyImport_Import(pName);
    Py_DECREF(pName);

    pFunc = PyObject_GetAttrString(pModule, "doStuff");
	/*pArgs = PyTuple_New(1);
    pValue = PyInt_FromLong(4);
    PyTuple_SetItem(pArgs, 0, pValue);

    pValue = PyObject_CallObject(pFunc, pArgs);
    Py_DECREF(pArgs);
    printf("Returned val: %ld\n", PyInt_AsLong(pValue));
    Py_DECREF(pValue);

    Py_XDECREF(pFunc);
    Py_DECREF(pModule);*/

    Py_Finalize();

    return 0;

 }
