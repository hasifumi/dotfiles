# file: test_fizzbuzz.py

import sys
import os


def appendimportPath(path, base=None):
    if base:
        p = os.path.abspath(
            os.path.join(
                os.path.abspath(
                    os.path.dirname(base)
                ), path
            )
        )
    else:
        p = path
    #print p
    sys.path.append(p)

 
if __name__ == '__main__':
    pass
    #print sys.path
    #appendimportPath("../src", __file__)
    #print sys.path
