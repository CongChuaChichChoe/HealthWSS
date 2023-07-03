from bs4 import BeautifulSoup
import requests
import time
from tqdm import tqdm

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

def get_title_insize(url):
    html =get_page(url)
    data_title_insize = html.find('h1')
    # print(data_title_insize)
    return data_title_insize.text

def get_price_insize(url):
    html =get_page(url)   
    data_price_insize = html.find('span', class_="price-from")
    return data_price_insize.text

def get_location_count_insize(url):
    html = get_page(url)
    data_location_count_insize = html.find('span', class_="total-result")
    return data_location_count_insize.text

def get_title(url):
    html =get_page(url)
    data_title = html.find('h3')
    # print(data_title.text)
    return data_title.text

def main():
    soup = get_page("https://websosanh.vn/dien-lanh/cat-1867.htm")
    # Find all <a> tags
    li_tags = soup.find_all('li', class_="product-item")
    # print(a_tags)

    urls = []
    titles = []
    i = 0
    print(len(li_tags))
    for li in li_tags:
        url = li.a.get("href")
        if "/so-sanh.htm" in url:
            try:
                print(li.h3.text)
                print((li.find_all("span", class_="product-price")[0].text).split()[2])
                print((li.find_all("span", class_="product-store row-full")[0].text).split()[3])
                print(get_title_insize(url))
                print(get_price_insize(url))
                print(get_location_count_insize(url))
                time.sleep(1)
                print("\n")
            except:
                print(url)
                print(get_location_count_insize(url))
            i += 1
            if i == 10:
                break
        else:
            continue

main()