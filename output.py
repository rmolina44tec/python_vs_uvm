print 'Hello!!!!!11'


PyObject *v = PyObject_GetAttrString(m,"foobar"):

int foobar = PyInt_AsLong(v);

Py_DECREF(v);