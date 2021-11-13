
import subprocess
import requests
import argparse

parser = argparse.ArgumentParser("This cli program dowloads a web page from the provided arguments")

parser.add_argument(
    '--http_server', help="Optional value which servers the downlaoded web page", action='store_true')
parser.add_argument(
    '--url', help="Please add the desired url at the end", type=str, required=True)




arguments = parser.parse_args()


def get_web_page(url):
    try:
     response = requests.get(url, timeout=10).text

     return response
    except Exception as e: 
        
     print("An error occured while fetching the web page:\n")
     print(e)



def save_html_in_a_file(text):
    
    try:
        file_created= open("webpage.html", "w+")
        file_created.write(text)
        return file_created
    except Exception as e: 
        print("An error occured while saving the web page file: \n")
        print(e)
  


if arguments.http_server:

    web_html_text= get_web_page()
    if(web_html_text==None):
        pass
    save_html_in_a_file(web_html_text)

    subprocess.run('python -m http.server -d webpage.html'.split())

else:
    get_web_page()
