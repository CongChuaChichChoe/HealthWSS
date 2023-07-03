from bs4 import BeautifulSoup
import requests
import time
from tqdm import tqdm
url = "https://websosanh.vn"

def get_page(url):
    response = requests.get(url)

    # Parse the HTML content using BeautifulSoup
    soup =  BeautifulSoup(response.content, 'html.parser')
    return soup

def filter_url(urls):
    res = []
    for url in urls:
        if "/so-sanh.htm" in url:
            res.append(url)
    return res

def get_span_price(url):
    html =get_page(url)
    data_span_price = html.find('span', class_='price-from')
    # print(data_span_price.text)
    return data_span_price.text


def main():
    soup = get_page("https://websosanh.vn")
    span_tag = soup.find_all('span', class_='product-box-price')
    a_tags = soup.find_all('a')

    span_home = []
    for tag in span_tag:
        span_home.append(tag.text) 
    print(len(span_tag))     

    span_insize = []
    urls = []
    for a in a_tags:
        url = a.get('href')
        if "/so-sanh.htm" in url:
            # get_span_price(url)
            urls.append(url)
            span_insize.append(get_span_price(url))

    


main()        