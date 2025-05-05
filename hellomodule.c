// #include <stdio.h>
// #include <stdlib.h>

// int main(void) {
//   short a[] = {31415, 9265, 3589, 793};
//   size_t n = sizeof a / sizeof *a;
//   if (fwrite(&n, sizeof n, 1, stdout) != 1) exit(EXIT_FAILURE); /* send size */
//   return (fwrite(a, sizeof *a, n, stdout) < n) ? EXIT_FAILURE : EXIT_SUCCESS;
// }


#include <usr/include/python2.6/Python.h>
#include "svdpi.h"

static PyObject*
say_hello(PyObject* self, PyObject* args)
{
    const char* name;
    printf("Estoy en C Holiiii \n");
    if (!PyArg_ParseTuple(args, "s", &name))
        return NULL;

    printf("Hello %s!\n", name);

    Py_RETURN_NONE;
}

static PyMethodDef HelloMethods[] =
{
     {"say_hello", say_hello, METH_VARARGS, "Greet somebody."},
     {NULL, NULL, 0, NULL}
};

PyMODINIT_FUNC
inithello(void)
{
     (void) Py_InitModule("hello", HelloMethods);
}



















// #include <Python.h>

// static PyObject* greet(PyObject* self, PyObject* args)
// {
//     const char* name;

//     /* Parse the input, from Python string to C string */
//     if (!PyArg_ParseTuple(args, "s", &name))
//         return NULL;
//     /* If the above function returns -1, an appropriate Python exception will
//      * have been set, and the function simply returns NULL
//      */

//     printf("Hello %s\n", name);

//     /* Returns a None Python object */
//     Py_RETURN_NONE;
// }

// /* Define functions in module */
// static PyMethodDef HelloMethods[] = {
//     {"greet", greet, METH_VARARGS, "Greet somebody (in C)."},
//     {NULL, NULL, 0, NULL}  /* Sentinel */
// };

// /* Module initialization */
// PyMODINIT_FUNC
// inithello(void)
// {
//     (void) Py_InitModule("hello", HelloMethods);
// }
