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
    # print(data_title_insize.text)
def get_title(url):
    html =get_page(url)
    data_title = html.find('h3')
    # print(data_title.text)
    return data_title.text

def main():
    soup = get_page("https://websosanh.vn")
    # Find all <a> tags
    li_tags = soup.find_all('li', class_="product-box-item")
    # print(a_tags)

    urls = []
    titles = []
    i = 0
    for li in li_tags:
        print(li.h3.text)
        print(li.find_all("span", class_="product-box-price")[0].text)
        print((li.find_all("span", class_="product-box-store")[0].text).split()[1])
        url = li.a.get("href")
        print(get_title_insize(url))
        print(get_price_insize(url))
        print(get_location_count_insize(url))
        break

        # url = li.get('href')
        # if "/so-sanh.htm" in url:
        #     title = a.h3.text
        #     titles.append(title)
        #     urls.append(url)
    
    # urls = filter_url(urls)
    # print(len(urls))
    # wname = []
    # titles2 = []
    # for i in tqdm(range(len(urls))):
    #     if titles[i] != get_title_insize(urls[i]):
    #         wname.append(titles[i])
    #     # titles2.append(get_title_insize(url))
    #     time.sleep(0.5)

    # print("\n")
    # print(wname)


main()