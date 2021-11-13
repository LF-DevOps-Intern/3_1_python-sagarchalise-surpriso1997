from os import read
import unittest 

from main import  save_html_in_a_file


class TestReq(unittest.TestCase):

    def test_file_saving(self, original_text):
        save_html_in_a_file(original_text)

        try:
            open_file= open("webpage.html", "r")

            read_text= open_file.read()

            self.assertEqual(original_text, read_text)
        except Exception as e: 
            print("An error occured while reading the file")
            print(e)

