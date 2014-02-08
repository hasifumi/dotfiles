# file: test_fizzbuzz.py

import unittest
from appendimportPath import appendimportPath


class FizzBuzzTest(unittest.TestCase):

    def test_fizzbuzz(self):
        actual = fbm.fizzbuzz(3)
        self.assertEqual("Fizz", actual)


if __name__ == '__main__':
    appendimportPath("../src", __file__)
    import fizzbuzz_main as fbm
    #print sys.path
    unittest.main()
