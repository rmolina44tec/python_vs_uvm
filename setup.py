
# from distutils.core import setup, Extension
# setup(name = 'myModule', version = '1.0',  \
#    ext_modules = [Extension('myModule', ['test.c'])])


from distutils.core import setup, Extension

module1 = Extension('hello', sources = ['hellomodule.c'])

setup (name = 'PackageName',
        version = '1.0',
        description = 'This is a demo package',
        ext_modules = [module1])










# def add(a,b):
# 		c=a+b
# 		print "result is... ",c


# def someFunction(text):
#     print 'You passed this Python program '+text+' from C! Congratulations!'
#     return 12345




###############TERCER INTENTO#####


# test.test
# def test(value):
#     print '### test called'
# return value * 42