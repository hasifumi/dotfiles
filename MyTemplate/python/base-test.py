# -*- coding:utf-8 -*-

import unittest
from {{_input_:variable}} import *  # test target


class TestFizzBuzz(unittest.TestCase):

    def setUp(self):
        # set up
        pass

    def tearDown(self):
        # end
        pass

    def testNewClass(self):
        #
        self.assertNotEqual(FizzBuzz(), None)


class TestRandom(unittest.TestCase):
    pass


if __name__ == '__main__':
    unittest.main()
