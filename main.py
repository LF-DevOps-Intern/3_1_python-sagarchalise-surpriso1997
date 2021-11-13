
import subprocess
import requests
import argparse

parser = argparse.ArgumentParser("Simple HTTP File Server and Downloading")

parser.add_argument(
    '--http_server', help="To serve the url file downloaded", action='store_true')
parser.add_argument(
    '--url', help="Add the Link to the URL after this flag", type=str, required=True)

arguments = parser.parse_args()


def get_web_page(url):
    try:
     response = requests.get(url).text
     return response
    except: 
     print("An error occured while fetching the web page")


def save_html_in_a_file(text):
    
    try:
        file_created= open("webpage.html", "w+")
        file_created.write(text)
        return file_created
    except: 
        print("An error occured while saving the web page file")
  


if arguments.http_server:
    web_html_text=   get_web_page()
    save_html_in_a_file(web_html_text)

    subprocess.run('python -m http.server -d webpage.html'.split())

else:
    get_web_page()
